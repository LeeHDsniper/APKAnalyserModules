package com.adobe.creativesdk.foundation.internal.ans.service;

import android.os.Build.VERSION;
import android.os.Handler;
import com.adobe.creativesdk.foundation.internal.PushNotification.delegates.IAdobeDeviceRegistrationCallback;
import com.adobe.creativesdk.foundation.internal.PushNotification.delegates.IAdobeDeviceUnregisterCallback;
import com.adobe.creativesdk.foundation.internal.PushNotification.delegates.IAdobeUpdateNotificationCallback;
import com.adobe.creativesdk.foundation.internal.PushNotification.model.AdobePushNotification;
import com.adobe.creativesdk.foundation.internal.ans.delegates.IAdobeANSResponseCallback;
import com.adobe.creativesdk.foundation.internal.ans.delegates.IAdobeNotificationQueryCallback;
import com.adobe.creativesdk.foundation.internal.ans.delegates.IAdobeNotificationUnreadCountCallback;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIMSEnvironment;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequest;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequestMethod;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpResponse;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpService;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkRequestPriority;
import com.adobe.creativesdk.foundation.internal.net.IAdobeNetworkCompletionHandler;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageUtils;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException.AdobeNetworkErrorCode;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Observable;
import java.util.Observer;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeANSSession
{
  private static String _userToken;
  private static LoginNotificationObserver observer = null;
  private static AdobeNetworkHttpService sharedService;
  private static AdobeANSSession sharedSession;
  
  private AdobeANSSession()
  {
    observer = new LoginNotificationObserver(null);
  }
  
  private static byte[] dataUsingEncoding(String paramString)
  {
    try
    {
      paramString = paramString.getBytes("UTF-8");
      return paramString;
    }
    catch (UnsupportedEncodingException paramString)
    {
      paramString.printStackTrace();
    }
    return null;
  }
  
  private static AdobeNetworkException getErrorFromResponse(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse, String paramString1, String paramString2)
  {
    return new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorBadRequest);
  }
  
  private AdobeNetworkHttpRequest getResponseFor(AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest, final AdobeNetworkHttpRequestMethod paramAdobeNetworkHttpRequestMethod, String paramString1, String paramString2, final IAdobeANSResponseCallback paramIAdobeANSResponseCallback)
  {
    paramAdobeNetworkHttpRequest.setRequestMethod(paramAdobeNetworkHttpRequestMethod);
    if (paramString1 != null)
    {
      paramAdobeNetworkHttpRequest.setRequestProperty("Content-Type", paramString2);
      paramAdobeNetworkHttpRequest.setRequestProperty("Content-length", String.format("%d", new Object[] { Integer.valueOf(paramString1.length()) }));
      paramAdobeNetworkHttpRequest.setBody(dataUsingEncoding(paramString1));
      new String(paramString1.getBytes());
    }
    paramAdobeNetworkHttpRequest.setRequestProperty("Accept", "application/json");
    try
    {
      paramString1 = new Handler();
      paramAdobeNetworkHttpRequestMethod = new IAdobeNetworkCompletionHandler()
      {
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          paramIAdobeANSResponseCallback.onError(paramAnonymousAdobeNetworkException);
        }
        
        public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          int i = paramAnonymousAdobeNetworkHttpResponse.getStatusCode();
          if ((i == 200) || (i == 201))
          {
            paramAnonymousAdobeNetworkHttpResponse = AdobeStorageUtils.JSONObjectWithData(paramAnonymousAdobeNetworkHttpResponse.getDataString());
            if (paramAnonymousAdobeNetworkHttpResponse != null) {
              paramIAdobeANSResponseCallback.onSuccess(paramAnonymousAdobeNetworkHttpResponse);
            }
            while ((paramAnonymousAdobeNetworkHttpResponse != null) || (paramAdobeNetworkHttpRequestMethod != AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodDELETE)) {
              return;
            }
            paramIAdobeANSResponseCallback.onSuccess(paramAnonymousAdobeNetworkHttpResponse);
            return;
          }
          onError(AdobeANSSession.getErrorFromResponse(paramAnonymousAdobeNetworkHttpResponse, null, null));
        }
      };
      sharedService.getResponseForDataRequest(paramAdobeNetworkHttpRequest, AdobeNetworkRequestPriority.NORMAL, paramAdobeNetworkHttpRequestMethod, paramString1);
      return paramAdobeNetworkHttpRequest;
    }
    catch (Exception paramString1)
    {
      for (;;)
      {
        paramString1 = null;
      }
    }
  }
  
  private static AdobeANSSession initWithHTTPService(AdobeNetworkHttpService paramAdobeNetworkHttpService)
  {
    if (sharedSession == null) {
      sharedSession = new AdobeANSSession();
    }
    sharedService = paramAdobeNetworkHttpService;
    return sharedSession;
  }
  
  public static void resetSharedSession()
  {
    sharedSession = null;
  }
  
  public static AdobeANSSession sharedSession()
  {
    Object localObject;
    if (sharedSession == null)
    {
      localObject = AdobeAuthIdentityManagementService.getSharedInstance();
      if ((((AdobeAuthIdentityManagementService)localObject).getAccessToken() == null) || (((AdobeAuthIdentityManagementService)localObject).getAccessToken().length() == 0)) {
        return null;
      }
      _userToken = String.format("Bearer %s", new Object[] { ((AdobeAuthIdentityManagementService)localObject).getAccessToken() });
      AdobeAuthIMSEnvironment localAdobeAuthIMSEnvironment = ((AdobeAuthIdentityManagementService)localObject).getEnvironment();
      localObject = null;
      new HashMap();
      switch (8.$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment[localAdobeAuthIMSEnvironment.ordinal()])
      {
      default: 
        AdobeLogger.log(Level.ERROR, "ANS Session", "An undefined authentication endpoint has been specified for the ANS session");
      }
    }
    for (;;)
    {
      sharedService = new AdobeNetworkHttpService((String)localObject, null, null);
      sharedSession = initWithHTTPService(sharedService);
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLoginNotification, observer);
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLogoutNotification, observer);
      return sharedSession;
      localObject = "https://stg-ans.oobesaas.adobe.com";
      continue;
      localObject = "https://ans.oobesaas.adobe.com";
    }
  }
  
  public AdobeNetworkHttpRequest queryNotifications(String paramString1, String paramString2, long paramLong1, long paramLong2, int paramInt, final IAdobeNotificationQueryCallback paramIAdobeNotificationQueryCallback)
  {
    if ((paramString2 == null) || (paramString2.length() == 0))
    {
      AdobeLogger.log(Level.ERROR, "queryNotifications", "device ID cannot be nil");
      paramIAdobeNotificationQueryCallback.onError();
      return null;
    }
    if ((paramInt < 1) || (paramInt > 10))
    {
      AdobeLogger.log(Level.ERROR, "queryNotifications", "page size must be between 1 and 10");
      paramIAdobeNotificationQueryCallback.onError();
      return null;
    }
    Object localObject2 = String.format("/ans/v1/notifications?from=%s&to=%s&page_size=%s", new Object[] { Long.valueOf(paramLong1), Long.valueOf(paramLong2), Integer.valueOf(paramInt) });
    Object localObject1 = null;
    try
    {
      localObject2 = new URL(sharedService.baseURL().toString() + (String)localObject2);
      localObject1 = localObject2;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      for (;;)
      {
        localMalformedURLException.printStackTrace();
      }
    }
    localObject2 = new AdobeNetworkHttpRequest();
    ((AdobeNetworkHttpRequest)localObject2).setUrl(localObject1);
    String.format("Bearer %s", new Object[] { AdobeAuthIdentityManagementService.getSharedInstance().getAccessToken() });
    ((AdobeNetworkHttpRequest)localObject2).setRequestProperty("x-user-token", _userToken);
    ((AdobeNetworkHttpRequest)localObject2).setRequestProperty("x-adobe-app-id", paramString1);
    ((AdobeNetworkHttpRequest)localObject2).setRequestProperty("x-adobe-device-id", paramString2);
    paramString1 = new IAdobeANSResponseCallback()
    {
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException) {}
      
      public void onSuccess(JSONObject paramAnonymousJSONObject)
      {
        paramIAdobeNotificationQueryCallback.onSuccess(paramAnonymousJSONObject);
      }
    };
    return getResponseFor((AdobeNetworkHttpRequest)localObject2, AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET, null, null, paramString1);
  }
  
  public AdobeNetworkHttpRequest queryUnreadNotificationCount(String paramString1, String paramString2, final IAdobeNotificationUnreadCountCallback paramIAdobeNotificationUnreadCountCallback)
  {
    if ((paramString2 == null) || (paramString2.length() == 0))
    {
      AdobeLogger.log(Level.ERROR, "queryUnreadNotificationCount", "userID ID cannot be nil");
      paramIAdobeNotificationUnreadCountCallback.onError();
      return null;
    }
    Object localObject1 = null;
    try
    {
      localObject2 = new URL(sharedService.baseURL().toString() + "/ans/v2/notifications/count");
      localObject1 = localObject2;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      for (;;)
      {
        Object localObject2;
        localMalformedURLException.printStackTrace();
      }
    }
    localObject2 = new AdobeNetworkHttpRequest();
    ((AdobeNetworkHttpRequest)localObject2).setUrl(localObject1);
    String.format("Bearer %s", new Object[] { AdobeAuthIdentityManagementService.getSharedInstance().getAccessToken() });
    ((AdobeNetworkHttpRequest)localObject2).setRequestProperty("x-user-token", _userToken);
    ((AdobeNetworkHttpRequest)localObject2).setRequestProperty("x-adobe-app-id", paramString1);
    ((AdobeNetworkHttpRequest)localObject2).setRequestProperty("x-adobe-device-id", paramString2);
    paramString1 = new IAdobeANSResponseCallback()
    {
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException) {}
      
      public void onSuccess(JSONObject paramAnonymousJSONObject)
      {
        int i = paramAnonymousJSONObject.optInt("unread-count");
        paramIAdobeNotificationUnreadCountCallback.onSuccess(i);
      }
    };
    return getResponseFor((AdobeNetworkHttpRequest)localObject2, AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET, null, null, paramString1);
  }
  
  public AdobeNetworkHttpRequest registerDevice(String paramString1, String paramString2, String paramString3, final IAdobeDeviceRegistrationCallback paramIAdobeDeviceRegistrationCallback)
  {
    if ((paramString2 == null) || (paramString2.length() == 0))
    {
      AdobeLogger.log(Level.ERROR, "registerDevice", "device token cannot be null.");
      paramIAdobeDeviceRegistrationCallback.onError();
      return null;
    }
    Object localObject = new JSONObject();
    try
    {
      ((JSONObject)localObject).putOpt("device-type", "Phone");
      ((JSONObject)localObject).putOpt("device-platform", "Android");
      ((JSONObject)localObject).putOpt("device-os-name", "android");
      ((JSONObject)localObject).putOpt("device-os-version", Build.VERSION.RELEASE.toString());
      ((JSONObject)localObject).putOpt("android-registration-id", paramString2);
      ((JSONObject)localObject).putOpt("android-package-name", paramString3);
      ((JSONObject)localObject).putOpt("locale", "en_US");
      localObject = ((JSONObject)localObject).toString();
      if (localObject != null)
      {
        paramString2 = null;
        try
        {
          paramString3 = new URL(sharedService.baseURL() + "/ans/v1/device");
          paramString2 = paramString3;
        }
        catch (MalformedURLException paramString3)
        {
          for (;;)
          {
            paramString3.printStackTrace();
          }
        }
        paramString3 = new AdobeNetworkHttpRequest();
        paramString3.setUrl(paramString2);
        paramString3.setRequestProperty("x-user-token", _userToken);
        paramString3.setRequestProperty("x-adobe-app-id", paramString1);
        paramString1 = new IAdobeANSResponseCallback()
        {
          public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
          {
            paramAnonymousAdobeNetworkException.toString();
          }
          
          public void onSuccess(JSONObject paramAnonymousJSONObject)
          {
            paramIAdobeDeviceRegistrationCallback.onSuccess(paramAnonymousJSONObject);
          }
        };
        return getResponseFor(paramString3, AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodPOST, (String)localObject, "application/json", paramString1);
      }
    }
    catch (JSONException paramString2)
    {
      for (;;)
      {
        paramString2.printStackTrace();
      }
      paramIAdobeDeviceRegistrationCallback.onError();
    }
    return null;
  }
  
  public AdobeNetworkHttpRequest unregisterDevice(String paramString1, String paramString2, final IAdobeDeviceUnregisterCallback paramIAdobeDeviceUnregisterCallback)
  {
    if ((paramString2 == null) || (paramString2.length() == 0))
    {
      AdobeLogger.log(Level.ERROR, "unregisterDevice", "device ID cannot be nil.");
      paramIAdobeDeviceUnregisterCallback.onError();
      return null;
    }
    Object localObject1 = null;
    try
    {
      localObject2 = new URL(sharedService.baseURL().toString() + "/ans/v1/device");
      localObject1 = localObject2;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      for (;;)
      {
        Object localObject2;
        localMalformedURLException.printStackTrace();
      }
    }
    localObject2 = new AdobeNetworkHttpRequest();
    ((AdobeNetworkHttpRequest)localObject2).setUrl(localObject1);
    ((AdobeNetworkHttpRequest)localObject2).setRequestProperty("x-user-token", _userToken);
    ((AdobeNetworkHttpRequest)localObject2).setRequestProperty("x-adobe-app-id", paramString1);
    ((AdobeNetworkHttpRequest)localObject2).setRequestProperty("x-adobe-device-id", paramString2);
    paramString1 = new IAdobeANSResponseCallback()
    {
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramIAdobeDeviceUnregisterCallback.onError();
      }
      
      public void onSuccess(JSONObject paramAnonymousJSONObject)
      {
        paramIAdobeDeviceUnregisterCallback.onSuccess();
      }
    };
    return getResponseFor((AdobeNetworkHttpRequest)localObject2, AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodDELETE, null, null, paramString1);
  }
  
  public AdobeNetworkHttpRequest updateNotifications(String paramString1, ArrayList<AdobePushNotification> paramArrayList, String paramString2, final IAdobeUpdateNotificationCallback paramIAdobeUpdateNotificationCallback)
  {
    if ((paramArrayList == null) || (paramArrayList.size() == 0))
    {
      AdobeLogger.log(Level.ERROR, "updateNotifications", "notificationIDs can not be nil or empty");
      paramIAdobeUpdateNotificationCallback.onError();
      return null;
    }
    Object localObject = new JSONArray();
    paramArrayList = paramArrayList.iterator();
    while (paramArrayList.hasNext())
    {
      AdobePushNotification localAdobePushNotification = (AdobePushNotification)paramArrayList.next();
      JSONObject localJSONObject = new JSONObject();
      try
      {
        localJSONObject.put("notification-id", localAdobePushNotification.getNotificationID());
        localJSONObject.put("state", paramString2);
        localJSONObject.put("timestamp", localAdobePushNotification.getTimestamp() + 1L);
        ((JSONArray)localObject).put(localJSONObject);
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
      }
    }
    try
    {
      paramArrayList = new JSONObject();
      paramArrayList.put("notification", localObject);
      paramString2 = new JSONObject();
      paramString2.put("notifications", paramArrayList);
      localObject = paramString2.toString();
      if (localObject != null)
      {
        paramArrayList = null;
        try
        {
          paramString2 = new URL(sharedService.baseURL().toString() + "/ans/v1/notifications");
          paramArrayList = paramString2;
        }
        catch (MalformedURLException paramString2)
        {
          for (;;)
          {
            paramString2.printStackTrace();
          }
        }
        paramString2 = new AdobeNetworkHttpRequest();
        paramString2.setUrl(paramArrayList);
        String.format("Bearer %s", new Object[] { AdobeAuthIdentityManagementService.getSharedInstance().getAccessToken() });
        paramString2.setRequestProperty("x-user-token", _userToken);
        paramString2.setRequestProperty("x-adobe-app-id", paramString1);
        paramString1 = new IAdobeANSResponseCallback()
        {
          public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
          {
            paramIAdobeUpdateNotificationCallback.onError();
          }
          
          public void onSuccess(JSONObject paramAnonymousJSONObject)
          {
            paramIAdobeUpdateNotificationCallback.onSuccess(paramAnonymousJSONObject);
          }
        };
        return getResponseFor(paramString2, AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodPUT, (String)localObject, "application/json", paramString1);
      }
    }
    catch (JSONException paramString1)
    {
      paramString1.printStackTrace();
      return null;
    }
    paramIAdobeUpdateNotificationCallback.onError();
    return null;
  }
  
  private class LoginNotificationObserver
    implements Observer
  {
    private LoginNotificationObserver() {}
    
    public void update(Observable paramObservable, Object paramObject)
    {
      paramObservable = (AdobeNotification)paramObject;
      if (paramObservable.getId() == AdobeInternalNotificationID.AdobeAuthLoginNotification) {}
      while (paramObservable.getId() != AdobeInternalNotificationID.AdobeAuthLogoutNotification) {
        return;
      }
    }
  }
}
