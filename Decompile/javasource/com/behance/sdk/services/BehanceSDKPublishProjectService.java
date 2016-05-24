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
import android.text.TextUtils;
import com.adobe.creativesdk.foundation.internal.analytics.AdobeAnalyticsSDKReporter;
import com.behance.sdk.BehanceSDKSocialAccountManager;
import com.behance.sdk.R.drawable;
import com.behance.sdk.R.string;
import com.behance.sdk.asynctasks.result.BehanceSDKPublishProjectTaskResult;
import com.behance.sdk.asynctasks.result.BehanceSDKPublishProjectTaskResult.PublishStatus;
import com.behance.sdk.dto.BehanceSDKPublishProjectServiceParamsDTO;
import com.behance.sdk.dto.BehanceSDKPublishProjectStatusDTO;
import com.behance.sdk.dto.BehanceSDKPublishedProjectDTO;
import com.behance.sdk.enums.BehanceSDKPublishProjectProgressState;
import com.behance.sdk.enums.BehanceSDKSocialAccountType;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.managers.BehanceSDKUserManager;
import com.behance.sdk.project.modules.EmbedModule;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.project.modules.ProjectModule;
import com.behance.sdk.project.modules.ProjectModuleTypes;
import com.behance.sdk.services.binders.BehanceSDKPublishProjectBinder;
import com.behance.sdk.util.BehanceSDKHTTPUtils;
import com.behance.sdk.util.BehanceSDKUrlUtil;
import com.behance.sdk.util.CustomHttpEntityWrapper;
import com.behance.sdk.util.CustomHttpEntityWrapper.CustomHttpEntityWrapperCallback;
import com.behance.sdk.util.HTTPResponse;
import com.facebook.FacebookRequestError;
import com.facebook.HttpMethod;
import com.facebook.Request;
import com.facebook.Response;
import com.facebook.Session;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.net.URI;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import oauth.signpost.OAuthConsumer;
import oauth.signpost.commonshttp.CommonsHttpOAuthConsumer;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.InputStreamBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONObject;

public class BehanceSDKPublishProjectService
  extends IntentService
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKPublishProjectService.class);
  private String activePublishRequestId;
  private BehanceSDKPublishProjectBinder projectBinder;
  private BehanceSDKUserManager sdkUserManager;
  
  public BehanceSDKPublishProjectService()
  {
    super("Behance Publish Project Service");
  }
  
  private void broadcastProgressUpdate(BehanceSDKPublishProjectStatusDTO paramBehanceSDKPublishProjectStatusDTO)
  {
    if (!isActiveUploadCancelled())
    {
      if (paramBehanceSDKPublishProjectStatusDTO.getProgressState() != BehanceSDKPublishProjectProgressState.PUBLISH_SUCCESSFUL) {
        break label62;
      }
      AdobeAnalyticsSDKReporter.trackSharingAction(AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTypePublishSuccess, AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTargetBehanceProject);
    }
    for (;;)
    {
      Intent localIntent = new Intent("com.behance.sdk.INTENT_ACTION_PROJECT_PUBLISH_STATUS_BROADCAST");
      localIntent.putExtra("com.behance.sdk.INTENT_EXTRA_OBJ_KEY_PROJECT_PUBLISH_STATUS_BROADCAST_DATA", paramBehanceSDKPublishProjectStatusDTO);
      paramBehanceSDKPublishProjectStatusDTO.setPublishRequestId(activePublishRequestId);
      LocalBroadcastManager.getInstance(this).sendBroadcast(localIntent);
      return;
      label62:
      if (paramBehanceSDKPublishProjectStatusDTO.getProgressState() == BehanceSDKPublishProjectProgressState.PUBLISH_FAILED) {
        AdobeAnalyticsSDKReporter.trackSharingAction(AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTypePublishFailure, AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTargetBehanceProject);
      }
    }
  }
  
  private void broadcastUploadCancelledStatusUpdate()
  {
    logger.debug("Publish Project cancelled. Broadcasting message", new Object[0]);
    BehanceSDKPublishProjectStatusDTO localBehanceSDKPublishProjectStatusDTO = new BehanceSDKPublishProjectStatusDTO();
    localBehanceSDKPublishProjectStatusDTO.setPublishRequestId(activePublishRequestId);
    localBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.CANCEL_PUBLISH_SUCCESSFUL);
    localBehanceSDKPublishProjectStatusDTO.setProgressPercentage(getProgressPercentage(BehanceSDKPublishProjectProgressState.CANCEL_PUBLISH_SUCCESSFUL, null));
    Intent localIntent = new Intent("com.behance.sdk.INTENT_ACTION_PROJECT_PUBLISH_STATUS_BROADCAST");
    localIntent.putExtra("com.behance.sdk.INTENT_EXTRA_OBJ_KEY_PROJECT_PUBLISH_STATUS_BROADCAST_DATA", localBehanceSDKPublishProjectStatusDTO);
    LocalBroadcastManager.getInstance(this).sendBroadcast(localIntent);
  }
  
  private void cleanupCreativeCloudResources(List<ProjectModule> paramList)
  {
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      ProjectModule localProjectModule = (ProjectModule)paramList.next();
      if (localProjectModule.getType() == ProjectModuleTypes.CREATIVECLOUD_ASSET) {
        localProjectModule.deleteFromFileSystem();
      }
    }
  }
  
  private int convertModuleUploadProgressPercentage(BehanceSDKPublishProjectServiceParamsDTO paramBehanceSDKPublishProjectServiceParamsDTO, int paramInt1, int paramInt2)
  {
    int i = getProgressPercentage(BehanceSDKPublishProjectProgressState.PROJECT_DRAFT_CREATION_SUCCESSFUL, paramBehanceSDKPublishProjectServiceParamsDTO);
    int j = (getProgressPercentage(BehanceSDKPublishProjectProgressState.MODULES_UPLOAD_SUCCESSFUL, paramBehanceSDKPublishProjectServiceParamsDTO) - i) / paramBehanceSDKPublishProjectServiceParamsDTO.getProjectModules().size();
    return (paramInt1 - 1) * j + i + paramInt2 * j / 100;
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
  
  private void deleteProject(String paramString, BehanceSDKPublishProjectServiceParamsDTO paramBehanceSDKPublishProjectServiceParamsDTO, Map<String, String> paramMap)
  {
    try
    {
      paramBehanceSDKPublishProjectServiceParamsDTO = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/project/editor/{PROJECTID}?{key_client_id_param}={clientId}", paramMap).replace("{PROJECTID}", paramString);
      paramMap = sdkUserManager.checkExpiryAndGetAccessToken();
      paramString = paramBehanceSDKPublishProjectServiceParamsDTO;
      if (paramMap != null) {
        paramString = BehanceSDKUrlUtil.appendQueryStringParam(paramBehanceSDKPublishProjectServiceParamsDTO, "access_token", paramMap);
      }
      BehanceSDKHTTPUtils.doHTTPDelete(new HttpDelete(paramString));
      return;
    }
    catch (Throwable paramString)
    {
      logger.error(paramString, "Problem deleting project", new Object[0]);
    }
  }
  
  private int getProgressPercentage(BehanceSDKPublishProjectProgressState paramBehanceSDKPublishProjectProgressState, BehanceSDKPublishProjectServiceParamsDTO paramBehanceSDKPublishProjectServiceParamsDTO)
  {
    switch (1.$SwitchMap$com$behance$sdk$enums$BehanceSDKPublishProjectProgressState[paramBehanceSDKPublishProjectProgressState.ordinal()])
    {
    default: 
      return 0;
    case 1: 
      return 10;
    case 2: 
      return 20;
    case 3: 
      if ((paramBehanceSDKPublishProjectServiceParamsDTO.isShareOnFacebook()) && (paramBehanceSDKPublishProjectServiceParamsDTO.isShareOnTwitter())) {
        return 70;
      }
      if ((paramBehanceSDKPublishProjectServiceParamsDTO.isShareOnFacebook()) || (paramBehanceSDKPublishProjectServiceParamsDTO.isShareOnTwitter())) {
        return 80;
      }
      return 90;
    case 4: 
    case 5: 
      if (paramBehanceSDKPublishProjectServiceParamsDTO.isShareOnTwitter()) {
        return 80;
      }
      return 90;
    case 6: 
    case 7: 
      return 90;
    }
    return 100;
  }
  
  private void handleCancelAfterSuccessfulUpload(BehanceSDKPublishedProjectDTO paramBehanceSDKPublishedProjectDTO, BehanceSDKPublishProjectServiceParamsDTO paramBehanceSDKPublishProjectServiceParamsDTO)
  {
    localBehanceSDKPublishProjectStatusDTO = new BehanceSDKPublishProjectStatusDTO();
    localBehanceSDKPublishProjectStatusDTO.setPublishRequestId(activePublishRequestId);
    localBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.CANCEL_PUBLISH_SUCCESSFUL);
    localBehanceSDKPublishProjectStatusDTO.setProgressPercentage(getProgressPercentage(BehanceSDKPublishProjectProgressState.CANCEL_PUBLISH_SUCCESSFUL, paramBehanceSDKPublishProjectServiceParamsDTO));
    try
    {
      cleanupCreativeCloudResources(paramBehanceSDKPublishProjectServiceParamsDTO.getProjectModules());
      Object localObject = new HashMap();
      ((Map)localObject).put("clientId", paramBehanceSDKPublishProjectServiceParamsDTO.getAppClientId());
      paramBehanceSDKPublishProjectServiceParamsDTO = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/project/editor/{PROJECTID}?{key_client_id_param}={clientId}", (Map)localObject).replace("{PROJECTID}", paramBehanceSDKPublishedProjectDTO.getProjectId());
      localObject = sdkUserManager.checkExpiryAndGetAccessToken();
      paramBehanceSDKPublishedProjectDTO = paramBehanceSDKPublishProjectServiceParamsDTO;
      if (localObject != null) {
        paramBehanceSDKPublishedProjectDTO = BehanceSDKUrlUtil.appendQueryStringParam(paramBehanceSDKPublishProjectServiceParamsDTO, "access_token", localObject);
      }
      BehanceSDKHTTPUtils.doHTTPDelete(new HttpDelete(paramBehanceSDKPublishedProjectDTO));
    }
    catch (Throwable paramBehanceSDKPublishedProjectDTO)
    {
      for (;;)
      {
        logger.error(paramBehanceSDKPublishedProjectDTO, "Problem deleting project after cancel request", new Object[0]);
        localBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.CANCEL_PUBLISH_FAILED);
        localBehanceSDKPublishProjectStatusDTO.setException(paramBehanceSDKPublishedProjectDTO);
      }
    }
    paramBehanceSDKPublishedProjectDTO = new Intent("com.behance.sdk.INTENT_ACTION_PROJECT_PUBLISH_STATUS_BROADCAST");
    paramBehanceSDKPublishedProjectDTO.putExtra("com.behance.sdk.INTENT_EXTRA_OBJ_KEY_PROJECT_PUBLISH_STATUS_BROADCAST_DATA", localBehanceSDKPublishProjectStatusDTO);
    LocalBroadcastManager.getInstance(this).sendBroadcast(paramBehanceSDKPublishedProjectDTO);
  }
  
  private boolean isActiveUploadCancelled()
  {
    if (projectBinder != null) {
      return projectBinder.isUploadCancelled(activePublishRequestId);
    }
    return false;
  }
  
  private void publishOnFacebook(BehanceSDKPublishedProjectDTO paramBehanceSDKPublishedProjectDTO, BehanceSDKPublishProjectServiceParamsDTO paramBehanceSDKPublishProjectServiceParamsDTO, BehanceSDKPublishProjectStatusDTO paramBehanceSDKPublishProjectStatusDTO)
  {
    for (;;)
    {
      try
      {
        Session localSession = Session.getActiveSession();
        if (localSession != null)
        {
          Bundle localBundle = new Bundle();
          localBundle.putString("name", paramBehanceSDKPublishedProjectDTO.getProjectTitle());
          localBundle.putString("link", paramBehanceSDKPublishedProjectDTO.getProjectUrl());
          paramBehanceSDKPublishedProjectDTO = paramBehanceSDKPublishedProjectDTO.getProjectImageUrl();
          if ((paramBehanceSDKPublishedProjectDTO != null) && (paramBehanceSDKPublishedProjectDTO.length() > 0)) {
            localBundle.putString("picture", paramBehanceSDKPublishedProjectDTO);
          }
          paramBehanceSDKPublishedProjectDTO = new Request(localSession, "me/feed", localBundle, HttpMethod.POST, null).executeAndWait().getError();
          if (paramBehanceSDKPublishedProjectDTO == null) {
            continue;
          }
          logger.debug("Problem sharing Project on Facebook [Message - %s]", new Object[] { paramBehanceSDKPublishedProjectDTO.toString() });
          paramBehanceSDKPublishedProjectDTO = paramBehanceSDKPublishedProjectDTO.getErrorUserMessage();
          logger.error("Problem sharing Project on Facebook [Message - %s]", new Object[] { paramBehanceSDKPublishedProjectDTO });
          paramBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.SHARE_ON_FACEBOOK_FAILED);
          paramBehanceSDKPublishProjectStatusDTO.setReasonPhrase(paramBehanceSDKPublishedProjectDTO);
        }
      }
      catch (Throwable paramBehanceSDKPublishedProjectDTO)
      {
        logger.error(paramBehanceSDKPublishedProjectDTO, "Problem sharing Project on Facebook", new Object[0]);
        paramBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.SHARE_ON_FACEBOOK_FAILED);
        paramBehanceSDKPublishProjectStatusDTO.setException(paramBehanceSDKPublishedProjectDTO);
        continue;
      }
      paramBehanceSDKPublishProjectStatusDTO.setProgressPercentage(getProgressPercentage(paramBehanceSDKPublishProjectStatusDTO.getProgressState(), paramBehanceSDKPublishProjectServiceParamsDTO));
      broadcastProgressUpdate(paramBehanceSDKPublishProjectStatusDTO);
      return;
      logger.debug("Successfully shared Project on Facebook", new Object[0]);
      paramBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.SHARE_ON_FACEBOOK_SUCCESSFUL);
    }
  }
  
  private void publishOnTwitter(BehanceSDKPublishProjectServiceParamsDTO paramBehanceSDKPublishProjectServiceParamsDTO, BehanceSDKPublishProjectStatusDTO paramBehanceSDKPublishProjectStatusDTO)
  {
    for (;;)
    {
      try
      {
        localObject1 = new CommonsHttpOAuthConsumer(paramBehanceSDKPublishProjectServiceParamsDTO.getTwitterConsumerKey(), paramBehanceSDKPublishProjectServiceParamsDTO.getTwitterConsumerSecret());
        ((OAuthConsumer)localObject1).setTokenWithSecret(paramBehanceSDKPublishProjectServiceParamsDTO.getTwitterUserAccessToken(), paramBehanceSDKPublishProjectServiceParamsDTO.getTwitterUserAccessTokenSecret());
        Object localObject2 = URLEncoder.encode(getString(R.string.bsdk_publish_project_service_publish_on_twitter_msg, new Object[] { paramBehanceSDKPublishProjectStatusDTO.getProjectUrl() }), "UTF-8");
        localObject2 = new URI("https://api.twitter.com/1.1/statuses/update.json?status=" + (String)localObject2);
        HttpPost localHttpPost = new HttpPost((URI)localObject2);
        logger.debug("Share on Twitter URL is [URL - %s]", new Object[] { ((URI)localObject2).toString() });
        ((OAuthConsumer)localObject1).sign(localHttpPost);
        localObject1 = new DefaultHttpClient().execute(localHttpPost);
        i = ((HttpResponse)localObject1).getStatusLine().getStatusCode();
        if (i != 200) {
          continue;
        }
        logger.debug("Successfully shared Project on Twitter", new Object[0]);
        paramBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.SHARE_ON_TWITTER_SUCCESSFUL);
      }
      catch (Throwable localThrowable)
      {
        Object localObject1;
        int i;
        logger.error(localThrowable, "Error sharing Project on Twitter", new Object[0]);
        paramBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.SHARE_ON_TWITTER_FAILED);
        paramBehanceSDKPublishProjectStatusDTO.setException(localThrowable);
        continue;
        String str = localThrowable.getStatusLine().getReasonPhrase();
        logger.error("Error sharing Project on Twitter. [Error code - %s - message - %s]", new Object[] { Integer.valueOf(i), str });
        paramBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.SHARE_ON_TWITTER_FAILED);
        paramBehanceSDKPublishProjectStatusDTO.setReasonPhrase(str);
        continue;
      }
      paramBehanceSDKPublishProjectStatusDTO.setProgressPercentage(getProgressPercentage(paramBehanceSDKPublishProjectStatusDTO.getProgressState(), paramBehanceSDKPublishProjectServiceParamsDTO));
      broadcastProgressUpdate(paramBehanceSDKPublishProjectStatusDTO);
      return;
      if (i != 401) {
        continue;
      }
      localObject1 = ((HttpResponse)localObject1).getStatusLine().getReasonPhrase();
      logger.error("Twitter User token has been revoked. [Error code - %s - message - %s]", new Object[] { Integer.valueOf(i), localObject1 });
      unlinkTwitterAccount();
      paramBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.SHARE_ON_TWITTER_FAILED);
      paramBehanceSDKPublishProjectStatusDTO.setReasonPhrase((String)localObject1);
    }
  }
  
  private BehanceSDKPublishProjectTaskResult publishProjectOnServer(BehanceSDKPublishProjectServiceParamsDTO paramBehanceSDKPublishProjectServiceParamsDTO, BehanceSDKPublishProjectStatusDTO paramBehanceSDKPublishProjectStatusDTO)
  {
    BehanceSDKPublishProjectTaskResult localBehanceSDKPublishProjectTaskResult = new BehanceSDKPublishProjectTaskResult();
    BehanceSDKPublishedProjectDTO localBehanceSDKPublishedProjectDTO = new BehanceSDKPublishedProjectDTO();
    String str1 = paramBehanceSDKPublishProjectServiceParamsDTO.getProjectTitle();
    localBehanceSDKPublishedProjectDTO.setProjectTitle(str1);
    localBehanceSDKPublishProjectTaskResult.setPublishedProject(localBehanceSDKPublishedProjectDTO);
    List localList = paramBehanceSDKPublishProjectServiceParamsDTO.getProjectModules();
    paramBehanceSDKPublishProjectStatusDTO.setProjectTitle(str1);
    paramBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.PUBLISH_STARTED);
    paramBehanceSDKPublishProjectStatusDTO.setProgressPercentage(getProgressPercentage(BehanceSDKPublishProjectProgressState.PUBLISH_STARTED, paramBehanceSDKPublishProjectServiceParamsDTO));
    broadcastProgressUpdate(paramBehanceSDKPublishProjectStatusDTO);
    Object localObject4 = null;
    HashMap localHashMap = new HashMap();
    localHashMap.put("clientId", paramBehanceSDKPublishProjectServiceParamsDTO.getAppClientId());
    Object localObject1 = localObject4;
    ContentType localContentType;
    Object localObject5;
    String str2;
    try
    {
      localContentType = ContentType.create("text/plain", "UTF-8");
      localObject1 = localObject4;
      localObject5 = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/project/editor?{key_client_id_param}={clientId}", localHashMap);
      localObject1 = localObject4;
      str2 = BehanceSDKUserManager.getInstance().checkExpiryAndGetAccessToken();
      Object localObject2 = localObject5;
      if (str2 != null)
      {
        localObject1 = localObject4;
        localObject2 = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject5, "access_token", str2);
      }
      localObject1 = localObject4;
      localObject2 = new HttpPost((String)localObject2);
      localObject1 = localObject4;
      localObject6 = paramBehanceSDKPublishProjectServiceParamsDTO.getProjectCoverImageByteArray();
      localObject1 = localObject4;
      localObject5 = MultipartEntityBuilder.create();
      localObject1 = localObject4;
      localObject6 = new ByteArrayInputStream((byte[])localObject6);
      localObject1 = localObject4;
      ((MultipartEntityBuilder)localObject5).addPart("image", new InputStreamBody((InputStream)localObject6, paramBehanceSDKPublishProjectServiceParamsDTO.getProjectCoverImageFileName()));
      localObject1 = localObject4;
      ((MultipartEntityBuilder)localObject5).addTextBody("title", str1, localContentType);
      localObject1 = localObject4;
      ((HttpPost)localObject2).setEntity(((MultipartEntityBuilder)localObject5).build());
      localObject1 = localObject4;
      localObject2 = BehanceSDKHTTPUtils.doHTTPPost((HttpPost)localObject2);
      localObject1 = localObject4;
      ((ByteArrayInputStream)localObject6).close();
      localObject1 = localObject4;
      if (((HTTPResponse)localObject2).getStatusCode() != 201)
      {
        localObject1 = localObject4;
        paramBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.PUBLISH_FAILED);
        localObject1 = localObject4;
        paramBehanceSDKPublishProjectStatusDTO.setReasonPhrase(((HTTPResponse)localObject2).getReasonPhrase());
        localObject1 = localObject4;
        broadcastProgressUpdate(paramBehanceSDKPublishProjectStatusDTO);
        localObject1 = localObject4;
        cleanupCreativeCloudResources(localList);
        localObject1 = localObject4;
        localBehanceSDKPublishProjectTaskResult.setStatus(BehanceSDKPublishProjectTaskResult.PublishStatus.CREATION_FAILED);
        localObject1 = localObject4;
        localBehanceSDKPublishProjectTaskResult.setReasonPhrase(((HTTPResponse)localObject2).getReasonPhrase());
        return localBehanceSDKPublishProjectTaskResult;
      }
      localObject1 = localObject4;
      localObject2 = (JSONObject)new JSONObject(((HTTPResponse)localObject2).getResponseString()).get("project");
      localObject1 = localObject4;
      localObject5 = ((JSONObject)localObject2).optString("id");
      localObject1 = localObject5;
      localBehanceSDKPublishedProjectDTO.setProjectId((String)localObject5);
      localObject1 = localObject5;
      localObject4 = ((JSONObject)localObject2).optString("url");
      localObject1 = localObject5;
      localBehanceSDKPublishedProjectDTO.setProjectUrl((String)localObject4);
      localObject1 = localObject5;
      paramBehanceSDKPublishProjectStatusDTO.setProjectId((String)localObject5);
      localObject1 = localObject5;
      paramBehanceSDKPublishProjectStatusDTO.setProjectUrl((String)localObject4);
      localObject1 = localObject5;
      if (!isActiveUploadCancelled()) {
        break label563;
      }
      localObject1 = localObject5;
      handleCancelAfterSuccessfulUpload(localBehanceSDKPublishedProjectDTO, paramBehanceSDKPublishProjectServiceParamsDTO);
      localObject1 = localObject5;
      localBehanceSDKPublishProjectTaskResult.setStatus(BehanceSDKPublishProjectTaskResult.PublishStatus.CANCELLED);
      return localBehanceSDKPublishProjectTaskResult;
    }
    catch (Throwable localThrowable)
    {
      logger.error(localThrowable, "Problem publishing project", new Object[0]);
      cleanupCreativeCloudResources(localList);
      if (!isActiveUploadCancelled()) {
        break label1715;
      }
    }
    handleCancelAfterSuccessfulUpload(localBehanceSDKPublishedProjectDTO, paramBehanceSDKPublishProjectServiceParamsDTO);
    localBehanceSDKPublishProjectTaskResult.setStatus(BehanceSDKPublishProjectTaskResult.PublishStatus.CANCELLED);
    return localBehanceSDKPublishProjectTaskResult;
    label563:
    localObject1 = localObject5;
    paramBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.PROJECT_DRAFT_CREATION_SUCCESSFUL);
    localObject1 = localObject5;
    paramBehanceSDKPublishProjectStatusDTO.setProgressPercentage(getProgressPercentage(BehanceSDKPublishProjectProgressState.PROJECT_DRAFT_CREATION_SUCCESSFUL, paramBehanceSDKPublishProjectServiceParamsDTO));
    localObject1 = localObject5;
    broadcastProgressUpdate(paramBehanceSDKPublishProjectStatusDTO);
    localObject1 = localObject5;
    localObject4 = localThrowable.optJSONObject("covers");
    int i;
    Iterator localIterator;
    if (localObject4 != null)
    {
      localObject1 = localObject5;
      localObject3 = ((JSONObject)localObject4).optString("202");
      localObject1 = localObject5;
      localObject4 = ((JSONObject)localObject4).optString("404");
      localObject1 = localObject5;
      localBehanceSDKPublishedProjectDTO.setProjectImageUrl((String)localObject3);
      if (localObject4 != null)
      {
        localObject1 = localObject5;
        if (((String)localObject4).length() > 0)
        {
          localObject1 = localObject5;
          paramBehanceSDKPublishProjectStatusDTO.setProjectCoverImageUrl((String)localObject4);
        }
      }
    }
    else
    {
      localObject1 = localObject5;
      localObject4 = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/project/editor/{PROJECTID}/modules?{key_client_id_param}={clientId}", localHashMap).replace("{PROJECTID}", (CharSequence)localObject5);
      localObject3 = localObject4;
      if (str2 != null)
      {
        localObject1 = localObject5;
        localObject3 = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject4, "access_token", str2);
      }
      i = 0;
      localObject1 = localObject5;
      localIterator = localList.iterator();
    }
    ProjectModule localProjectModule;
    label1147:
    label1173:
    do
    {
      localObject1 = localObject5;
      if (!localIterator.hasNext()) {
        break label1284;
      }
      localObject1 = localObject5;
      localProjectModule = (ProjectModule)localIterator.next();
      localObject1 = localObject5;
      if (isActiveUploadCancelled())
      {
        localObject1 = localObject5;
        handleCancelAfterSuccessfulUpload(localBehanceSDKPublishedProjectDTO, paramBehanceSDKPublishProjectServiceParamsDTO);
        localObject1 = localObject5;
        localBehanceSDKPublishProjectTaskResult.setStatus(BehanceSDKPublishProjectTaskResult.PublishStatus.CANCELLED);
        return localBehanceSDKPublishProjectTaskResult;
        localObject1 = localObject5;
        paramBehanceSDKPublishProjectStatusDTO.setProjectCoverImageUrl((String)localObject3);
        break;
      }
      i += 1;
      localObject1 = localObject5;
      ProjectModuleTypes localProjectModuleTypes = localProjectModule.getType();
      localObject1 = localObject5;
      Object localObject7 = MultipartEntityBuilder.create();
      localObject6 = null;
      localObject1 = localObject5;
      if (localProjectModuleTypes != ProjectModuleTypes.IMAGE)
      {
        localObject1 = localObject5;
        if (localProjectModuleTypes != ProjectModuleTypes.CREATIVECLOUD_ASSET) {}
      }
      else
      {
        localObject1 = localObject5;
        ((MultipartEntityBuilder)localObject7).addTextBody("type", "image");
        localObject1 = localObject5;
        localObject4 = ((ImageModule)localProjectModule).getFileForUpload();
        localObject1 = localObject5;
        ((MultipartEntityBuilder)localObject7).addPart("image", new FileBody((File)localObject4));
        localObject1 = localObject5;
        localObject6 = ((MultipartEntityBuilder)localObject7).build();
        localObject1 = localObject5;
        localObject7 = new HttpPost((String)localObject3);
        localObject1 = localObject5;
        ((HttpPost)localObject7).setEntity(new CustomHttpEntityWrapper((HttpEntity)localObject6, new ProjectModuleUploadEntityWrapperCallback(paramBehanceSDKPublishProjectServiceParamsDTO, paramBehanceSDKPublishProjectStatusDTO, (HttpPost)localObject7, i, null)));
        localObject1 = localObject5;
        localObject6 = BehanceSDKHTTPUtils.doHTTPPost((HttpPost)localObject7);
        localObject1 = localObject5;
        if (localProjectModuleTypes != ProjectModuleTypes.IMAGE) {
          break label1147;
        }
        localObject1 = localObject5;
        if (((File)localObject4).equals(((ImageModule)localProjectModule).getFile())) {
          break label1147;
        }
        localObject1 = localObject5;
        ((File)localObject4).delete();
      }
      for (;;)
      {
        localObject1 = localObject5;
        if (!isActiveUploadCancelled()) {
          break label1173;
        }
        localObject1 = localObject5;
        handleCancelAfterSuccessfulUpload(localBehanceSDKPublishedProjectDTO, paramBehanceSDKPublishProjectServiceParamsDTO);
        localObject1 = localObject5;
        localBehanceSDKPublishProjectTaskResult.setStatus(BehanceSDKPublishProjectTaskResult.PublishStatus.CANCELLED);
        return localBehanceSDKPublishProjectTaskResult;
        localObject1 = localObject5;
        localObject4 = localObject6;
        if (localProjectModuleTypes != ProjectModuleTypes.EMBED) {
          break;
        }
        localObject1 = localObject5;
        ((MultipartEntityBuilder)localObject7).addTextBody("type", "embed");
        localObject1 = localObject5;
        ((MultipartEntityBuilder)localObject7).addPart("html", new StringBody(((EmbedModule)localProjectModule).getEmbedContent(), ContentType.APPLICATION_XHTML_XML));
        localObject4 = localObject6;
        break;
        localObject1 = localObject5;
        if (localProjectModuleTypes == ProjectModuleTypes.CREATIVECLOUD_ASSET)
        {
          localObject1 = localObject5;
          localProjectModule.deleteFromFileSystem();
        }
      }
      localObject1 = localObject5;
    } while (((HTTPResponse)localObject6).getStatusCode() == 201);
    localObject1 = localObject5;
    deleteProject((String)localObject5, paramBehanceSDKPublishProjectServiceParamsDTO, localHashMap);
    localObject1 = localObject5;
    cleanupCreativeCloudResources(localList);
    localObject1 = localObject5;
    paramBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.PUBLISH_FAILED);
    localObject1 = localObject5;
    paramBehanceSDKPublishProjectStatusDTO.setReasonPhrase(((HTTPResponse)localObject6).getReasonPhrase());
    localObject1 = localObject5;
    broadcastProgressUpdate(paramBehanceSDKPublishProjectStatusDTO);
    localObject1 = localObject5;
    localBehanceSDKPublishProjectTaskResult.setStatus(BehanceSDKPublishProjectTaskResult.PublishStatus.MODULE_ADD_FAILED);
    localObject1 = localObject5;
    localBehanceSDKPublishProjectTaskResult.setFailedMoudle(localProjectModule);
    localObject1 = localObject5;
    localBehanceSDKPublishProjectTaskResult.setReasonPhrase(((HTTPResponse)localObject6).getReasonPhrase());
    return localBehanceSDKPublishProjectTaskResult;
    label1284:
    localObject1 = localObject5;
    localObject4 = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/project/editor/{PROJECTID}?{key_client_id_param}={clientId}", localHashMap).replace("{PROJECTID}", (CharSequence)localObject5);
    Object localObject3 = localObject4;
    if (str2 != null)
    {
      localObject1 = localObject5;
      localObject3 = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject4, "access_token", str2);
    }
    localObject1 = localObject5;
    localObject4 = new HttpPut((String)localObject3);
    localObject1 = localObject5;
    Object localObject6 = MultipartEntityBuilder.create();
    localObject1 = localObject5;
    ((MultipartEntityBuilder)localObject6).setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
    localObject1 = localObject5;
    ((MultipartEntityBuilder)localObject6).addTextBody("title", str1, localContentType);
    localObject1 = localObject5;
    localObject3 = paramBehanceSDKPublishProjectServiceParamsDTO.getProjectCreativeFields();
    localObject1 = localObject5;
    if (!TextUtils.isEmpty((CharSequence)localObject3))
    {
      localObject1 = localObject5;
      ((MultipartEntityBuilder)localObject6).addTextBody("fields", (String)localObject3, localContentType);
    }
    localObject1 = localObject5;
    localObject3 = paramBehanceSDKPublishProjectServiceParamsDTO.getProjectTags();
    localObject1 = localObject5;
    if (!TextUtils.isEmpty((CharSequence)localObject3))
    {
      localObject1 = localObject5;
      ((MultipartEntityBuilder)localObject6).addTextBody("tags", (String)localObject3, localContentType);
    }
    localObject1 = localObject5;
    ((MultipartEntityBuilder)localObject6).addTextBody("description", paramBehanceSDKPublishProjectServiceParamsDTO.getProjectDescription(), localContentType);
    localObject1 = localObject5;
    ((MultipartEntityBuilder)localObject6).addTextBody("license", paramBehanceSDKPublishProjectServiceParamsDTO.getProjectCopyright(), localContentType);
    localObject1 = localObject5;
    if (paramBehanceSDKPublishProjectServiceParamsDTO.isProjectContainsAdultContent()) {}
    for (localObject3 = "1";; localObject3 = "0")
    {
      localObject1 = localObject5;
      ((MultipartEntityBuilder)localObject6).addTextBody("mature_content", (String)localObject3, localContentType);
      localObject1 = localObject5;
      ((MultipartEntityBuilder)localObject6).addTextBody("published", "1", localContentType);
      localObject1 = localObject5;
      ((HttpPut)localObject4).setEntity(((MultipartEntityBuilder)localObject6).build());
      localObject1 = localObject5;
      localObject3 = BehanceSDKHTTPUtils.doHTTPPut((HttpPut)localObject4);
      localObject1 = localObject5;
      if (((HTTPResponse)localObject3).getStatusCode() == 200)
      {
        localObject1 = localObject5;
        localBehanceSDKPublishProjectTaskResult.setStatus(BehanceSDKPublishProjectTaskResult.PublishStatus.SUCCESS);
        localObject1 = localObject5;
        paramBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.MODULES_UPLOAD_SUCCESSFUL);
        localObject1 = localObject5;
        paramBehanceSDKPublishProjectStatusDTO.setProgressPercentage(getProgressPercentage(BehanceSDKPublishProjectProgressState.MODULES_UPLOAD_SUCCESSFUL, paramBehanceSDKPublishProjectServiceParamsDTO));
        localObject1 = localObject5;
        broadcastProgressUpdate(paramBehanceSDKPublishProjectStatusDTO);
        return localBehanceSDKPublishProjectTaskResult;
      }
      localObject1 = localObject5;
      deleteProject((String)localObject5, paramBehanceSDKPublishProjectServiceParamsDTO, localHashMap);
      localObject1 = localObject5;
      paramBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.PUBLISH_FAILED);
      localObject1 = localObject5;
      paramBehanceSDKPublishProjectStatusDTO.setReasonPhrase(((HTTPResponse)localObject3).getReasonPhrase());
      localObject1 = localObject5;
      broadcastProgressUpdate(paramBehanceSDKPublishProjectStatusDTO);
      localObject1 = localObject5;
      localBehanceSDKPublishProjectTaskResult.setStatus(BehanceSDKPublishProjectTaskResult.PublishStatus.PUBLISH_FAILED);
      localObject1 = localObject5;
      localBehanceSDKPublishProjectTaskResult.setReasonPhrase(((HTTPResponse)localObject3).getReasonPhrase());
      return localBehanceSDKPublishProjectTaskResult;
      label1715:
      if (!TextUtils.isEmpty(localObject1)) {
        deleteProject(localObject1, paramBehanceSDKPublishProjectServiceParamsDTO, localHashMap);
      }
      paramBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.PUBLISH_FAILED);
      paramBehanceSDKPublishProjectStatusDTO.setException((Throwable)localObject3);
      broadcastProgressUpdate(paramBehanceSDKPublishProjectStatusDTO);
      localBehanceSDKPublishProjectTaskResult.setStatus(BehanceSDKPublishProjectTaskResult.PublishStatus.EXCEPTION);
      localBehanceSDKPublishProjectTaskResult.setException((Throwable)localObject3);
      return localBehanceSDKPublishProjectTaskResult;
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
    if (projectBinder == null) {
      projectBinder = new BehanceSDKPublishProjectBinder();
    }
    return projectBinder;
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    projectBinder = null;
  }
  
  protected void onHandleIntent(Intent paramIntent)
  {
    activePublishRequestId = String.valueOf(System.currentTimeMillis());
    sdkUserManager = BehanceSDKUserManager.getInstance();
    NotificationCompat.Builder localBuilder = new NotificationCompat.Builder(this);
    localBuilder.setSmallIcon(R.drawable.bsdk_anim_list_publish_in_progress_indicator);
    localBuilder.setContentTitle(getString(R.string.bsdk_publish_project_service_in_progress_notification_title));
    localBuilder.setContentText(getString(R.string.bsdk_publish_project_service_in_progress_notification_text));
    localBuilder.setStyle(new NotificationCompat.BigTextStyle().bigText(getString(R.string.bsdk_publish_project_service_in_progress_notification_text)));
    localBuilder.setProgress(0, 0, true);
    startForeground(2001, localBuilder.build());
    paramIntent = paramIntent.getSerializableExtra("INTENT_EXTRA_PARAMS");
    BehanceSDKPublishProjectStatusDTO localBehanceSDKPublishProjectStatusDTO;
    if ((paramIntent instanceof BehanceSDKPublishProjectServiceParamsDTO))
    {
      paramIntent = (BehanceSDKPublishProjectServiceParamsDTO)paramIntent;
      localBehanceSDKPublishProjectStatusDTO = new BehanceSDKPublishProjectStatusDTO();
      if (!isActiveUploadCancelled()) {
        break label140;
      }
      broadcastUploadCancelledStatusUpdate();
    }
    label140:
    BehanceSDKPublishProjectTaskResult localBehanceSDKPublishProjectTaskResult;
    BehanceSDKPublishedProjectDTO localBehanceSDKPublishedProjectDTO;
    Object localObject;
    label378:
    do
    {
      return;
      localBehanceSDKPublishProjectTaskResult = publishProjectOnServer(paramIntent, localBehanceSDKPublishProjectStatusDTO);
      localBehanceSDKPublishedProjectDTO = localBehanceSDKPublishProjectTaskResult.getPublishedProject();
      localObject = paramIntent.getNotificationHandlerActivity();
      if ((localBehanceSDKPublishedProjectDTO != null) && (localBehanceSDKPublishProjectTaskResult.getStatus() == BehanceSDKPublishProjectTaskResult.PublishStatus.SUCCESS))
      {
        if ((!isActiveUploadCancelled()) && (paramIntent.isShareOnFacebook())) {
          publishOnFacebook(localBehanceSDKPublishedProjectDTO, paramIntent, localBehanceSDKPublishProjectStatusDTO);
        }
        if ((!isActiveUploadCancelled()) && (paramIntent.isShareOnTwitter())) {
          publishOnTwitter(paramIntent, localBehanceSDKPublishProjectStatusDTO);
        }
        if (isActiveUploadCancelled())
        {
          handleCancelAfterSuccessfulUpload(localBehanceSDKPublishedProjectDTO, paramIntent);
          return;
        }
        localBuilder.setContentTitle(getString(R.string.bsdk_publish_project_service_success_notification_title));
        localBuilder.setTicker(getString(R.string.bsdk_publish_project_service_success_notification_ticker));
        localBuilder.setContentText(getString(R.string.bsdk_publish_project_service_success_notification_text));
        localBuilder.setStyle(new NotificationCompat.BigTextStyle().bigText(getString(R.string.bsdk_publish_project_service_success_notification_text)));
        if (localObject != null)
        {
          localObject = createNotifyIntent((Class)localObject);
          ((Intent)localObject).putExtra("BEHANCE_SDK_PUBLISH_PROJECT_INTENT_BOOL_EXTRA_PUBLISHED_PROJECT_SUCCESSFULLY", true);
          ((Intent)localObject).putExtra("BEHANCE_SDK_PUBLISH_PROJECT_INTENT_STR_EXTRA_PUBLISHED_PROJECT_ID", localBehanceSDKPublishedProjectDTO.getProjectId());
          ((Intent)localObject).putExtra("BEHANCE_SDK_PUBLISH_PROJECT_INTENT_STR_EXTRA_PUBLISHED_PROJECT_TITLE", localBehanceSDKPublishedProjectDTO.getProjectTitle());
          localBuilder.setContentIntent(createPendingIntent((Intent)localObject));
        }
        localBehanceSDKPublishProjectStatusDTO.setProgressState(BehanceSDKPublishProjectProgressState.PUBLISH_SUCCESSFUL);
        localBehanceSDKPublishProjectStatusDTO.setProgressPercentage(getProgressPercentage(BehanceSDKPublishProjectProgressState.PUBLISH_SUCCESSFUL, paramIntent));
        broadcastProgressUpdate(localBehanceSDKPublishProjectStatusDTO);
        if (isActiveUploadCancelled()) {
          break;
        }
        localBuilder.setSmallIcon(R.drawable.bsdk_icon_notification_publish_progress);
        localBuilder.setProgress(0, 0, false);
        localBuilder.setAutoCancel(true);
        paramIntent = localBuilder.build();
        ((NotificationManager)getSystemService("notification")).notify(2002, paramIntent);
        return;
      }
    } while (isActiveUploadCancelled());
    localBuilder.setContentTitle(getString(R.string.bsdk_publish_project_service_failure_notification_title));
    localBuilder.setTicker(getString(R.string.bsdk_publish_project_service_failure_notification_ticker));
    paramIntent = localBehanceSDKPublishProjectTaskResult.getReasonPhrase();
    if (paramIntent != null) {}
    for (paramIntent = getString(R.string.bsdk_publish_project_service_failure_notification_msg, new Object[] { paramIntent });; paramIntent = getString(R.string.bsdk_publish_project_service_unknown_failure_notification_msg))
    {
      localBuilder.setContentText(paramIntent);
      localBuilder.setStyle(new NotificationCompat.BigTextStyle().bigText(paramIntent));
      if (localObject == null) {
        break label378;
      }
      localObject = createNotifyIntent((Class)localObject);
      ((Intent)localObject).putExtra("BEHANCE_SDK_PUBLISH_PROJECT_INTENT_BOOL_EXTRA_PUBLISHED_PROJECT_SUCCESSFULLY", false);
      ((Intent)localObject).putExtra("BEHANCE_SDK_PUBLISH_PROJECT_INTENT_STR_EXTRA_PUBLISHED_PROJECT_ID", localBehanceSDKPublishedProjectDTO.getProjectId());
      ((Intent)localObject).putExtra("BEHANCE_SDK_PUBLISH_PROJECT_INTENT_STR_EXTRA_PUBLISHED_PROJECT_TITLE", localBehanceSDKPublishedProjectDTO.getProjectTitle());
      ((Intent)localObject).putExtra("BEHANCE_SDK_PUBLISH_PROJECT_INTENT_STR_EXTRA_PUBLISH_PROJECT_FAILURE_MSG", paramIntent);
      localBuilder.setContentIntent(createPendingIntent((Intent)localObject));
      break label378;
      break;
    }
  }
  
  public boolean onUnbind(Intent paramIntent)
  {
    return super.onUnbind(paramIntent);
  }
  
  private class ProjectModuleUploadEntityWrapperCallback
    implements CustomHttpEntityWrapper.CustomHttpEntityWrapperCallback
  {
    private final HttpPost httpPost;
    private int lastBroadcastedProgressPercentage = 0;
    private final BehanceSDKPublishProjectServiceParamsDTO serviceParams;
    private final BehanceSDKPublishProjectStatusDTO statusDTO;
    private final int uploadedModulesCount;
    
    private ProjectModuleUploadEntityWrapperCallback(BehanceSDKPublishProjectServiceParamsDTO paramBehanceSDKPublishProjectServiceParamsDTO, BehanceSDKPublishProjectStatusDTO paramBehanceSDKPublishProjectStatusDTO, HttpPost paramHttpPost, int paramInt)
    {
      serviceParams = paramBehanceSDKPublishProjectServiceParamsDTO;
      uploadedModulesCount = paramInt;
      httpPost = paramHttpPost;
      statusDTO = paramBehanceSDKPublishProjectStatusDTO;
    }
    
    public void onUploadProgressUpdate(float paramFloat)
    {
      int i = (int)paramFloat;
      if ((i % 10 == 0) && (lastBroadcastedProgressPercentage != i))
      {
        lastBroadcastedProgressPercentage = i;
        if (i < 100)
        {
          statusDTO.setProgressState(BehanceSDKPublishProjectProgressState.MODULES_UPLOAD_IN_PROGRESS);
          statusDTO.setProgressPercentage(BehanceSDKPublishProjectService.this.convertModuleUploadProgressPercentage(serviceParams, uploadedModulesCount, lastBroadcastedProgressPercentage));
          BehanceSDKPublishProjectService.this.broadcastProgressUpdate(statusDTO);
          if (BehanceSDKPublishProjectService.this.isActiveUploadCancelled()) {
            httpPost.abort();
          }
        }
      }
    }
  }
}
