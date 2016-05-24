package com.behance.sdk.services;

import android.app.Activity;
import android.app.IntentService;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.support.v4.app.NotificationCompat.BigTextStyle;
import android.support.v4.app.NotificationCompat.Builder;
import android.support.v4.content.LocalBroadcastManager;
import com.adobe.creativesdk.foundation.internal.analytics.AdobeAnalyticsSDKReporter;
import com.behance.sdk.BehanceSDKSocialAccountManager;
import com.behance.sdk.R.drawable;
import com.behance.sdk.R.string;
import com.behance.sdk.asynctasks.BehanceSDKPublishWIPResult;
import com.behance.sdk.asynctasks.BehanceSDKPublishWIPResult.PublishStatus;
import com.behance.sdk.dto.BehanceSDKPublishWIPServiceParamsDTO;
import com.behance.sdk.dto.BehanceSDKPublishWIPStatusDTO;
import com.behance.sdk.dto.BehanceSDKPublishedWIPRevisionDTO;
import com.behance.sdk.enums.BehanceSDKPublishWIPProgressState;
import com.behance.sdk.enums.BehanceSDKSocialAccountType;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.managers.BehanceSDKUserManager;
import com.behance.sdk.project.modules.ProjectModule;
import com.behance.sdk.project.modules.ProjectModuleTypes;
import com.behance.sdk.services.binders.BehanceSDKPublishWIPBinder;
import com.behance.sdk.util.BehanceSDKHTTPUtils;
import com.behance.sdk.util.BehanceSDKUrlUtil;
import com.behance.sdk.util.CustomHttpEntityWrapper;
import com.behance.sdk.util.CustomHttpEntityWrapper.CustomHttpEntityWrapperCallback;
import com.facebook.FacebookRequestError;
import com.facebook.HttpMethod;
import com.facebook.Request;
import com.facebook.Response;
import com.facebook.Session;
import java.net.URI;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import oauth.signpost.OAuthConsumer;
import oauth.signpost.commonshttp.CommonsHttpOAuthConsumer;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;

public class BehanceSDKPublishWIPService
  extends IntentService
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKPublishWIPService.class);
  private String activePublishRequestId;
  private BehanceSDKUserManager sdkUserManager;
  private BehanceSDKPublishWIPBinder wipBinder;
  
  public BehanceSDKPublishWIPService()
  {
    super("Behance Publish Work in Progress Service");
  }
  
  private void broadcastStatusUpdate(BehanceSDKPublishWIPStatusDTO paramBehanceSDKPublishWIPStatusDTO)
  {
    if (!isActiveUploadCancelled())
    {
      if (paramBehanceSDKPublishWIPStatusDTO.getProgressState() != BehanceSDKPublishWIPProgressState.PUBLISH_SUCCESSFUL) {
        break label62;
      }
      AdobeAnalyticsSDKReporter.trackSharingAction(AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTypePublishSuccess, AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTargetBehanceWIP);
    }
    for (;;)
    {
      paramBehanceSDKPublishWIPStatusDTO.setPublishRequestId(activePublishRequestId);
      Intent localIntent = new Intent("com.behance.sdk.INTENT_ACTION_WIP_PUBLISH_STATUS_BROADCAST");
      localIntent.putExtra("com.behance.sdk.INTENT_EXTRA_KEY_WIP_PUBLISH_STATUS_BROADCAST_DATA", paramBehanceSDKPublishWIPStatusDTO);
      LocalBroadcastManager.getInstance(this).sendBroadcast(localIntent);
      return;
      label62:
      if (paramBehanceSDKPublishWIPStatusDTO.getProgressState() == BehanceSDKPublishWIPProgressState.PUBLISH_FAILED) {
        AdobeAnalyticsSDKReporter.trackSharingAction(AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTypePublishFailure, AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTargetBehanceWIP);
      }
    }
  }
  
  private void broadcastUploadCancelledStatusUpdate()
  {
    logger.debug("Publish WIP cancelled. Broadcasting message", new Object[0]);
    BehanceSDKPublishWIPStatusDTO localBehanceSDKPublishWIPStatusDTO = new BehanceSDKPublishWIPStatusDTO();
    localBehanceSDKPublishWIPStatusDTO.setPublishRequestId(activePublishRequestId);
    localBehanceSDKPublishWIPStatusDTO.setProgressState(BehanceSDKPublishWIPProgressState.CANCEL_PUBLISH_SUCCESSFUL);
    localBehanceSDKPublishWIPStatusDTO.setProgressPercentage(getProgressPercentage(BehanceSDKPublishWIPProgressState.CANCEL_PUBLISH_SUCCESSFUL, null));
    Intent localIntent = new Intent("com.behance.sdk.INTENT_ACTION_WIP_PUBLISH_STATUS_BROADCAST");
    localIntent.putExtra("com.behance.sdk.INTENT_EXTRA_KEY_WIP_PUBLISH_STATUS_BROADCAST_DATA", localBehanceSDKPublishWIPStatusDTO);
    LocalBroadcastManager.getInstance(this).sendBroadcast(localIntent);
  }
  
  private void cleanupCreativeCloudAsset(ProjectModule paramProjectModule)
  {
    if (paramProjectModule.getType() == ProjectModuleTypes.CREATIVECLOUD_ASSET) {
      paramProjectModule.deleteFromFileSystem();
    }
  }
  
  private int convertImageUploadProgressPercentage(BehanceSDKPublishWIPServiceParamsDTO paramBehanceSDKPublishWIPServiceParamsDTO, int paramInt)
  {
    int i = getProgressPercentage(BehanceSDKPublishWIPProgressState.PUBLISH_STARTED, paramBehanceSDKPublishWIPServiceParamsDTO);
    return i + paramInt * (getProgressPercentage(BehanceSDKPublishWIPProgressState.IMAGE_UPLOAD_SUCCESSFUL, paramBehanceSDKPublishWIPServiceParamsDTO) - i) / 100;
  }
  
  private Intent createNotifyIntent(Class<? extends Activity> paramClass)
  {
    paramClass = new Intent(this, paramClass);
    paramClass.setFlags(268435456);
    return paramClass;
  }
  
  private PendingIntent createPendingIntent(Intent paramIntent)
  {
    return PendingIntent.getActivity(this, 0, paramIntent, 134217728);
  }
  
  private int getProgressPercentage(BehanceSDKPublishWIPProgressState paramBehanceSDKPublishWIPProgressState, BehanceSDKPublishWIPServiceParamsDTO paramBehanceSDKPublishWIPServiceParamsDTO)
  {
    switch (2.$SwitchMap$com$behance$sdk$enums$BehanceSDKPublishWIPProgressState[paramBehanceSDKPublishWIPProgressState.ordinal()])
    {
    default: 
      return 0;
    case 1: 
      return 10;
    case 2: 
      if ((paramBehanceSDKPublishWIPServiceParamsDTO.isShareOnFacebook()) && (paramBehanceSDKPublishWIPServiceParamsDTO.isShareOnTwitter())) {
        return 50;
      }
      if ((paramBehanceSDKPublishWIPServiceParamsDTO.isShareOnFacebook()) || (paramBehanceSDKPublishWIPServiceParamsDTO.isShareOnTwitter())) {
        return 70;
      }
      return 90;
    case 3: 
    case 4: 
      if (paramBehanceSDKPublishWIPServiceParamsDTO.isShareOnTwitter()) {
        return 70;
      }
      return 90;
    case 5: 
    case 6: 
      return 90;
    }
    return 100;
  }
  
  private void handleCancelAfterSuccessfulUpload(BehanceSDKPublishedWIPRevisionDTO paramBehanceSDKPublishedWIPRevisionDTO, BehanceSDKPublishWIPServiceParamsDTO paramBehanceSDKPublishWIPServiceParamsDTO)
  {
    localBehanceSDKPublishWIPStatusDTO = new BehanceSDKPublishWIPStatusDTO();
    localBehanceSDKPublishWIPStatusDTO.setPublishRequestId(activePublishRequestId);
    localBehanceSDKPublishWIPStatusDTO.setProgressPercentage(getProgressPercentage(BehanceSDKPublishWIPProgressState.CANCEL_PUBLISH_SUCCESSFUL, null));
    for (;;)
    {
      try
      {
        Object localObject = new HashMap();
        ((Map)localObject).put("clientId", paramBehanceSDKPublishWIPServiceParamsDTO.getAppClientId());
        ((Map)localObject).put("wip_id", String.valueOf(paramBehanceSDKPublishedWIPRevisionDTO.getWipId()));
        ((Map)localObject).put("wip_revision_id", String.valueOf(paramBehanceSDKPublishedWIPRevisionDTO.getRevisionId()));
        paramBehanceSDKPublishWIPServiceParamsDTO = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/wips/{wip_id}/{wip_revision_id}?{key_client_id_param}={clientId}", (Map)localObject);
        localObject = sdkUserManager.checkExpiryAndGetAccessToken();
        paramBehanceSDKPublishedWIPRevisionDTO = paramBehanceSDKPublishWIPServiceParamsDTO;
        if (localObject != null) {
          paramBehanceSDKPublishedWIPRevisionDTO = BehanceSDKUrlUtil.appendQueryStringParam(paramBehanceSDKPublishWIPServiceParamsDTO, "access_token", localObject);
        }
        paramBehanceSDKPublishWIPServiceParamsDTO = new HttpDelete(paramBehanceSDKPublishedWIPRevisionDTO);
        logger.debug("Publish WIP cancelled after successful upload. Deleting WIP [URL - %s]", new Object[] { paramBehanceSDKPublishedWIPRevisionDTO });
        paramBehanceSDKPublishWIPServiceParamsDTO = BehanceSDKHTTPUtils.getHttpClient().execute(paramBehanceSDKPublishWIPServiceParamsDTO);
        paramBehanceSDKPublishedWIPRevisionDTO = paramBehanceSDKPublishWIPServiceParamsDTO.getStatusLine();
        logger.debug("Delete WIP Revision HTTP response code - %s", new Object[] { Integer.valueOf(paramBehanceSDKPublishedWIPRevisionDTO.getStatusCode()) });
        paramBehanceSDKPublishWIPServiceParamsDTO = EntityUtils.toString(paramBehanceSDKPublishWIPServiceParamsDTO.getEntity());
        logger.debug("Delete WIP Revision server response - %s", new Object[] { paramBehanceSDKPublishWIPServiceParamsDTO });
        if (paramBehanceSDKPublishedWIPRevisionDTO.getStatusCode() != 200) {
          continue;
        }
        localBehanceSDKPublishWIPStatusDTO.setProgressState(BehanceSDKPublishWIPProgressState.CANCEL_PUBLISH_SUCCESSFUL);
      }
      catch (Throwable paramBehanceSDKPublishedWIPRevisionDTO)
      {
        localBehanceSDKPublishWIPStatusDTO.setProgressState(BehanceSDKPublishWIPProgressState.CANCEL_PUBLISH_FAILED);
        localBehanceSDKPublishWIPStatusDTO.setException(paramBehanceSDKPublishedWIPRevisionDTO);
        logger.error(paramBehanceSDKPublishedWIPRevisionDTO, "Problem deleting WIP Revision", new Object[0]);
        continue;
      }
      paramBehanceSDKPublishedWIPRevisionDTO = new Intent("com.behance.sdk.INTENT_ACTION_WIP_PUBLISH_STATUS_BROADCAST");
      paramBehanceSDKPublishedWIPRevisionDTO.putExtra("com.behance.sdk.INTENT_EXTRA_KEY_WIP_PUBLISH_STATUS_BROADCAST_DATA", localBehanceSDKPublishWIPStatusDTO);
      LocalBroadcastManager.getInstance(this).sendBroadcast(paramBehanceSDKPublishedWIPRevisionDTO);
      return;
      localBehanceSDKPublishWIPStatusDTO.setProgressState(BehanceSDKPublishWIPProgressState.CANCEL_PUBLISH_FAILED);
    }
  }
  
  private boolean isActiveUploadCancelled()
  {
    if (wipBinder != null) {
      return wipBinder.isUploadCancelled(activePublishRequestId);
    }
    return false;
  }
  
  private BehanceSDKPublishWIPStatusDTO publishOnFacebook(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    paramString2 = new BehanceSDKPublishWIPStatusDTO();
    try
    {
      Session localSession = Session.getActiveSession();
      if (localSession != null)
      {
        Bundle localBundle = new Bundle();
        localBundle.putString("name", paramString1);
        localBundle.putString("link", paramString3);
        if ((paramString4 != null) && (paramString4.length() > 0)) {
          localBundle.putString("picture", paramString4);
        }
        if (!isActiveUploadCancelled())
        {
          paramString1 = new Request(localSession, "me/feed", localBundle, HttpMethod.POST, null).executeAndWait().getError();
          if (paramString1 != null)
          {
            logger.debug("Problem sharing WIP on Facebook [Message - %s]", new Object[] { paramString1.toString() });
            logger.error("Problem sharing WIP on Facebook [Message - %s]", new Object[] { paramString1.getErrorUserMessage() });
            paramString2.setProgressState(BehanceSDKPublishWIPProgressState.SHARE_ON_FACEBOOK_FAILED);
            paramString2.setErrorMessage(paramString1.getErrorUserMessage());
            return paramString2;
          }
          logger.debug("Successfully shared WIP on Facebook", new Object[0]);
          paramString2.setProgressState(BehanceSDKPublishWIPProgressState.SHARE_ON_FACEBOOK_SUCCESSFUL);
          return paramString2;
        }
      }
    }
    catch (Throwable paramString1)
    {
      logger.error(paramString1, "Problem sharing WIP on Facebook", new Object[0]);
      paramString2.setProgressState(BehanceSDKPublishWIPProgressState.SHARE_ON_FACEBOOK_FAILED);
      paramString2.setErrorMessage(paramString1.getMessage());
      paramString2.setException(paramString1);
    }
    return paramString2;
  }
  
  private BehanceSDKPublishWIPStatusDTO publishOnTwitter(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    BehanceSDKPublishWIPStatusDTO localBehanceSDKPublishWIPStatusDTO = new BehanceSDKPublishWIPStatusDTO();
    int i;
    try
    {
      paramString3 = new CommonsHttpOAuthConsumer(paramString3, paramString4);
      paramString3.setTokenWithSecret(paramString1, paramString2);
      paramString1 = URLEncoder.encode(getString(R.string.bsdk_publish_wip_service_publish_on_twitter_msg, new Object[] { paramString5 }), "UTF-8");
      paramString1 = "https://api.twitter.com/1.1/statuses/update.json?status=" + paramString1;
      if (isActiveUploadCancelled()) {
        break label368;
      }
      paramString1 = new URI(paramString1);
      paramString2 = new HttpPost(paramString1);
      logger.debug("Share on Twitter URL is [URL - %s]", new Object[] { paramString1.toString() });
      paramString3.sign(paramString2);
      paramString1 = new DefaultHttpClient().execute(paramString2);
      i = paramString1.getStatusLine().getStatusCode();
      if (i == 200)
      {
        logger.debug("Successfully shared WIP on Twitter", new Object[0]);
        localBehanceSDKPublishWIPStatusDTO.setProgressState(BehanceSDKPublishWIPProgressState.SHARE_ON_TWITTER_SUCCESSFUL);
        return localBehanceSDKPublishWIPStatusDTO;
      }
      if (i == 401)
      {
        logger.error("Twitter User token has been revoked. [Error code - %s - message - %s]", new Object[] { Integer.valueOf(i), paramString1.getStatusLine().getReasonPhrase() });
        unlinkTwitterAccount();
        localBehanceSDKPublishWIPStatusDTO.setProgressState(BehanceSDKPublishWIPProgressState.SHARE_ON_TWITTER_FAILED);
        localBehanceSDKPublishWIPStatusDTO.setErrorMessage(paramString1.getStatusLine().getReasonPhrase());
        return localBehanceSDKPublishWIPStatusDTO;
      }
    }
    catch (Throwable paramString1)
    {
      logger.error(paramString1, "Error sharing WIP on Twitter", new Object[0]);
      localBehanceSDKPublishWIPStatusDTO.setProgressState(BehanceSDKPublishWIPProgressState.SHARE_ON_TWITTER_FAILED);
      localBehanceSDKPublishWIPStatusDTO.setErrorMessage(paramString1.getMessage());
      localBehanceSDKPublishWIPStatusDTO.setException(paramString1);
      return localBehanceSDKPublishWIPStatusDTO;
    }
    logger.error("Error sharing WIP on Twitter. [Error code - %s - message - %s]", new Object[] { Integer.valueOf(i), paramString1.getStatusLine().getReasonPhrase() });
    localBehanceSDKPublishWIPStatusDTO.setProgressState(BehanceSDKPublishWIPProgressState.SHARE_ON_TWITTER_FAILED);
    localBehanceSDKPublishWIPStatusDTO.setErrorMessage(paramString1.getStatusLine().getReasonPhrase());
    label368:
    return localBehanceSDKPublishWIPStatusDTO;
  }
  
  private BehanceSDKPublishWIPResult publishWIPOnServer(final BehanceSDKPublishWIPServiceParamsDTO paramBehanceSDKPublishWIPServiceParamsDTO)
  {
    BehanceSDKPublishWIPResult localBehanceSDKPublishWIPResult = new BehanceSDKPublishWIPResult();
    ProjectModule localProjectModule = paramBehanceSDKPublishWIPServiceParamsDTO.getWipImageFile();
    for (;;)
    {
      int i;
      try
      {
        localObject1 = new HashMap();
        ((Map)localObject1).put("clientId", paramBehanceSDKPublishWIPServiceParamsDTO.getAppClientId());
        if (paramBehanceSDKPublishWIPServiceParamsDTO.getWipId() <= 0) {
          continue;
        }
        ((Map)localObject1).put("wip_id", String.valueOf(paramBehanceSDKPublishWIPServiceParamsDTO.getWipId()));
        localObject1 = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/wips/{wip_id}?{key_client_id_param}={clientId}", (Map)localObject1);
        Object localObject3 = sdkUserManager.checkExpiryAndGetAccessToken();
        localObject2 = localObject1;
        if (localObject3 != null) {
          localObject2 = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject1, "access_token", localObject3);
        }
        localObject2 = new HttpPost((String)localObject2);
        localObject3 = MultipartEntityBuilder.create();
        ContentType localContentType = ContentType.create("text/plain", "UTF-8");
        ((MultipartEntityBuilder)localObject3).setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
        ((MultipartEntityBuilder)localObject3).addPart("image", new FileBody(localProjectModule.getFile()));
        if (paramBehanceSDKPublishWIPServiceParamsDTO.getWipTitle() != null) {
          ((MultipartEntityBuilder)localObject3).addTextBody("title", paramBehanceSDKPublishWIPServiceParamsDTO.getWipTitle().trim(), localContentType);
        }
        ((MultipartEntityBuilder)localObject3).addTextBody("description", paramBehanceSDKPublishWIPServiceParamsDTO.getWipDescription(), localContentType);
        ((MultipartEntityBuilder)localObject3).addTextBody("tags", paramBehanceSDKPublishWIPServiceParamsDTO.getWipTags(), localContentType);
        if (!paramBehanceSDKPublishWIPServiceParamsDTO.isContainsAdultContent()) {
          break label864;
        }
        localObject1 = "1";
        ((MultipartEntityBuilder)localObject3).addTextBody("mature", (String)localObject1, localContentType);
        ((HttpPost)localObject2).setEntity(new CustomHttpEntityWrapper(((MultipartEntityBuilder)localObject3).build(), new CustomHttpEntityWrapper.CustomHttpEntityWrapperCallback()
        {
          private int lastBroadcastedProgressPercentage = 0;
          
          public void onUploadProgressUpdate(float paramAnonymousFloat)
          {
            int i = (int)paramAnonymousFloat;
            if ((i % 10 == 0) && (lastBroadcastedProgressPercentage != i))
            {
              lastBroadcastedProgressPercentage = i;
              if (i < 100)
              {
                BehanceSDKPublishWIPStatusDTO localBehanceSDKPublishWIPStatusDTO = new BehanceSDKPublishWIPStatusDTO();
                localBehanceSDKPublishWIPStatusDTO.setProgressState(BehanceSDKPublishWIPProgressState.IMAGE_UPLOAD_IN_PROGRESS);
                localBehanceSDKPublishWIPStatusDTO.setProgressPercentage(BehanceSDKPublishWIPService.this.convertImageUploadProgressPercentage(paramBehanceSDKPublishWIPServiceParamsDTO, i));
                BehanceSDKPublishWIPService.this.broadcastStatusUpdate(localBehanceSDKPublishWIPStatusDTO);
                if (BehanceSDKPublishWIPService.this.isActiveUploadCancelled()) {
                  val$httpPost.abort();
                }
              }
            }
          }
        }));
        localObject1 = BehanceSDKHTTPUtils.getHttpClient();
        if (!isActiveUploadCancelled())
        {
          localObject2 = ((HttpClient)localObject1).execute((HttpUriRequest)localObject2);
          localObject1 = ((HttpResponse)localObject2).getStatusLine();
          localObject2 = EntityUtils.toString(((HttpResponse)localObject2).getEntity());
          logger.debug("Publish WIP json response [%s]", new Object[] { localObject2 });
          if (((StatusLine)localObject1).getStatusCode() != 201) {
            continue;
          }
          localBehanceSDKPublishWIPResult.setStatus(BehanceSDKPublishWIPResult.PublishStatus.SUCCESS);
          localObject1 = new BehanceSDKPublishedWIPRevisionDTO();
          localObject2 = new JSONObject((String)localObject2);
          localObject3 = ((JSONObject)localObject2).optJSONObject("wip");
          if (localObject3 == null) {
            continue;
          }
          ((BehanceSDKPublishedWIPRevisionDTO)localObject1).setWipTitle(((JSONObject)localObject3).optString("title"));
          paramBehanceSDKPublishWIPServiceParamsDTO = ((JSONObject)localObject3).optJSONObject("revisions");
          if (paramBehanceSDKPublishWIPServiceParamsDTO != null)
          {
            localObject2 = paramBehanceSDKPublishWIPServiceParamsDTO.names();
            if ((localObject2 != null) && (((JSONArray)localObject2).length() > 0))
            {
              i = 0;
              if (i < ((JSONArray)localObject2).length())
              {
                localObject3 = paramBehanceSDKPublishWIPServiceParamsDTO.optJSONObject(((JSONArray)localObject2).getString(i));
                if (localObject3 == null) {
                  break label871;
                }
                ((BehanceSDKPublishedWIPRevisionDTO)localObject1).setRevisionId(((JSONObject)localObject3).optInt("id"));
                ((BehanceSDKPublishedWIPRevisionDTO)localObject1).setRevisionURL(((JSONObject)localObject3).optString("url"));
                ((BehanceSDKPublishedWIPRevisionDTO)localObject1).setRevisionDescription(((JSONObject)localObject3).optString("description"));
                ((BehanceSDKPublishedWIPRevisionDTO)localObject1).setWipId(((JSONObject)localObject3).optInt("wip_id"));
                paramBehanceSDKPublishWIPServiceParamsDTO = ((JSONObject)localObject3).optJSONObject("images");
                if (paramBehanceSDKPublishWIPServiceParamsDTO != null)
                {
                  paramBehanceSDKPublishWIPServiceParamsDTO = paramBehanceSDKPublishWIPServiceParamsDTO.optJSONObject("normal_resolution");
                  if (paramBehanceSDKPublishWIPServiceParamsDTO != null) {
                    ((BehanceSDKPublishedWIPRevisionDTO)localObject1).setWipImageURL(paramBehanceSDKPublishWIPServiceParamsDTO.optString("url"));
                  }
                }
              }
            }
          }
          localBehanceSDKPublishWIPResult.setPublishedWIP((BehanceSDKPublishedWIPRevisionDTO)localObject1);
        }
      }
      catch (Exception paramBehanceSDKPublishWIPServiceParamsDTO)
      {
        cleanupCreativeCloudAsset(localProjectModule);
        localBehanceSDKPublishWIPResult.setStatus(BehanceSDKPublishWIPResult.PublishStatus.PUBLISH_FAILED);
        localBehanceSDKPublishWIPResult.setException(paramBehanceSDKPublishWIPServiceParamsDTO);
        logger.error(paramBehanceSDKPublishWIPServiceParamsDTO, "Problem publishing WIP", new Object[0]);
        return localBehanceSDKPublishWIPResult;
        localBehanceSDKPublishWIPResult.setStatus(BehanceSDKPublishWIPResult.PublishStatus.PUBLISH_FAILED);
        paramBehanceSDKPublishWIPServiceParamsDTO = new JSONObject((String)localObject2).optJSONArray("messages");
        if (paramBehanceSDKPublishWIPServiceParamsDTO == null) {
          continue;
        }
        i = 0;
        if (i >= paramBehanceSDKPublishWIPServiceParamsDTO.length()) {
          continue;
        }
        localObject1 = paramBehanceSDKPublishWIPServiceParamsDTO.getJSONObject(i);
        Object localObject2 = ((JSONObject)localObject1).optString("type");
        if ((localObject2 == null) || (!((String)localObject2).equalsIgnoreCase("error"))) {
          break label857;
        }
        localBehanceSDKPublishWIPResult.setReasonPhrase(((JSONObject)localObject1).optString("message"));
        logger.debug("Problem publishing WIP. Response from server [%s]", new Object[] { localBehanceSDKPublishWIPResult.getReasonPhrase() });
        continue;
      }
      catch (Error paramBehanceSDKPublishWIPServiceParamsDTO)
      {
        cleanupCreativeCloudAsset(localProjectModule);
        localBehanceSDKPublishWIPResult.setStatus(BehanceSDKPublishWIPResult.PublishStatus.PUBLISH_FAILED);
        localBehanceSDKPublishWIPResult.setException(new Exception(paramBehanceSDKPublishWIPServiceParamsDTO));
        logger.error(paramBehanceSDKPublishWIPServiceParamsDTO, "Problem publishing WIP", new Object[0]);
        return localBehanceSDKPublishWIPResult;
      }
      cleanupCreativeCloudAsset(localProjectModule);
      return localBehanceSDKPublishWIPResult;
      Object localObject1 = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/wips/?{key_client_id_param}={clientId}", (Map)localObject1);
      continue;
      ((BehanceSDKPublishedWIPRevisionDTO)localObject1).setWipTitle(paramBehanceSDKPublishWIPServiceParamsDTO.getWipTitle());
      paramBehanceSDKPublishWIPServiceParamsDTO = ((JSONObject)localObject2).optJSONObject("revision");
      if (paramBehanceSDKPublishWIPServiceParamsDTO != null)
      {
        ((BehanceSDKPublishedWIPRevisionDTO)localObject1).setRevisionId(paramBehanceSDKPublishWIPServiceParamsDTO.optInt("id"));
        ((BehanceSDKPublishedWIPRevisionDTO)localObject1).setRevisionURL(paramBehanceSDKPublishWIPServiceParamsDTO.optString("url"));
        ((BehanceSDKPublishedWIPRevisionDTO)localObject1).setRevisionDescription(paramBehanceSDKPublishWIPServiceParamsDTO.optString("description"));
        ((BehanceSDKPublishedWIPRevisionDTO)localObject1).setWipId(paramBehanceSDKPublishWIPServiceParamsDTO.optInt("wip_id"));
        paramBehanceSDKPublishWIPServiceParamsDTO = paramBehanceSDKPublishWIPServiceParamsDTO.optJSONObject("images");
        if (paramBehanceSDKPublishWIPServiceParamsDTO != null)
        {
          paramBehanceSDKPublishWIPServiceParamsDTO = paramBehanceSDKPublishWIPServiceParamsDTO.optJSONObject("normal_resolution");
          if (paramBehanceSDKPublishWIPServiceParamsDTO != null) {
            ((BehanceSDKPublishedWIPRevisionDTO)localObject1).setWipImageURL(paramBehanceSDKPublishWIPServiceParamsDTO.optString("url"));
          }
        }
        localBehanceSDKPublishWIPResult.setPublishedWIP((BehanceSDKPublishedWIPRevisionDTO)localObject1);
        continue;
        label857:
        i += 1;
        continue;
        label864:
        localObject1 = "0";
        continue;
        label871:
        i += 1;
      }
    }
  }
  
  private void unlinkTwitterAccount()
  {
    BehanceSDKSocialAccountManager localBehanceSDKSocialAccountManager = BehanceSDKSocialAccountManager.getInstance(this);
    if (localBehanceSDKSocialAccountManager.getAccount(BehanceSDKSocialAccountType.TWITTER) != null) {
      localBehanceSDKSocialAccountManager.removeAccount(BehanceSDKSocialAccountType.TWITTER);
    }
  }
  
  public IBinder onBind(Intent paramIntent)
  {
    if (wipBinder == null) {
      wipBinder = new BehanceSDKPublishWIPBinder();
    }
    return wipBinder;
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    wipBinder = null;
  }
  
  protected void onHandleIntent(Intent paramIntent)
  {
    activePublishRequestId = String.valueOf(System.currentTimeMillis());
    sdkUserManager = BehanceSDKUserManager.getInstance();
    NotificationCompat.Builder localBuilder = new NotificationCompat.Builder(this);
    localBuilder.setSmallIcon(R.drawable.bsdk_anim_list_publish_in_progress_indicator);
    localBuilder.setContentTitle(getString(R.string.bsdk_publish_wip_service_in_progress_notification_title));
    localBuilder.setContentText(getString(R.string.bsdk_publish_wip_service_in_progress_notification_text));
    localBuilder.setStyle(new NotificationCompat.BigTextStyle().bigText(getString(R.string.bsdk_publish_wip_service_in_progress_notification_text)));
    localBuilder.setProgress(0, 0, true);
    startForeground(1001, localBuilder.build());
    paramIntent = paramIntent.getSerializableExtra("INTENT_EXTRA_PARAMS");
    BehanceSDKPublishWIPServiceParamsDTO localBehanceSDKPublishWIPServiceParamsDTO;
    if ((paramIntent instanceof BehanceSDKPublishWIPServiceParamsDTO))
    {
      localBehanceSDKPublishWIPServiceParamsDTO = (BehanceSDKPublishWIPServiceParamsDTO)paramIntent;
      if (isActiveUploadCancelled())
      {
        cleanupCreativeCloudAsset(localBehanceSDKPublishWIPServiceParamsDTO.getWipImageFile());
        broadcastUploadCancelledStatusUpdate();
      }
    }
    else
    {
      return;
    }
    paramIntent = new BehanceSDKPublishWIPStatusDTO();
    paramIntent.setProgressState(BehanceSDKPublishWIPProgressState.PUBLISH_STARTED);
    paramIntent.setProgressPercentage(getProgressPercentage(BehanceSDKPublishWIPProgressState.PUBLISH_STARTED, localBehanceSDKPublishWIPServiceParamsDTO));
    broadcastStatusUpdate(paramIntent);
    BehanceSDKPublishWIPResult localBehanceSDKPublishWIPResult = publishWIPOnServer(localBehanceSDKPublishWIPServiceParamsDTO);
    BehanceSDKPublishedWIPRevisionDTO localBehanceSDKPublishedWIPRevisionDTO = localBehanceSDKPublishWIPResult.getPublishedWIP();
    Object localObject = localBehanceSDKPublishWIPServiceParamsDTO.getNotificationHandlerActivity();
    BehanceSDKPublishWIPStatusDTO localBehanceSDKPublishWIPStatusDTO = new BehanceSDKPublishWIPStatusDTO();
    if ((localBehanceSDKPublishedWIPRevisionDTO != null) && (localBehanceSDKPublishWIPResult.getStatus() == BehanceSDKPublishWIPResult.PublishStatus.SUCCESS))
    {
      paramIntent = new BehanceSDKPublishWIPStatusDTO();
      paramIntent.setProgressState(BehanceSDKPublishWIPProgressState.IMAGE_UPLOAD_SUCCESSFUL);
      paramIntent.setProgressPercentage(getProgressPercentage(BehanceSDKPublishWIPProgressState.IMAGE_UPLOAD_SUCCESSFUL, localBehanceSDKPublishWIPServiceParamsDTO));
      broadcastStatusUpdate(paramIntent);
      if ((!isActiveUploadCancelled()) && (localBehanceSDKPublishWIPServiceParamsDTO.isShareOnFacebook()))
      {
        paramIntent = publishOnFacebook(localBehanceSDKPublishedWIPRevisionDTO.getWipTitle(), localBehanceSDKPublishWIPServiceParamsDTO.getWipDescription(), localBehanceSDKPublishedWIPRevisionDTO.getRevisionURL(), localBehanceSDKPublishedWIPRevisionDTO.getWipImageURL());
        paramIntent.setWipRevisionUrl(localBehanceSDKPublishedWIPRevisionDTO.getRevisionURL());
        paramIntent.setWipId(localBehanceSDKPublishedWIPRevisionDTO.getWipId());
        paramIntent.setWipRevisionDescription(localBehanceSDKPublishWIPServiceParamsDTO.getWipDescription());
        paramIntent.setWipRevisionId(localBehanceSDKPublishedWIPRevisionDTO.getRevisionId());
        paramIntent.setWipTitle(localBehanceSDKPublishedWIPRevisionDTO.getWipTitle());
        paramIntent.setProgressPercentage(getProgressPercentage(BehanceSDKPublishWIPProgressState.SHARE_ON_FACEBOOK_SUCCESSFUL, localBehanceSDKPublishWIPServiceParamsDTO));
        broadcastStatusUpdate(paramIntent);
      }
      if ((!isActiveUploadCancelled()) && (localBehanceSDKPublishWIPServiceParamsDTO.isShareOnTwitter()))
      {
        paramIntent = publishOnTwitter(localBehanceSDKPublishWIPServiceParamsDTO.getTwitterUserAccessToken(), localBehanceSDKPublishWIPServiceParamsDTO.getTwitterUserAccessTokenSecret(), localBehanceSDKPublishWIPServiceParamsDTO.getTwitterConsumerKey(), localBehanceSDKPublishWIPServiceParamsDTO.getTwitterConsumerSecret(), localBehanceSDKPublishedWIPRevisionDTO.getRevisionURL());
        paramIntent.setWipRevisionUrl(localBehanceSDKPublishedWIPRevisionDTO.getRevisionURL());
        paramIntent.setWipId(localBehanceSDKPublishedWIPRevisionDTO.getWipId());
        paramIntent.setWipRevisionDescription(localBehanceSDKPublishWIPServiceParamsDTO.getWipDescription());
        paramIntent.setWipRevisionId(localBehanceSDKPublishedWIPRevisionDTO.getRevisionId());
        paramIntent.setWipTitle(localBehanceSDKPublishedWIPRevisionDTO.getWipTitle());
        paramIntent.setProgressPercentage(getProgressPercentage(BehanceSDKPublishWIPProgressState.SHARE_ON_TWITTER_SUCCESSFUL, localBehanceSDKPublishWIPServiceParamsDTO));
        broadcastStatusUpdate(paramIntent);
      }
      if (isActiveUploadCancelled())
      {
        handleCancelAfterSuccessfulUpload(localBehanceSDKPublishedWIPRevisionDTO, localBehanceSDKPublishWIPServiceParamsDTO);
        return;
      }
      localBuilder.setContentTitle(getString(R.string.bsdk_publish_wip_service_success_notification_title));
      localBuilder.setTicker(getString(R.string.bsdk_publish_wip_service_success_notification_ticker));
      localBuilder.setContentText(getString(R.string.bsdk_publish_wip_service_success_notification_text));
      localBuilder.setStyle(new NotificationCompat.BigTextStyle().bigText(getString(R.string.bsdk_publish_wip_service_success_notification_text)));
      if (localObject != null)
      {
        paramIntent = createNotifyIntent((Class)localObject);
        paramIntent.putExtra("BEHANCE_SDK_PUBLISH_WIP_INTENT_BOOL_EXTRA_PUBLISHED_WIP_SUCCESSFULLY", true);
        paramIntent.putExtra("BEHANCE_SDK_PUBLISH_WIP_INTENT_INT_EXTRA_PUBLISHED_WIP_ID", localBehanceSDKPublishedWIPRevisionDTO.getWipId());
        paramIntent.putExtra("BEHANCE_SDK_PUBLISH_WIP_INTENT_STR_EXTRA_PUBLISHED_WIP_TITLE", localBehanceSDKPublishedWIPRevisionDTO.getWipTitle());
        paramIntent.putExtra("BEHANCE_SDK_PUBLISH_WIP_INTENT_INT_EXTRA_PUBLISHED_WIP_REVISION_ID", localBehanceSDKPublishedWIPRevisionDTO.getRevisionId());
        paramIntent.putExtra("BEHANCE_SDK_PUBLISH_WIP_INTENT_STR_EXTRA_PUBLISHED_WIP_REVISION_DESC", localBehanceSDKPublishedWIPRevisionDTO.getRevisionDescription());
        paramIntent.putExtra("BEHANCE_SDK_PUBLISH_WIP_INTENT_STR_EXTRA_PUBLISHED_WIP_REVISION_URL", localBehanceSDKPublishedWIPRevisionDTO.getRevisionURL());
        localBuilder.setContentIntent(createPendingIntent(paramIntent));
      }
      localBehanceSDKPublishWIPStatusDTO.setProgressState(BehanceSDKPublishWIPProgressState.PUBLISH_SUCCESSFUL);
      localBehanceSDKPublishWIPStatusDTO.setProgressPercentage(getProgressPercentage(BehanceSDKPublishWIPProgressState.PUBLISH_SUCCESSFUL, localBehanceSDKPublishWIPServiceParamsDTO));
      localBehanceSDKPublishWIPStatusDTO.setWipRevisionUrl(localBehanceSDKPublishedWIPRevisionDTO.getRevisionURL());
      localBehanceSDKPublishWIPStatusDTO.setWipId(localBehanceSDKPublishedWIPRevisionDTO.getWipId());
      localBehanceSDKPublishWIPStatusDTO.setWipRevisionDescription(localBehanceSDKPublishWIPServiceParamsDTO.getWipDescription());
      localBehanceSDKPublishWIPStatusDTO.setWipRevisionId(localBehanceSDKPublishedWIPRevisionDTO.getRevisionId());
      localBehanceSDKPublishWIPStatusDTO.setWipTitle(localBehanceSDKPublishedWIPRevisionDTO.getWipTitle());
      localBehanceSDKPublishWIPStatusDTO.setWipRevisionImageUrl(localBehanceSDKPublishedWIPRevisionDTO.getWipImageURL());
      if (!isActiveUploadCancelled())
      {
        localBuilder.setSmallIcon(R.drawable.bsdk_icon_notification_publish_progress);
        localBuilder.setProgress(0, 0, false);
        localBuilder.setAutoCancel(true);
        paramIntent = localBuilder.build();
        ((NotificationManager)getSystemService("notification")).notify(1002, paramIntent);
        broadcastStatusUpdate(localBehanceSDKPublishWIPStatusDTO);
      }
    }
    else
    {
      if (isActiveUploadCancelled())
      {
        broadcastUploadCancelledStatusUpdate();
        return;
      }
      localBuilder.setContentTitle(getString(R.string.bsdk_publish_wip_service_failure_notification_title));
      localBuilder.setTicker(getString(R.string.bsdk_publish_wip_service_failure_notification_ticker));
      String str = localBehanceSDKPublishWIPResult.getReasonPhrase();
      if (str != null) {}
      for (paramIntent = getString(R.string.bsdk_publish_wip_service_failure_notification_msg, new Object[] { str });; paramIntent = getString(R.string.bsdk_publish_wip_service_unknown_failure_notification_msg))
      {
        localBuilder.setContentText(paramIntent);
        localBuilder.setStyle(new NotificationCompat.BigTextStyle().bigText(paramIntent));
        if (localObject != null)
        {
          localObject = createNotifyIntent((Class)localObject);
          ((Intent)localObject).putExtra("BEHANCE_SDK_PUBLISH_WIP_INTENT_BOOL_EXTRA_PUBLISHED_WIP_SUCCESSFULLY", false);
          ((Intent)localObject).putExtra("BEHANCE_SDK_PUBLISH_WIP_INTENT_STR_EXTRA_PUBLISHED_WIP_TITLE", localBehanceSDKPublishWIPServiceParamsDTO.getWipTitle());
          ((Intent)localObject).putExtra("BEHANCE_SDK_PUBLISH_WIP_INTENT_STR_EXTRA_PUBLISHED_WIP_REVISION_DESC", localBehanceSDKPublishWIPServiceParamsDTO.getWipDescription());
          ((Intent)localObject).putExtra("BEHANCE_SDK_PUBLISH_WIP_INTENT_STR_EXTRA_PUBLISH_WIP_FAILURE_MSG", paramIntent);
          localBuilder.setContentIntent(createPendingIntent((Intent)localObject));
        }
        localBehanceSDKPublishWIPStatusDTO.setProgressState(BehanceSDKPublishWIPProgressState.PUBLISH_FAILED);
        localBehanceSDKPublishWIPStatusDTO.setProgressPercentage(getProgressPercentage(BehanceSDKPublishWIPProgressState.PUBLISH_FAILED, localBehanceSDKPublishWIPServiceParamsDTO));
        localBehanceSDKPublishWIPStatusDTO.setWipRevisionDescription(localBehanceSDKPublishWIPServiceParamsDTO.getWipDescription());
        localBehanceSDKPublishWIPStatusDTO.setWipTitle(localBehanceSDKPublishWIPServiceParamsDTO.getWipTitle());
        localBehanceSDKPublishWIPStatusDTO.setErrorMessage(str);
        localBehanceSDKPublishWIPStatusDTO.setException(localBehanceSDKPublishWIPResult.getException());
        break;
      }
    }
    if ((localBehanceSDKPublishedWIPRevisionDTO != null) && (localBehanceSDKPublishWIPResult.getStatus() == BehanceSDKPublishWIPResult.PublishStatus.SUCCESS))
    {
      handleCancelAfterSuccessfulUpload(localBehanceSDKPublishedWIPRevisionDTO, localBehanceSDKPublishWIPServiceParamsDTO);
      return;
    }
    broadcastUploadCancelledStatusUpdate();
  }
  
  public boolean onUnbind(Intent paramIntent)
  {
    return super.onUnbind(paramIntent);
  }
}
