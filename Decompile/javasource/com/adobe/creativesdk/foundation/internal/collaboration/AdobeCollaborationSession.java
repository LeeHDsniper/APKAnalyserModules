package com.adobe.creativesdk.foundation.internal.collaboration;

import android.net.Uri;
import android.os.Handler;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIMSEnvironment;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaboration;
import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaborationInvite;
import com.adobe.creativesdk.foundation.internal.comments.IAdobeAddCommentCallback;
import com.adobe.creativesdk.foundation.internal.comments.IAdobeDeleteCommentCallback;
import com.adobe.creativesdk.foundation.internal.comments.IAdobeGetCommentsCallback;
import com.adobe.creativesdk.foundation.internal.comments.models.AdobeAssetCommentsDataSource;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequest;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequestMethod;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpResponse;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpService;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpTaskHandle;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkRequestPriority;
import com.adobe.creativesdk.foundation.internal.net.IAdobeNetworkCompletionHandler;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeCollaborationSession
{
  private static AdobeAuthIMSEnvironment imsEnvironment;
  private static AdobeAuthIdentityManagementService imsService;
  private static LoginNotificationObserver observer = null;
  private static Map<AdobeNetworkHttpRequest, AdobeNetworkHttpTaskHandle> requestMap;
  private static AdobeCollaborationSession sharedSession = null;
  private AdobeNetworkHttpService service;
  
  private AdobeCollaborationSession()
  {
    observer = new LoginNotificationObserver(null);
  }
  
  private String dataUsingEncoding(String paramString)
  {
    return paramString;
  }
  
  private AdobeCollaborationException getCollaborationExceptionFromNetworkResponse(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse)
  {
    Object localObject;
    if (paramAdobeNetworkHttpResponse == null) {
      localObject = null;
    }
    AdobeCollaborationException localAdobeCollaborationException;
    do
    {
      return localObject;
      localAdobeCollaborationException = null;
      if (paramAdobeNetworkHttpResponse.getStatusCode() == 401) {
        localAdobeCollaborationException = AdobeCollaborationErrUtils.createCollaborationError(AdobeCollaborationErrorCode.ADOBE_COLLABORATION_ERROR_UNAUTHORIZED, paramAdobeNetworkHttpResponse.getUrl(), paramAdobeNetworkHttpResponse.getDataBytes(), paramAdobeNetworkHttpResponse.getStatusCode(), paramAdobeNetworkHttpResponse.getHeaders());
      }
      localObject = localAdobeCollaborationException;
    } while (localAdobeCollaborationException != null);
    return AdobeCollaborationErrUtils.createCollaborationError(AdobeCollaborationErrorCode.ADOBE_COLLABORATION_ERROR_UNEXPECTED_RESPONSE, paramAdobeNetworkHttpResponse.getUrl(), paramAdobeNetworkHttpResponse.getDataBytes(), paramAdobeNetworkHttpResponse.getStatusCode(), paramAdobeNetworkHttpResponse.getHeaders());
  }
  
  private AdobeNetworkHttpRequest getResponseFor(final AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest, String paramString1, String paramString2, final IAdobeCollaborationResponseCallback paramIAdobeCollaborationResponseCallback)
  {
    try
    {
      Handler localHandler1 = new Handler();
      paramIAdobeCollaborationResponseCallback = new IAdobeNetworkCompletionHandler()
      {
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          paramIAdobeCollaborationResponseCallback.onError(paramAnonymousAdobeNetworkException);
        }
        
        public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          AdobeCollaborationSession.requestMap.remove(paramAdobeNetworkHttpRequest);
          paramIAdobeCollaborationResponseCallback.onComplete(paramAnonymousAdobeNetworkHttpResponse);
        }
      };
      if (paramString1 == null)
      {
        if (paramString2 != null) {
          paramAdobeNetworkHttpRequest.setBody(paramString2.getBytes());
        }
        paramString1 = service.getResponseForDataRequest(paramAdobeNetworkHttpRequest, AdobeNetworkRequestPriority.NORMAL, paramIAdobeCollaborationResponseCallback, localHandler1);
        requestMap.put(paramAdobeNetworkHttpRequest, paramString1);
        return paramAdobeNetworkHttpRequest;
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Handler localHandler2 = null;
        continue;
        if (paramAdobeNetworkHttpRequest.getRequestMethod() == AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET) {
          paramString1 = service.getResponseForDownloadRequest(paramAdobeNetworkHttpRequest, paramString1, AdobeNetworkRequestPriority.NORMAL, paramIAdobeCollaborationResponseCallback, localHandler2);
        } else if (paramAdobeNetworkHttpRequest.getRequestMethod() == AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodHEAD) {
          paramString1 = service.getResponseForDataRequest(paramAdobeNetworkHttpRequest, AdobeNetworkRequestPriority.NORMAL, paramIAdobeCollaborationResponseCallback, localHandler2);
        } else {
          paramString1 = service.getResponseForUploadRequest(paramAdobeNetworkHttpRequest, paramString1, AdobeNetworkRequestPriority.NORMAL, paramIAdobeCollaborationResponseCallback, localHandler2);
        }
      }
    }
  }
  
  private AdobeNetworkHttpRequest getResponseForString(String paramString, IAdobeCollaborationResponseCallback paramIAdobeCollaborationResponseCallback)
  {
    return getResponseForString(paramString, AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET, null, null, paramIAdobeCollaborationResponseCallback);
  }
  
  private AdobeNetworkHttpRequest getResponseForString(String paramString, AdobeNetworkHttpRequestMethod paramAdobeNetworkHttpRequestMethod, IAdobeCollaborationResponseCallback paramIAdobeCollaborationResponseCallback)
  {
    return getResponseForString(paramString, paramAdobeNetworkHttpRequestMethod, null, null, paramIAdobeCollaborationResponseCallback);
  }
  
  private AdobeNetworkHttpRequest getResponseForString(String paramString1, AdobeNetworkHttpRequestMethod paramAdobeNetworkHttpRequestMethod, String paramString2, String paramString3, IAdobeCollaborationResponseCallback paramIAdobeCollaborationResponseCallback)
  {
    if (isEmpty(paramString1)) {}
    while ((!isEmpty(paramString2)) && (isEmpty(paramString3))) {
      return null;
    }
    try
    {
      AdobeNetworkHttpRequest localAdobeNetworkHttpRequest = new AdobeNetworkHttpRequest();
      localAdobeNetworkHttpRequest.setUrl(new URI(service.baseURL().toString() + "/" + paramString1).toURL());
      localAdobeNetworkHttpRequest.setRequestMethod(paramAdobeNetworkHttpRequestMethod);
      if (paramString2 != null)
      {
        localAdobeNetworkHttpRequest.setRequestProperty("Accept", paramString3);
        localAdobeNetworkHttpRequest.setRequestProperty("Content-Type", paramString3);
      }
      if (paramString2 != null) {}
      for (paramString1 = dataUsingEncoding(paramString2);; paramString1 = null)
      {
        paramString1 = getResponseFor(localAdobeNetworkHttpRequest, null, paramString1, paramIAdobeCollaborationResponseCallback);
        return paramString1;
      }
      return null;
    }
    catch (URISyntaxException paramString1)
    {
      paramString1.printStackTrace();
      return null;
    }
    catch (MalformedURLException paramString1)
    {
      paramString1.printStackTrace();
    }
  }
  
  private AdobeNetworkHttpResponse getResponseFromError(AdobeNetworkException paramAdobeNetworkException)
  {
    if ((paramAdobeNetworkException.getData() == null) || (!paramAdobeNetworkException.getData().containsKey("Response"))) {
      return null;
    }
    return (AdobeNetworkHttpResponse)paramAdobeNetworkException.getData().get("Response");
  }
  
  public static AdobeCollaborationSession getSharedSession()
  {
    for (;;)
    {
      HashMap localHashMap;
      try
      {
        String str2;
        if (sharedSession == null)
        {
          sharedSession = new AdobeCollaborationSession();
          imsService = AdobeAuthIdentityManagementService.getSharedInstance();
          str2 = imsService.getAccessToken();
          imsEnvironment = imsService.getEnvironment();
          localObject1 = null;
          localHashMap = new HashMap();
        }
        switch (15.$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment[imsEnvironment.ordinal()])
        {
        case 2: 
          AdobeLogger.log(Level.ERROR, "Collaboration Session", "An undefined authentication endpoint has been specified for the collaboration session");
          requestMap = new HashMap();
          localObject1 = new AdobeNetworkHttpService((String)localObject1, imsService.getClientID(), localHashMap);
          ((AdobeNetworkHttpService)localObject1).setAccessToken(str2);
          sharedSession.initWithHTTPService((AdobeNetworkHttpService)localObject1);
          AdobeCollaborationSessionModel.getSharedModel().setCollaborationSession(sharedSession);
          ((AdobeNetworkHttpService)localObject1).setHttpServiceDelegate(AdobeCollaborationSessionModel.getSharedModel());
          AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLoginNotification, observer);
          AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLogoutNotification, observer);
          AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLoginExternalNotification, observer);
          localObject1 = sharedSession;
          return localObject1;
        }
      }
      finally {}
      Object localObject1 = "https://cc-collab-stage.adobe.io";
      localHashMap.put("x-api-key", imsService.getClientID());
      continue;
      String str1 = "https://cc-collab.adobe.io";
      localHashMap.put("x-api-key", imsService.getClientID());
      continue;
      continue;
      str1 = "https://cc-collab-dev.adobe.io";
    }
  }
  
  private boolean isEmpty(String paramString)
  {
    return (paramString == null) || (paramString.length() == 0);
  }
  
  private static JSONArray jsonArrayFromResponse(String paramString)
  {
    try
    {
      paramString = new JSONArray(paramString);
      return paramString;
    }
    catch (JSONException paramString)
    {
      paramString.printStackTrace();
    }
    return null;
  }
  
  private static JSONObject jsonObjectFromResponse(String paramString)
  {
    try
    {
      paramString = new JSONObject(paramString);
      return paramString;
    }
    catch (JSONException paramString)
    {
      paramString.printStackTrace();
    }
    return null;
  }
  
  public AdobeNetworkHttpRequest createComment(AdobeAsset paramAdobeAsset, String paramString1, String paramString2, String paramString3, final IAdobeAddCommentCallback paramIAdobeAddCommentCallback)
  {
    if (paramAdobeAsset == null)
    {
      AdobeLogger.log(Level.ERROR, "createComment", "resource cannot be null.");
      paramIAdobeAddCommentCallback.onError();
    }
    for (;;)
    {
      return null;
      try
      {
        JSONObject localJSONObject = new JSONObject();
        localJSONObject.put("resourceType", "application/vnd.adobe.asset");
        localJSONObject.put("resource", paramAdobeAsset.getHref());
        localJSONObject.put("username", paramString1);
        localJSONObject.put("email", paramString2);
        localJSONObject.put("content", paramString3);
        localJSONObject.put("attributes", new JSONObject());
        if (localJSONObject != null)
        {
          paramAdobeAsset = new IAdobeCollaborationResponseCallback()
          {
            public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
            {
              String str = "";
              try
              {
                paramAnonymousAdobeNetworkHttpResponse = (String)((List)paramAnonymousAdobeNetworkHttpResponse.getHeaders().get("location")).get(0);
                paramIAdobeAddCommentCallback.onSuccess(paramAnonymousAdobeNetworkHttpResponse);
                return;
              }
              catch (Exception paramAnonymousAdobeNetworkHttpResponse)
              {
                for (;;)
                {
                  paramAnonymousAdobeNetworkHttpResponse = str;
                }
              }
            }
            
            public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
            {
              paramIAdobeAddCommentCallback.onError();
            }
          };
          paramAdobeAsset = getResponseForString("comments", AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodPOST, localJSONObject.toString(), "application/json", paramAdobeAsset);
          return paramAdobeAsset;
        }
      }
      catch (JSONException paramAdobeAsset)
      {
        paramIAdobeAddCommentCallback.onError();
      }
    }
    return null;
  }
  
  public AdobeNetworkHttpRequest createInvite(AdobeAssetFolder paramAdobeAssetFolder, String paramString, final IAdobeCollaborationInviteUserCallBack paramIAdobeCollaborationInviteUserCallBack)
  {
    if (paramAdobeAssetFolder == null)
    {
      paramIAdobeCollaborationInviteUserCallBack.onError(AdobeCollaborationErrUtils.createCollaborationError(AdobeCollaborationErrorCode.ADOBE_COLLABORATION_ERROR_INVALID_FOLDER, null, "Invalid Folder"));
      return null;
    }
    if ((paramString == null) || (paramString.length() == 0))
    {
      paramIAdobeCollaborationInviteUserCallBack.onError(AdobeCollaborationErrUtils.createCollaborationError(AdobeCollaborationErrorCode.ADOBE_COLLABORATION_ERROR_INVALID_EMAIL, null, "Invalid Email Address"));
      return null;
    }
    if (!Pattern.compile("^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}").matcher(paramString).find())
    {
      paramIAdobeCollaborationInviteUserCallBack.onError(AdobeCollaborationErrUtils.createCollaborationError(AdobeCollaborationErrorCode.ADOBE_COLLABORATION_ERROR_INVALID_EMAIL, null, "Invalid Email Address"));
      return null;
    }
    paramIAdobeCollaborationInviteUserCallBack = new IAdobeCollaborationResponseCallback()
    {
      public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        int i = paramAnonymousAdobeNetworkHttpResponse.getStatusCode();
        if ((i >= 200) && (i <= 299))
        {
          paramAnonymousAdobeNetworkHttpResponse = AdobeCollaborationInvite.inviteWithDictionary(AdobeCollaborationSession.jsonObjectFromResponse(paramAnonymousAdobeNetworkHttpResponse.getDataString()));
          paramIAdobeCollaborationInviteUserCallBack.onComplete(paramAnonymousAdobeNetworkHttpResponse);
          return;
        }
        paramIAdobeCollaborationInviteUserCallBack.onError(AdobeCollaborationSession.this.getCollaborationExceptionFromNetworkResponse(paramAnonymousAdobeNetworkHttpResponse));
      }
      
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        AdobeNetworkHttpResponse localAdobeNetworkHttpResponse = AdobeCollaborationSession.this.getResponseFromError(paramAnonymousAdobeNetworkException);
        if (localAdobeNetworkHttpResponse != null) {}
        for (paramAnonymousAdobeNetworkException = AdobeCollaborationSession.this.getCollaborationExceptionFromNetworkResponse(localAdobeNetworkHttpResponse);; paramAnonymousAdobeNetworkException = new AdobeCollaborationException(AdobeCollaborationErrorCode.ADOBE_COLLABORATION_ERROR_UNEXPECTED_RESPONSE, paramAnonymousAdobeNetworkException.getData(), null))
        {
          paramIAdobeCollaborationInviteUserCallBack.onError(paramAnonymousAdobeNetworkException);
          return;
        }
      }
    };
    paramAdobeAssetFolder = String.format("{\"resourceUrl\": \"%s%s\",\"recipientEmail\": \"%s\",\"resourceType\": \"CCStorage\"}", new Object[] { "https://cc-api-storage.adobe.io", paramAdobeAssetFolder.getHref().toString(), paramString });
    return getResponseForString("invites", AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodPOST, paramAdobeAssetFolder, "application/json", paramIAdobeCollaborationInviteUserCallBack);
  }
  
  public AdobeNetworkHttpRequest createNewLink(String paramString1, String paramString2, String paramString3, boolean paramBoolean1, boolean paramBoolean2, final IAdobeCollaborationPublicLinkCallBack paramIAdobeCollaborationPublicLinkCallBack)
  {
    if (paramString1 == null)
    {
      paramIAdobeCollaborationPublicLinkCallBack.onError(400);
      return null;
    }
    IAdobeCollaborationResponseCallback local8 = new IAdobeCollaborationResponseCallback()
    {
      public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        paramAnonymousAdobeNetworkHttpResponse = ((String)((List)paramAnonymousAdobeNetworkHttpResponse.getHeaders().get("location")).get(0)).split("/");
        paramAnonymousAdobeNetworkHttpResponse = String.format("https://assets.adobe.com/link/%s", new Object[] { paramAnonymousAdobeNetworkHttpResponse[(paramAnonymousAdobeNetworkHttpResponse.length - 1)] });
        paramIAdobeCollaborationPublicLinkCallBack.onComplete(paramAnonymousAdobeNetworkHttpResponse);
      }
      
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramIAdobeCollaborationPublicLinkCallBack.onError(paramAnonymousAdobeNetworkException.getStatusCode().intValue());
      }
    };
    Object localObject2 = null;
    Object localObject1 = null;
    String str = null;
    if (!paramString2.contains("application/vnd.adobe"))
    {
      str = "application/vnd.adobe.asset";
      localObject1 = paramString1;
    }
    for (;;)
    {
      try
      {
        paramString1 = new JSONObject();
        paramString1.put("download", paramBoolean1);
        paramString1.put("comment", paramBoolean2);
        paramString2 = new JSONObject();
        paramString2.put("resource", localObject1);
        paramString2.put("name", paramString3);
        paramString2.put("resourceType", str);
        paramString2.put("permissions", paramString1);
        paramString1 = paramString2.toString();
        if (paramString1 == null) {
          break;
        }
        paramString1 = getResponseForString("links", AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodPOST, paramString1, "application/json", local8);
        return paramString1;
      }
      catch (JSONException paramString1)
      {
        paramIAdobeCollaborationPublicLinkCallBack.onError(400);
      }
      if (paramString2.contains("vnd.adobe.directory"))
      {
        str = "application/x-sharedcloud-collection+json";
        localObject1 = paramString1;
      }
      else if ((paramString2.contains("vnd.adobe.library")) || (paramString2.contains("vnd.adobe.element")))
      {
        str = null;
        switch (15.$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment[imsEnvironment.ordinal()])
        {
        default: 
          localObject1 = localObject2;
          if (str != null) {
            localObject1 = String.format("%s/assets/adobe-libraries/%s", new Object[] { str, paramString1 });
          }
          if (paramString2.contains("vnd.adobe.library")) {
            str = "application/vnd.adobe.library+dcx";
          }
          break;
        case 2: 
          str = "https://cc-api-storage-stage.adobe.io";
          break;
        case 3: 
          str = "https://cc-api-storage.adobe.io";
          continue;
          str = paramString2;
        }
      }
    }
    return null;
  }
  
  public AdobeNetworkHttpRequest deleteComment(String paramString, final IAdobeDeleteCommentCallback paramIAdobeDeleteCommentCallback)
  {
    if (paramString == null)
    {
      AdobeLogger.log(Level.ERROR, "deleteComment", "url cannot be null");
      paramIAdobeDeleteCommentCallback.onError();
      return null;
    }
    String str = String.format("%s", new Object[] { paramString });
    paramIAdobeDeleteCommentCallback = new IAdobeCollaborationResponseCallback()
    {
      public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        paramIAdobeDeleteCommentCallback.onSuccess();
      }
      
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramIAdobeDeleteCommentCallback.onError();
      }
    };
    try
    {
      paramString = new URL(paramString);
      AdobeNetworkHttpRequest localAdobeNetworkHttpRequest = new AdobeNetworkHttpRequest();
      localAdobeNetworkHttpRequest.setUrl(paramString);
      localAdobeNetworkHttpRequest.setRequestMethod(AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodDELETE);
      paramString = getResponseFor(localAdobeNetworkHttpRequest, null, null, paramIAdobeDeleteCommentCallback);
      return paramString;
    }
    catch (MalformedURLException paramString)
    {
      paramString.printStackTrace();
    }
    return getResponseForString(str, AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodDELETE, paramIAdobeDeleteCommentCallback);
  }
  
  public AdobeNetworkHttpRequest getCollaboration(AdobeAssetFolder paramAdobeAssetFolder, final IAdobeCollaborationGetCollaborationCallback paramIAdobeCollaborationGetCollaborationCallback)
  {
    if (paramAdobeAssetFolder == null)
    {
      paramIAdobeCollaborationGetCollaborationCallback.onError(AdobeCollaborationErrUtils.createCollaborationError(AdobeCollaborationErrorCode.ADOBE_COLLABORATION_ERROR_INVALID_FOLDER, null, "Invalid Folder"));
      return null;
    }
    getResponseForString(String.format("collaboration%s?fields=ownerId", new Object[] { Uri.encode(paramAdobeAssetFolder.getHref().toString()).replace("%2F", "/").toString() }), new IAdobeCollaborationResponseCallback()
    {
      public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        int i = paramAnonymousAdobeNetworkHttpResponse.getStatusCode();
        if ((i >= 200) && (i <= 299))
        {
          paramAnonymousAdobeNetworkHttpResponse.getDataString();
          paramAnonymousAdobeNetworkHttpResponse = AdobeCollaboration.collaborationWithDictionary(AdobeCollaborationSession.jsonObjectFromResponse(paramAnonymousAdobeNetworkHttpResponse.getDataString()));
          paramIAdobeCollaborationGetCollaborationCallback.onComplete(paramAnonymousAdobeNetworkHttpResponse);
          return;
        }
        paramIAdobeCollaborationGetCollaborationCallback.onError(AdobeCollaborationSession.this.getCollaborationExceptionFromNetworkResponse(paramAnonymousAdobeNetworkHttpResponse));
      }
      
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        AdobeNetworkHttpResponse localAdobeNetworkHttpResponse = AdobeCollaborationSession.this.getResponseFromError(paramAnonymousAdobeNetworkException);
        if (localAdobeNetworkHttpResponse != null) {}
        for (paramAnonymousAdobeNetworkException = AdobeCollaborationSession.this.getCollaborationExceptionFromNetworkResponse(localAdobeNetworkHttpResponse);; paramAnonymousAdobeNetworkException = new AdobeCollaborationException(AdobeCollaborationErrorCode.ADOBE_COLLABORATION_ERROR_UNEXPECTED_RESPONSE, paramAnonymousAdobeNetworkException.getData(), null))
        {
          paramIAdobeCollaborationGetCollaborationCallback.onError(paramAnonymousAdobeNetworkException);
          return;
        }
      }
    });
  }
  
  public AdobeNetworkHttpRequest getComments(final AdobeAsset paramAdobeAsset, final IAdobeGetCommentsCallback paramIAdobeGetCommentsCallback)
  {
    if (paramAdobeAsset == null)
    {
      AdobeLogger.log(Level.ERROR, "GetComments", "Resource Cannot be Null");
      return null;
    }
    getResponseForString(String.format("comments%s", new Object[] { Uri.encode(paramAdobeAsset.getHref().toString()).replace("%2F", "/").toString() }), new IAdobeCollaborationResponseCallback()
    {
      public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        paramAnonymousAdobeNetworkHttpResponse = paramAnonymousAdobeNetworkHttpResponse.getDataString();
        try
        {
          paramAnonymousAdobeNetworkHttpResponse = new JSONArray(paramAnonymousAdobeNetworkHttpResponse);
          paramIAdobeGetCommentsCallback.onSuccess(AdobeAssetCommentsDataSource.commentsFromJSONData(paramAnonymousAdobeNetworkHttpResponse, paramAdobeAsset));
          return;
        }
        catch (JSONException paramAnonymousAdobeNetworkHttpResponse)
        {
          paramAnonymousAdobeNetworkHttpResponse.printStackTrace();
        }
      }
      
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramIAdobeGetCommentsCallback.onError();
      }
    });
  }
  
  public AdobeNetworkHttpRequest getInvites(final IAdobeCollaborationGetInvitesCallBack paramIAdobeCollaborationGetInvitesCallBack)
  {
    getResponseForString("invites", new IAdobeCollaborationResponseCallback()
    {
      public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        int i = paramAnonymousAdobeNetworkHttpResponse.getStatusCode();
        if ((i >= 200) && (i <= 299)) {}
        for (;;)
        {
          try
          {
            Object localObject = paramAnonymousAdobeNetworkHttpResponse.getDataString();
            JSONArray localJSONArray = AdobeCollaborationSession.jsonArrayFromResponse((String)localObject);
            paramAnonymousAdobeNetworkHttpResponse = null;
            if (localObject != null)
            {
              localObject = new ArrayList();
              i = 0;
              paramAnonymousAdobeNetworkHttpResponse = (AdobeNetworkHttpResponse)localObject;
              if (i < localJSONArray.length())
              {
                paramAnonymousAdobeNetworkHttpResponse = AdobeCollaborationInvite.inviteWithDictionary(localJSONArray.getJSONObject(i));
                if (paramAnonymousAdobeNetworkHttpResponse == null) {
                  break label115;
                }
                ((ArrayList)localObject).add(paramAnonymousAdobeNetworkHttpResponse);
                break label115;
              }
            }
            paramIAdobeCollaborationGetInvitesCallBack.onComplete(paramAnonymousAdobeNetworkHttpResponse);
            return;
          }
          catch (JSONException paramAnonymousAdobeNetworkHttpResponse)
          {
            paramAnonymousAdobeNetworkHttpResponse.printStackTrace();
            return;
          }
          paramIAdobeCollaborationGetInvitesCallBack.onError(AdobeCollaborationSession.this.getCollaborationExceptionFromNetworkResponse(paramAnonymousAdobeNetworkHttpResponse));
          return;
          label115:
          i += 1;
        }
      }
      
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        AdobeNetworkHttpResponse localAdobeNetworkHttpResponse = AdobeCollaborationSession.this.getResponseFromError(paramAnonymousAdobeNetworkException);
        if (localAdobeNetworkHttpResponse != null) {}
        for (paramAnonymousAdobeNetworkException = AdobeCollaborationSession.this.getCollaborationExceptionFromNetworkResponse(localAdobeNetworkHttpResponse);; paramAnonymousAdobeNetworkException = new AdobeCollaborationException(AdobeCollaborationErrorCode.ADOBE_COLLABORATION_ERROR_UNEXPECTED_RESPONSE, paramAnonymousAdobeNetworkException.getData(), null))
        {
          paramIAdobeCollaborationGetInvitesCallBack.onError(paramAnonymousAdobeNetworkException);
          return;
        }
      }
    });
  }
  
  public AdobeCollaborationSession initWithHTTPService(AdobeNetworkHttpService paramAdobeNetworkHttpService)
  {
    service = paramAdobeNetworkHttpService;
    return this;
  }
  
  public AdobeNetworkHttpRequest rejectInvite(String paramString, final IAdobeCollaborationAcceptOrRejectInviteCallBack paramIAdobeCollaborationAcceptOrRejectInviteCallBack)
  {
    if ((paramString == null) || (paramString.length() == 0))
    {
      paramIAdobeCollaborationAcceptOrRejectInviteCallBack.onError(AdobeCollaborationErrUtils.createCollaborationError(AdobeCollaborationErrorCode.ADOBE_COLLABORATION_ERROR_INVALID_INVITE_ID, null, "Invalid Invitation ID"));
      return null;
    }
    paramIAdobeCollaborationAcceptOrRejectInviteCallBack = new IAdobeCollaborationResponseCallback()
    {
      public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        int i = paramAnonymousAdobeNetworkHttpResponse.getStatusCode();
        if ((i >= 200) && (i <= 299))
        {
          paramIAdobeCollaborationAcceptOrRejectInviteCallBack.onComplete();
          return;
        }
        paramIAdobeCollaborationAcceptOrRejectInviteCallBack.onError(AdobeCollaborationSession.this.getCollaborationExceptionFromNetworkResponse(paramAnonymousAdobeNetworkHttpResponse));
      }
      
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        AdobeNetworkHttpResponse localAdobeNetworkHttpResponse = AdobeCollaborationSession.this.getResponseFromError(paramAnonymousAdobeNetworkException);
        if (localAdobeNetworkHttpResponse != null) {}
        for (paramAnonymousAdobeNetworkException = AdobeCollaborationSession.this.getCollaborationExceptionFromNetworkResponse(localAdobeNetworkHttpResponse);; paramAnonymousAdobeNetworkException = new AdobeCollaborationException(AdobeCollaborationErrorCode.ADOBE_COLLABORATION_ERROR_UNEXPECTED_RESPONSE, paramAnonymousAdobeNetworkException.getData(), null))
        {
          paramIAdobeCollaborationAcceptOrRejectInviteCallBack.onError(paramAnonymousAdobeNetworkException);
          return;
        }
      }
    };
    return getResponseForString(String.format("invites/%s", new Object[] { paramString }), AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodDELETE, paramIAdobeCollaborationAcceptOrRejectInviteCallBack);
  }
  
  public AdobeNetworkHttpRequest removeCollaborator(AdobeAssetFolder paramAdobeAssetFolder, String paramString, final IAdobeCollaborationRemoveCollaboratorCallback paramIAdobeCollaborationRemoveCollaboratorCallback)
  {
    if (paramAdobeAssetFolder == null)
    {
      paramIAdobeCollaborationRemoveCollaboratorCallback.onError(AdobeCollaborationErrUtils.createCollaborationError(AdobeCollaborationErrorCode.ADOBE_COLLABORATION_ERROR_INVALID_FOLDER, null, "Invalid Folder"));
      return null;
    }
    if ((paramString == null) || (paramString.length() == 0))
    {
      paramIAdobeCollaborationRemoveCollaboratorCallback.onError(AdobeCollaborationErrUtils.createCollaborationError(AdobeCollaborationErrorCode.ADOBE_COLLABORATION_ERROR_INVALID_USER_ID, null, "Invalid User ID"));
      return null;
    }
    paramIAdobeCollaborationRemoveCollaboratorCallback = new IAdobeCollaborationResponseCallback()
    {
      public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        int i = paramAnonymousAdobeNetworkHttpResponse.getStatusCode();
        if ((i >= 200) && (i <= 299))
        {
          paramIAdobeCollaborationRemoveCollaboratorCallback.onComplete();
          return;
        }
        paramIAdobeCollaborationRemoveCollaboratorCallback.onError(AdobeCollaborationSession.this.getCollaborationExceptionFromNetworkResponse(paramAnonymousAdobeNetworkHttpResponse));
      }
      
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        AdobeNetworkHttpResponse localAdobeNetworkHttpResponse = AdobeCollaborationSession.this.getResponseFromError(paramAnonymousAdobeNetworkException);
        if (localAdobeNetworkHttpResponse != null) {}
        for (paramAnonymousAdobeNetworkException = AdobeCollaborationSession.this.getCollaborationExceptionFromNetworkResponse(localAdobeNetworkHttpResponse);; paramAnonymousAdobeNetworkException = new AdobeCollaborationException(AdobeCollaborationErrorCode.ADOBE_COLLABORATION_ERROR_UNEXPECTED_RESPONSE, paramAnonymousAdobeNetworkException.getData(), null))
        {
          paramIAdobeCollaborationRemoveCollaboratorCallback.onError(paramAnonymousAdobeNetworkException);
          return;
        }
      }
    };
    return getResponseForString(String.format("collaborators%s?user=%s", new Object[] { Uri.encode(paramAdobeAssetFolder.getHref().toString()).replace("%2F", "/").toString(), paramString }), AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodDELETE, paramIAdobeCollaborationRemoveCollaboratorCallback);
  }
  
  public AdobeNetworkHttpRequest retrieveLink(String paramString1, String paramString2, final IAdobeCollaborationPublicLinkCallBack paramIAdobeCollaborationPublicLinkCallBack)
  {
    if (paramString1 == null)
    {
      paramIAdobeCollaborationPublicLinkCallBack.onError(400);
      return null;
    }
    Object localObject2 = null;
    Object localObject1;
    if (!paramString2.contains("application/vnd.adobe")) {
      localObject1 = String.format("links%s", new Object[] { paramString1 });
    }
    while (localObject1 == null)
    {
      paramIAdobeCollaborationPublicLinkCallBack.onError(400);
      return null;
      if (paramString2.contains("vnd.adobe.directory"))
      {
        localObject1 = String.format("links%s", new Object[] { paramString1 });
      }
      else if (!paramString2.contains("vnd.adobe.library"))
      {
        localObject1 = localObject2;
        if (!paramString2.contains("vnd.adobe.element")) {
          break;
        }
      }
      else
      {
        paramString2 = null;
        switch (15.$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment[imsEnvironment.ordinal()])
        {
        }
        for (;;)
        {
          localObject1 = localObject2;
          if (paramString2 == null) {
            break;
          }
          localObject1 = String.format("links/%s/assets/adobe-libraries/%s", new Object[] { paramString2, paramString1 });
          break;
          paramString2 = "https://cc-api-storage-stage.adobe.io";
          continue;
          paramString2 = "https://cc-api-storage.adobe.io";
        }
      }
    }
    getResponseForString((String)localObject1, new IAdobeCollaborationResponseCallback()
    {
      public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        paramAnonymousAdobeNetworkHttpResponse = paramAnonymousAdobeNetworkHttpResponse.getDataString();
        try
        {
          paramAnonymousAdobeNetworkHttpResponse = new JSONObject(paramAnonymousAdobeNetworkHttpResponse);
          paramIAdobeCollaborationPublicLinkCallBack.onComplete((String)paramAnonymousAdobeNetworkHttpResponse.get("publicURL"));
          return;
        }
        catch (JSONException paramAnonymousAdobeNetworkHttpResponse)
        {
          paramIAdobeCollaborationPublicLinkCallBack.onError(400);
        }
      }
      
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramIAdobeCollaborationPublicLinkCallBack.onError(paramAnonymousAdobeNetworkException.getStatusCode().intValue());
      }
    });
  }
  
  public AdobeNetworkHttpService service()
  {
    return service;
  }
  
  private static abstract interface IAdobeCollaborationResponseCallback
  {
    public abstract void onComplete(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse);
    
    public abstract void onError(AdobeNetworkException paramAdobeNetworkException);
  }
  
  private class LoginNotificationObserver
    implements Observer
  {
    private LoginNotificationObserver() {}
    
    public void update(Observable paramObservable, Object paramObject)
    {
      paramObservable = (AdobeNotification)paramObject;
      if ((paramObservable.getId() == AdobeInternalNotificationID.AdobeAuthLoginNotification) || (paramObservable.getId() == AdobeInternalNotificationID.AdobeAuthLoginExternalNotification))
      {
        paramObservable = AdobeAuthIdentityManagementService.getSharedInstance();
        paramObject = service();
        paramObject.setAccessToken(paramObservable.getAccessToken());
        paramObject.setSuspended(false);
        AdobeCollaborationSessionModel.getSharedModel().login();
      }
      while (paramObservable.getId() != AdobeInternalNotificationID.AdobeAuthLogoutNotification) {
        return;
      }
      paramObservable = service();
      paramObservable.clearQueuedRequests();
      paramObservable.reconnect();
      paramObservable.setAccessToken(null);
      AdobeCollaborationSessionModel.getSharedModel().logout();
    }
  }
}
