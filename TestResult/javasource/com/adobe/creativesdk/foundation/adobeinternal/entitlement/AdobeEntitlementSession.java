package com.adobe.creativesdk.foundation.adobeinternal.entitlement;

import android.os.Handler;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudEndpoint;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceSession;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceType;
import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability;
import com.adobe.creativesdk.foundation.auth.AdobeUXAuthManager;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIMSEnvironment;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthKeychain;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCache;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCacheHandler;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCacheHitLocation;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCacheOptions;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCachePolicies;
import com.adobe.creativesdk.foundation.internal.cache.AdobeInvalidCacheSettingsException;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import com.adobe.creativesdk.foundation.internal.entitlement.AdobeEntitlementErrorUtils;
import com.adobe.creativesdk.foundation.internal.entitlement.AdobeEntitlementUtils;
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
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException.AdobeNetworkErrorCode;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeEntitlementSession
  extends AdobeCloudServiceSession
{
  private static AdobeEntitlementSession _sharedSession = null;
  protected boolean _cacheConfigured;
  AdobeNetworkReachability _networkReachability;
  private Timer _refreshTimer;
  
  public AdobeEntitlementSession(AdobeCloudEndpoint paramAdobeCloudEndpoint)
  {
    super(paramAdobeCloudEndpoint);
    setUpService();
    setDisconnectionNotifier(AdobeInternalNotificationID.AdobeEntitlementServiceDisconnectedNotification);
    setupOngoingConnectionTimer(15L, false);
    _cacheConfigured = false;
  }
  
  private static String getRelativeTo(String paramString1, String paramString2)
  {
    String str = paramString1;
    if (paramString1.startsWith("/")) {
      str = paramString1.substring(1);
    }
    paramString1 = paramString2;
    if (paramString2.endsWith("/")) {
      paramString1 = paramString2.substring(0, paramString2.lastIndexOf("/"));
    }
    return paramString1 + "/" + str;
  }
  
  private static AdobeCloudEndpoint getServiceEndpoint()
  {
    Object localObject = null;
    AdobeAuthIMSEnvironment localAdobeAuthIMSEnvironment = AdobeAuthIdentityManagementService.getSharedInstance().getEnvironment();
    switch (8.$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment[localAdobeAuthIMSEnvironment.ordinal()])
    {
    default: 
      AdobeLogger.log(Level.ERROR, AdobeEntitlementSession.class.getSimpleName(), "An undefined authentication endpoint has been specified.");
    }
    for (;;)
    {
      try
      {
        localObject = new AdobeCloudEndpoint(null, new URL((String)localObject), AdobeCloudServiceType.AdobeCloudServiceTypeEntitlement);
        return localObject;
      }
      catch (MalformedURLException localMalformedURLException) {}
      localObject = "https://entitlements.adobe.io";
      continue;
      localObject = "https://entitlements-stage.adobe.io";
    }
    return null;
  }
  
  public static AdobeEntitlementSession getSessionForCloudEndpoint(AdobeCloudEndpoint paramAdobeCloudEndpoint)
  {
    AdobeCloudEndpoint localAdobeCloudEndpoint = paramAdobeCloudEndpoint;
    if (paramAdobeCloudEndpoint == null) {
      localAdobeCloudEndpoint = getServiceEndpoint();
    }
    return new AdobeEntitlementSession(localAdobeCloudEndpoint);
  }
  
  public static AdobeEntitlementSession getSharedSession()
  {
    try
    {
      if (_sharedSession == null) {
        _sharedSession = getSessionForCloudEndpoint(getServiceEndpoint());
      }
      return _sharedSession;
    }
    finally {}
  }
  
  private void postUserProfileData(JSONObject paramJSONObject, String paramString)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("AdobeEntitlementSessionUserProfileData", paramJSONObject);
    localHashMap.put("AdobeEntitlementSessionEndPoint", getCloudEndpoint());
    localHashMap.put("AdobeEntitlementSessionAccessToken", paramString);
    paramJSONObject = new AdobeNotification(AdobeInternalNotificationID.AdobeEntilementUserProfileDataFetchNotification, localHashMap);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(paramJSONObject);
  }
  
  private void refreshUserProfile()
  {
    if (AdobeUXAuthManager.getSharedAuthManager().isAuthenticated())
    {
      if ((_networkReachability == null) && (AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext() != null))
      {
        _networkReachability = AdobeNetworkReachability.createAndGetNetworkReachability();
        _networkReachability.startNotification(AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext());
      }
      if ((_networkReachability != null) && (_networkReachability.isOnline())) {
        getUserProfileForToken(AdobeAuthIdentityManagementService.getSharedInstance().getAccessToken(), null, null, null);
      }
    }
  }
  
  private void setupRefreshTimer(long paramLong)
  {
    if (_refreshTimer == null)
    {
      _refreshTimer = new Timer();
      TimerTask local7 = new TimerTask()
      {
        public void run()
        {
          AdobeEntitlementSession.this.refreshUserProfile();
        }
      };
      _refreshTimer.scheduleAtFixedRate(local7, paramLong, paramLong);
    }
  }
  
  private void stopRefreshTimer()
  {
    if (_refreshTimer != null) {
      synchronized (_refreshTimer)
      {
        _refreshTimer.cancel();
        _refreshTimer = null;
        return;
      }
    }
  }
  
  protected AdobeCSDKException errorFromResponse(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse, String paramString1, String paramString2)
  {
    AdobeNetworkException localAdobeNetworkException = null;
    if (paramAdobeNetworkHttpResponse.getStatusCode() == 400) {
      localAdobeNetworkException = new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorBadRequest);
    }
    for (;;)
    {
      paramAdobeNetworkHttpResponse = localAdobeNetworkException;
      if (localAdobeNetworkException == null) {
        paramAdobeNetworkHttpResponse = AdobeEntitlementErrorUtils.errorWithCode(AdobeEntitlementErrorCode.AdobeEntitlementErrorUnexpectedResponse, null, paramString1, paramString2);
      }
      return paramAdobeNetworkHttpResponse;
      if (paramAdobeNetworkHttpResponse.getStatusCode() == 401) {
        localAdobeNetworkException = new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorAuthenticationFailed);
      }
    }
  }
  
  protected AdobeNetworkHttpTaskHandle getResponseFor(AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest, String paramString, byte[] paramArrayOfByte, IAdobeNetworkCompletionHandler paramIAdobeNetworkCompletionHandler, Handler paramHandler)
  {
    if (paramString == null)
    {
      paramAdobeNetworkHttpRequest.setBody(paramArrayOfByte);
      return getService().getResponseForDataRequest(paramAdobeNetworkHttpRequest, AdobeNetworkRequestPriority.NORMAL, paramIAdobeNetworkCompletionHandler, paramHandler);
    }
    if (paramAdobeNetworkHttpRequest.getRequestMethod() == AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET) {
      return getService().getResponseForDownloadRequest(paramAdobeNetworkHttpRequest, paramString, AdobeNetworkRequestPriority.NORMAL, paramIAdobeNetworkCompletionHandler, paramHandler);
    }
    return getService().getResponseForUploadRequest(paramAdobeNetworkHttpRequest, paramString, AdobeNetworkRequestPriority.NORMAL, paramIAdobeNetworkCompletionHandler, paramHandler);
  }
  
  public AdobeNetworkHttpTaskHandle getUserProfileForToken(final String paramString, final IAdobeGenericCompletionCallback<JSONObject> paramIAdobeGenericCompletionCallback, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback, final Handler paramHandler)
  {
    final JSONObject localJSONObject = getUserProfileFromCache();
    Object localObject1;
    if (AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext() != null)
    {
      localObject1 = AdobeNetworkReachability.createAndGetNetworkReachability();
      ((AdobeNetworkReachability)localObject1).startNotification(AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext());
      if (!((AdobeNetworkReachability)localObject1).isOnline())
      {
        if (localJSONObject != null) {
          postResponseToSuccessBlock(localJSONObject, paramString, paramIAdobeGenericCompletionCallback, paramHandler);
        }
        for (;;)
        {
          return null;
          postResposeToErrorBlock(new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorOffline), paramIAdobeGenericErrorCallback, paramHandler);
        }
      }
      ((AdobeNetworkReachability)localObject1).stopNotification();
    }
    if (getService() == null)
    {
      postResponseToSuccessBlock(new JSONObject(), paramString, paramIAdobeGenericCompletionCallback, paramHandler);
      return null;
    }
    if ((localJSONObject == null) && (AdobeAuthIdentityManagementService.getSharedInstance().getAccessToken() != null)) {}
    for (final boolean bool = true;; bool = false)
    {
      localObject1 = null;
      try
      {
        localObject2 = new URL(getRelativeTo("/api/v2/profile", getService().baseURL().toString()));
        localObject1 = localObject2;
      }
      catch (MalformedURLException localMalformedURLException)
      {
        for (;;)
        {
          Object localObject2;
          AdobeLogger.log(Level.DEBUG, AdobeEntitlementSession.class.getSimpleName(), null, localMalformedURLException);
        }
      }
      localObject2 = new AdobeNetworkHttpRequest();
      ((AdobeNetworkHttpRequest)localObject2).setUrl((URL)localObject1);
      ((AdobeNetworkHttpRequest)localObject2).setRequestMethod(AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET);
      getResponseFor((AdobeNetworkHttpRequest)localObject2, null, null, new IAdobeNetworkCompletionHandler()
      {
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          if (bool)
          {
            paramAnonymousAdobeNetworkException = AdobeEntitlementUtils.fallbackServicesData();
            postResponseToSuccessBlock(paramAnonymousAdobeNetworkException, paramString, paramIAdobeGenericCompletionCallback, paramHandler);
            return;
          }
          if (((paramAnonymousAdobeNetworkException.getStatusCode().intValue() == 404) || (paramAnonymousAdobeNetworkException.getStatusCode().intValue() == 600) || (paramAnonymousAdobeNetworkException.getStatusCode().intValue() == 400)) && (localJSONObject != null))
          {
            postResponseToSuccessBlock(localJSONObject, paramString, paramIAdobeGenericCompletionCallback, paramHandler);
            return;
          }
          postResposeToErrorBlock(paramAnonymousAdobeNetworkException, paramIAdobeGenericErrorCallback, paramHandler);
        }
        
        public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          int i = paramAnonymousAdobeNetworkHttpResponse.getStatusCode();
          Level localLevel = null;
          Object localObject2;
          Object localObject1;
          if (i == 200)
          {
            localObject2 = paramAnonymousAdobeNetworkHttpResponse.getDataString();
            localObject1 = null;
          }
          try
          {
            localObject2 = AdobeEntitlementUtils.JSONObjectWithData((String)localObject2);
            localObject1 = localObject2;
            AdobeAuthIdentityManagementService.getSharedInstance().getEnvironment();
            localObject1 = localObject2;
            localObject2 = localLevel;
          }
          catch (AdobeEntitlementException localAdobeEntitlementException)
          {
            for (;;)
            {
              StringBuilder localStringBuilder;
              continue;
              paramAnonymousAdobeNetworkHttpResponse = "";
            }
            if (!bool) {
              break label201;
            }
            paramAnonymousAdobeNetworkHttpResponse = AdobeEntitlementUtils.fallbackServicesData();
            postResponseToSuccessBlock(paramAnonymousAdobeNetworkHttpResponse, paramString, paramIAdobeGenericCompletionCallback, paramHandler);
            return;
            label201:
            paramAnonymousAdobeNetworkHttpResponse = errorFromResponse(paramAnonymousAdobeNetworkHttpResponse, null, null);
            postResposeToErrorBlock(paramAnonymousAdobeNetworkHttpResponse, paramIAdobeGenericErrorCallback, paramHandler);
          }
          if (localObject2 == null)
          {
            localObject2 = AdobeAuthKeychain.getSharedKeychain().getAdobeID();
            if (localObject2 != null)
            {
              localLevel = Level.DEBUG;
              localStringBuilder = new StringBuilder().append("The userprofile fetched from entitlements service being cached = ");
              if (localObject1 != null)
              {
                paramAnonymousAdobeNetworkHttpResponse = localObject1.toString();
                AdobeLogger.log(localLevel, "AdobeEntitlementSession", paramAnonymousAdobeNetworkHttpResponse);
                paramAnonymousAdobeNetworkHttpResponse = EnumSet.of(AdobeCommonCacheOptions.AdobeCommonCacheKeepInMemoryCache, AdobeCommonCacheOptions.AdobeCommonCacheKeepOnDiskCache);
                AdobeCommonCache.getSharedInstance().addObject(localObject1.toString(), (String)localObject2, "profile", paramAnonymousAdobeNetworkHttpResponse, "com.adobe.cc.entitlements");
              }
            }
            else
            {
              postResponseToSuccessBlock(localObject1, paramString, paramIAdobeGenericCompletionCallback, paramHandler);
              return;
            }
          }
        }
      }, paramHandler);
    }
  }
  
  public JSONObject getUserProfileFromCache()
  {
    String str = AdobeAuthKeychain.getSharedKeychain().getAdobeID();
    final Object local1Output = new Object()
    {
      boolean isDone = false;
      JSONObject result = null;
    };
    Object localObject;
    if (str != null)
    {
      localObject = AdobeCommonCache.getSharedInstance().getTimestampForGUID(str, "profile", "com.adobe.cc.entitlements");
      if (localObject != null)
      {
        if ((new Date().getTime() - ((Date)localObject).getTime()) / 1000L <= 2592000L) {
          break label83;
        }
        AdobeCommonCache.getSharedInstance().removeItemWithGUID(str, "profile", "com.adobe.cc.entitlements");
      }
    }
    for (;;)
    {
      return result;
      label83:
      localObject = new ReentrantLock();
      final Condition localCondition = ((ReentrantLock)localObject).newCondition();
      EnumSet localEnumSet = EnumSet.of(AdobeCommonCacheOptions.AdobeCommonCacheKeepInMemoryCache);
      AdobeCommonCache.getSharedInstance().getObjectFromGUID(str, "profile", localEnumSet, "com.adobe.cc.entitlements", new AdobeCommonCacheHandler()
      {
        public void onHit(Object paramAnonymousObject, AdobeCommonCacheHitLocation paramAnonymousAdobeCommonCacheHitLocation)
        {
          paramAnonymousAdobeCommonCacheHitLocation = null;
          try
          {
            paramAnonymousObject = new JSONObject((String)paramAnonymousObject);
            val$lock.lock();
            local1OutputisDone = true;
            local1Outputresult = paramAnonymousObject;
            localCondition.signal();
            val$lock.unlock();
            return;
          }
          catch (JSONException paramAnonymousObject)
          {
            for (;;)
            {
              AdobeLogger.log(Level.ERROR, AdobeEntitlementSession.class.getSimpleName(), null, paramAnonymousObject);
              paramAnonymousObject = paramAnonymousAdobeCommonCacheHitLocation;
            }
          }
        }
        
        public void onMiss()
        {
          val$lock.lock();
          local1OutputisDone = true;
          localCondition.signal();
          val$lock.unlock();
        }
      }, null);
      ((ReentrantLock)localObject).lock();
      while (!isDone) {
        try
        {
          localCondition.await();
        }
        catch (InterruptedException localInterruptedException)
        {
          AdobeLogger.log(Level.DEBUG, "AdobeDCXCompositeXfer.internalDownloadComponents", localInterruptedException.getMessage());
        }
      }
      ((ReentrantLock)localObject).unlock();
    }
  }
  
  protected boolean isCacheConfigured()
  {
    return _cacheConfigured;
  }
  
  void postResponseToSuccessBlock(final JSONObject paramJSONObject, final String paramString, final IAdobeGenericCompletionCallback<JSONObject> paramIAdobeGenericCompletionCallback, Handler paramHandler)
  {
    if (paramIAdobeGenericCompletionCallback != null)
    {
      if (paramHandler != null) {
        paramHandler.post(new Runnable()
        {
          public void run()
          {
            paramIAdobeGenericCompletionCallback.onCompletion(paramJSONObject);
            AdobeEntitlementSession.this.postUserProfileData(paramJSONObject, paramString);
          }
        });
      }
    }
    else {
      return;
    }
    paramIAdobeGenericCompletionCallback.onCompletion(paramJSONObject);
    postUserProfileData(paramJSONObject, paramString);
  }
  
  void postResposeToErrorBlock(final AdobeCSDKException paramAdobeCSDKException, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback, Handler paramHandler)
  {
    if (paramIAdobeGenericErrorCallback != null)
    {
      if (paramHandler != null) {
        paramHandler.post(new Runnable()
        {
          public void run()
          {
            paramIAdobeGenericErrorCallback.onError(paramAdobeCSDKException);
          }
        });
      }
    }
    else {
      return;
    }
    paramIAdobeGenericErrorCallback.onError(paramAdobeCSDKException);
  }
  
  public void refreshEndpoint()
  {
    configureEndpoint(getServiceEndpoint());
  }
  
  public void setUpService()
  {
    String str = AdobeAuthKeychain.getSharedKeychain().getAdobeID();
    EnumSet localEnumSet;
    if ((!isCacheConfigured()) && (str != null) && (str.length() > 0))
    {
      localEnumSet = EnumSet.of(AdobeCommonCachePolicies.AdobeCommonCacheEvictionLRU);
      str = null;
    }
    try
    {
      AdobeCommonCache.getSharedInstance().configureCache("com.adobe.cc.entitlements", 100, 1.34217728E8D, localEnumSet);
      if (str == null)
      {
        _cacheConfigured = true;
        setupRefreshTimer(43200000L);
        return;
      }
    }
    catch (AdobeInvalidCacheSettingsException localAdobeInvalidCacheSettingsException)
    {
      for (;;)
      {
        continue;
        AdobeLogger.log(Level.ERROR, AdobeEntitlementSession.class.getSimpleName(), null, localAdobeInvalidCacheSettingsException);
      }
    }
  }
  
  public void tearDownService()
  {
    if (AdobeCommonCache.getSharedInstance().doesCacheExist("com.adobe.cc.entitlements"))
    {
      AdobeCommonCache.getSharedInstance().printStatistics("com.adobe.cc.entitlements");
      if (!AdobeCommonCache.getSharedInstance().removeCache("com.adobe.cc.entitlements")) {
        AdobeLogger.log(Level.ERROR, AdobeEntitlementSession.class.getSimpleName(), "Removal of cache failed");
      }
    }
    _cacheConfigured = false;
    stopRefreshTimer();
  }
}
