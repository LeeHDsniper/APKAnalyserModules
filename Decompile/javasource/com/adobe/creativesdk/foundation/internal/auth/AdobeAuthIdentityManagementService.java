package com.adobe.creativesdk.foundation.internal.auth;

import android.os.Handler;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.entitlement.AdobeEntitlementSession;
import com.adobe.creativesdk.foundation.auth.AdobeAuthErrorCode;
import com.adobe.creativesdk.foundation.auth.AdobeAuthException;
import com.adobe.creativesdk.foundation.internal.analytics.AdobeAnalyticsSDKReporter;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequest;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequestMethod;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpResponse;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpService;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkRequestPriority;
import com.adobe.creativesdk.foundation.internal.net.IAdobeNetworkCompletionHandler;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.internal.utils.AdobeJSONObject;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException.AdobeNetworkErrorCode;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeAuthIdentityManagementService
{
  private static final String[] IMS_CREATIVE_SDK_SCOPES = { "creative_sdk", "AdobeID" };
  private static volatile AdobeAuthIdentityManagementService sharedInstance = null;
  private String accessToken;
  private Date accessTokenExpirationTime;
  private String adobeID;
  private final AdobeAuthKeychain authKeychain = new AdobeAuthKeychain(this);
  private AdobeCommonCipher cipher;
  private byte[] cipherKey;
  private String clientID;
  private String clientScope;
  private String clientSecret;
  private String clientState;
  private String continuationToken;
  private String deviceID;
  private String deviceName;
  private String deviceToken;
  private Date deviceTokenExpirationTime;
  private String displayName;
  private String emailAddress;
  private String emailVerified;
  private Set<String> entitlements;
  private AdobeAuthIMSEnvironment environment;
  private String firstName;
  private AdobeAuthIMSGrantType grantType;
  private String imsHost;
  private String isEnterPrise;
  private String lastName;
  private AdobeNetworkHttpService networkService;
  private char[] password;
  private String refreshToken;
  private Date refreshTokenExpirationTime;
  private String sharedDeviceToken;
  private String username;
  
  private AdobeAuthIdentityManagementService()
  {
    AdobeAuthKeychain.setSharedKeychain(authKeychain);
    setEnvironment(AdobeAuthIMSEnvironment.AdobeAuthIMSEnvironmentProductionUS);
    setAdditionalClientScopes(null);
    setCipherKey(AdobeCSDKAuthAESKeyMgr.getInstance().getFoundationAuthAESKey());
  }
  
  private AdobeAuthException createAuthError(AdobeNetworkException paramAdobeNetworkException)
  {
    if (paramAdobeNetworkException.getErrorCode() == AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorOffline) {
      return new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_OFFLINE);
    }
    return new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_NETWORK_ERROR);
  }
  
  public static AdobeAuthIdentityManagementService getSharedInstance()
  {
    if (sharedInstance == null) {}
    try
    {
      if (sharedInstance == null) {
        sharedInstance = new AdobeAuthIdentityManagementService();
      }
      return sharedInstance;
    }
    finally {}
  }
  
  private void makeHTTPOperationForURL(URL paramURL, AdobeNetworkHttpRequestMethod paramAdobeNetworkHttpRequestMethod, Map<String, String> paramMap, String paramString, IAdobeNetworkCompletionHandler paramIAdobeNetworkCompletionHandler)
  {
    AdobeNetworkHttpRequest localAdobeNetworkHttpRequest = new AdobeNetworkHttpRequest(paramURL, paramAdobeNetworkHttpRequestMethod, paramMap);
    if ((paramAdobeNetworkHttpRequestMethod == AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET) && (!paramMap.isEmpty()))
    {
      adobeID = authKeychain.getAdobeID();
      localAdobeNetworkHttpRequest.setQueryParams(paramMap);
    }
    if (paramAdobeNetworkHttpRequestMethod == AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodPOST) {
      localAdobeNetworkHttpRequest.setBody(paramMap);
    }
    if (paramString != null) {
      localAdobeNetworkHttpRequest.setRequestProperty("Content-Type", paramString);
    }
    try
    {
      paramURL = new Handler();
      networkService.getResponseForDataRequest(localAdobeNetworkHttpRequest, AdobeNetworkRequestPriority.NORMAL, paramIAdobeNetworkCompletionHandler, paramURL);
      return;
    }
    catch (Exception paramURL)
    {
      for (;;)
      {
        paramURL = null;
      }
    }
  }
  
  private void onJSONException(JSONException paramJSONException, IAdobeAuthIMSSignInClient paramIAdobeAuthIMSSignInClient)
  {
    AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Error parsing JSON", paramJSONException);
    paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_UNKNOWN_ERROR));
  }
  
  private void profileFromServiceWithAccessToken(String paramString, final IAdobeGenericCompletionCallback<JSONObject> paramIAdobeGenericCompletionCallback, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    AdobeEntitlementSession localAdobeEntitlementSession = AdobeEntitlementSession.getSharedSession();
    localAdobeEntitlementSession.refreshEndpoint();
    try
    {
      Handler localHandler = new Handler();
      localAdobeEntitlementSession.getUserProfileForToken(paramString, new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
      {
        public void onCompletion(JSONObject paramAnonymousJSONObject)
        {
          AdobeLogger.log(Level.DEBUG, AdobeAuthIdentityManagementService.class.getSimpleName(), "User Profile data:" + paramAnonymousJSONObject);
          if (paramAnonymousJSONObject.optString("userId") != null) {
            setAdobeID(paramAnonymousJSONObject.optString("userId"));
          }
          AdobeAuthIdentityManagementService localAdobeAuthIdentityManagementService = AdobeAuthIdentityManagementService.this;
          if (paramAnonymousJSONObject.optBoolean("isEnterprise")) {}
          for (String str = "true";; str = "false")
          {
            localAdobeAuthIdentityManagementService.setIsEnterPrise(str);
            if (paramAnonymousJSONObject.optString("displayName") != null) {
              setDisplayName(paramAnonymousJSONObject.optString("displayName"));
            }
            if (paramAnonymousJSONObject.optString("first_name") != null) {
              setFirstName(paramAnonymousJSONObject.optString("first_name"));
            }
            if (paramAnonymousJSONObject.optString("last_name") != null) {
              setLastName(paramAnonymousJSONObject.optString("last_name"));
            }
            if (paramAnonymousJSONObject.optString("email") != null) {
              setEmailAddress(paramAnonymousJSONObject.optString("email"));
            }
            if (paramAnonymousJSONObject.optString("emailVerified") != null) {
              setEmailVerified(paramAnonymousJSONObject.optString("emailVerified"));
            }
            if (paramIAdobeGenericCompletionCallback != null) {
              paramIAdobeGenericCompletionCallback.onCompletion(paramAnonymousJSONObject);
            }
            return;
          }
        }
      }, new IAdobeGenericErrorCallback()
      {
        public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
        {
          if (paramIAdobeGenericErrorCallback != null)
          {
            paramIAdobeGenericErrorCallback.onError(paramAnonymousAdobeCSDKException);
            return;
          }
          AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Could not get profile date from service", paramAnonymousAdobeCSDKException);
        }
      }, localHandler);
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject = null;
      }
    }
  }
  
  private void removeAnySharedSSOAcount()
  {
    if (getDeviceID() == null) {
      return;
    }
    AdobeCSDKAdobeIdAuthenticatorHelper.removeCurrentSharedAdobeIDFromAccountManager(AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext());
  }
  
  private void resetKeys()
  {
    authKeychain.resetTokens();
    adobeID = null;
    accessToken = null;
    deviceToken = null;
    sharedDeviceToken = null;
    refreshToken = null;
    continuationToken = null;
    accessTokenExpirationTime = null;
    deviceTokenExpirationTime = null;
    refreshTokenExpirationTime = null;
    displayName = null;
    firstName = null;
    lastName = null;
    entitlements = null;
    emailAddress = null;
    emailVerified = null;
    username = null;
    password = null;
    isEnterPrise = null;
  }
  
  private void setAccessTokenExpirationTime(Date paramDate)
  {
    accessTokenExpirationTime = paramDate;
    addToKeychain("AccessTokenExpiration", paramDate);
  }
  
  private void setDeviceTokenExpiration(String paramString)
  {
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.add(13, 15768000);
    setDeviceTokenExpirationTime(localCalendar.getTime());
    getTokenExpirationTime(paramString, new IAdobeAuthTokenCallback()
    {
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Network error while getting token expiration time.");
      }
      
      public void onInvalidClientId()
      {
        AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Invalid client id.");
      }
      
      public void onInvalidClientSecret()
      {
        AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Invalid client secret.");
      }
      
      public void onInvalidDeviceId()
      {
        AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Invalid device id.");
      }
      
      public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        try
        {
          paramAnonymousAdobeNetworkHttpResponse = new AdobeJSONObject(paramAnonymousAdobeNetworkHttpResponse.getDataString()).getString("expires_at");
          if (paramAnonymousAdobeNetworkHttpResponse == null)
          {
            AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Expiry time is null");
            return;
          }
          long l = Long.parseLong(paramAnonymousAdobeNetworkHttpResponse);
          paramAnonymousAdobeNetworkHttpResponse = Calendar.getInstance();
          int i = (int)(l / 1000L);
          int j = (int)(l % 1000L);
          paramAnonymousAdobeNetworkHttpResponse.add(13, i);
          paramAnonymousAdobeNetworkHttpResponse.add(14, j);
          AdobeAuthIdentityManagementService.this.setDeviceTokenExpirationTime(paramAnonymousAdobeNetworkHttpResponse.getTime());
          return;
        }
        catch (Exception paramAnonymousAdobeNetworkHttpResponse)
        {
          AdobeLogger.log(Level.DEBUG, AdobeAuthIdentityManagementService.class.getSimpleName(), "Error parsing expiration date", paramAnonymousAdobeNetworkHttpResponse);
        }
      }
    });
  }
  
  private void setDeviceTokenExpirationTime(Date paramDate)
  {
    deviceTokenExpirationTime = paramDate;
    addToKeychain("DeviceTokenExpiration", paramDate);
  }
  
  private void setRefreshTokenExpiration(String paramString)
  {
    final Calendar localCalendar = Calendar.getInstance();
    localCalendar.add(13, 1209600);
    setRefreshTokenExpirationTime(localCalendar.getTime());
    getTokenExpirationTime(paramString, new IAdobeAuthTokenCallback()
    {
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Error while getting token expiration time", paramAnonymousAdobeNetworkException);
      }
      
      public void onInvalidClientId()
      {
        AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Invalid client id.");
      }
      
      public void onInvalidClientSecret()
      {
        AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Invalid client secret.");
      }
      
      public void onInvalidDeviceId()
      {
        AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Invalid device id.");
      }
      
      public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        try
        {
          paramAnonymousAdobeNetworkHttpResponse = new AdobeJSONObject(paramAnonymousAdobeNetworkHttpResponse.getDataString()).getString("expires_at");
          if (paramAnonymousAdobeNetworkHttpResponse == null)
          {
            AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Expiry time is null");
            return;
          }
          long l = Long.parseLong(paramAnonymousAdobeNetworkHttpResponse);
          paramAnonymousAdobeNetworkHttpResponse = Calendar.getInstance();
          int i = (int)(l / 1000L);
          int j = (int)(l % 1000L);
          paramAnonymousAdobeNetworkHttpResponse.add(13, i);
          paramAnonymousAdobeNetworkHttpResponse.add(14, j);
          AdobeAuthIdentityManagementService.this.setRefreshTokenExpirationTime(localCalendar.getTime());
          return;
        }
        catch (Exception paramAnonymousAdobeNetworkHttpResponse)
        {
          AdobeLogger.log(Level.DEBUG, AdobeAuthIdentityManagementService.class.getSimpleName(), "Error parsing expiry date", paramAnonymousAdobeNetworkHttpResponse);
        }
      }
    });
  }
  
  private void setRefreshTokenExpirationTime(Date paramDate)
  {
    refreshTokenExpirationTime = paramDate;
    addToKeychain("RefreshTokenExpiration", paramDate);
  }
  
  void addToKeychain(String paramString, Object paramObject)
  {
    if ((paramString != null) && (paramObject != null)) {
      authKeychain.updateOrAddKey(paramString, paramObject);
    }
    while (paramString == null) {
      return;
    }
    authKeychain.deleteKey(paramString);
  }
  
  void fetchEntitlements()
  {
    fetchEntitlements(null);
  }
  
  public void fetchEntitlements(IAdobeNetworkCompletionHandler paramIAdobeNetworkCompletionHandler) {}
  
  public String getAccessToken()
  {
    if (accessToken == null)
    {
      Date localDate = authKeychain.getAccessTokenExpiration();
      if ((localDate != null) && (localDate.getTime() - new Date().getTime() > 0L)) {
        accessToken = authKeychain.getAccessToken();
      }
    }
    return accessToken;
  }
  
  protected void getAccessToken(final IAdobeAuthTokenCallback paramIAdobeAuthTokenCallback)
  {
    if (getDeviceID() == null)
    {
      paramIAdobeAuthTokenCallback.onInvalidDeviceId();
      return;
    }
    if (getClientID() == null)
    {
      paramIAdobeAuthTokenCallback.onInvalidClientId();
      return;
    }
    if (getClientSecret() == null)
    {
      paramIAdobeAuthTokenCallback.onInvalidClientSecret();
      return;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("grant_type", "device");
    localHashMap.put("device_id", getDeviceID());
    localHashMap.put("client_id", getClientID());
    localHashMap.put("client_secret", getClientSecret());
    localHashMap.put("redirect_uri", "signin://complete");
    localHashMap.put("scope", clientScope);
    if (username == null) {}
    for (String str = "";; str = username)
    {
      localHashMap.put("username", str);
      localHashMap.put("password", new String(password));
      makeHTTPOperationForURL(getDeviceURL(), AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodPOST, localHashMap, "application/x-www-form-urlencoded", new IAdobeNetworkCompletionHandler()
      {
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          paramIAdobeAuthTokenCallback.onError(paramAnonymousAdobeNetworkException);
        }
        
        public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          if (paramAnonymousAdobeNetworkHttpResponse.getStatusCode() == 200)
          {
            paramIAdobeAuthTokenCallback.onSuccess(paramAnonymousAdobeNetworkHttpResponse);
            return;
          }
          paramIAdobeAuthTokenCallback.onError(new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorBadRequest));
        }
      });
      return;
    }
  }
  
  public Date getAccessTokenExpirationTime()
  {
    if (accessTokenExpirationTime == null) {
      accessTokenExpirationTime = authKeychain.getAccessTokenExpiration();
    }
    Date localDate = null;
    if (accessTokenExpirationTime != null) {
      localDate = new Date(accessTokenExpirationTime.getTime());
    }
    return localDate;
  }
  
  protected void getAccessTokenWithAuthCode(String paramString, final IAdobeAuthTokenCallback paramIAdobeAuthTokenCallback)
  {
    if (getClientID() == null)
    {
      paramIAdobeAuthTokenCallback.onInvalidClientId();
      return;
    }
    if (getClientSecret() == null)
    {
      paramIAdobeAuthTokenCallback.onInvalidClientSecret();
      return;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("grant_type", "authorization_code");
    localHashMap.put("code", paramString);
    if (grantType == AdobeAuthIMSGrantType.AdobeAuthIMSGrantTypeDevice) {
      localHashMap.put("device_id", getDeviceID());
    }
    localHashMap.put("client_id", getClientID());
    localHashMap.put("client_secret", getClientSecret());
    localHashMap.put("redirect_uri", "signin://complete");
    makeHTTPOperationForURL(getTokenURL(), AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodPOST, localHashMap, "application/x-www-form-urlencoded", new IAdobeNetworkCompletionHandler()
    {
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramIAdobeAuthTokenCallback.onError(paramAnonymousAdobeNetworkException);
      }
      
      public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        if (paramAnonymousAdobeNetworkHttpResponse.getStatusCode() == 200)
        {
          paramIAdobeAuthTokenCallback.onSuccess(paramAnonymousAdobeNetworkHttpResponse);
          return;
        }
        paramIAdobeAuthTokenCallback.onError(new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorBadRequest));
      }
    });
  }
  
  public void getAccessTokenWithDeviceToken(String paramString, final IAdobeAuthTokenCallback paramIAdobeAuthTokenCallback)
  {
    if (getDeviceID() == null)
    {
      paramIAdobeAuthTokenCallback.onInvalidDeviceId();
      return;
    }
    if (getClientID() == null)
    {
      paramIAdobeAuthTokenCallback.onInvalidClientId();
      return;
    }
    if (getClientSecret() == null)
    {
      paramIAdobeAuthTokenCallback.onInvalidClientSecret();
      return;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("grant_type", "device");
    localHashMap.put("device_token", paramString);
    localHashMap.put("device_id", getDeviceID());
    localHashMap.put("client_id", getClientID());
    localHashMap.put("client_secret", getClientSecret());
    localHashMap.put("redirect_uri", "signin://complete");
    localHashMap.put("scope", clientScope);
    makeHTTPOperationForURL(getTokenURL(), AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodPOST, localHashMap, "application/x-www-form-urlencoded", new IAdobeNetworkCompletionHandler()
    {
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramIAdobeAuthTokenCallback.onError(paramAnonymousAdobeNetworkException);
      }
      
      public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        paramIAdobeAuthTokenCallback.onSuccess(paramAnonymousAdobeNetworkHttpResponse);
      }
    });
  }
  
  public String getAdobeID()
  {
    if (adobeID == null) {
      adobeID = authKeychain.getAdobeID();
    }
    return adobeID;
  }
  
  URL getAuthURL()
  {
    try
    {
      URL localURL = new URL(imsHost + "/authorize/v1");
      return localURL;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Invalid auth URL", localMalformedURLException);
    }
    return null;
  }
  
  public AdobeCommonCipher getCipher()
  {
    return cipher;
  }
  
  public String getClientID()
  {
    if (clientID == null) {
      clientID = authKeychain.findKey("ClientId");
    }
    return clientID;
  }
  
  public String getClientSecret()
  {
    if (clientSecret == null) {
      clientSecret = authKeychain.findKey("ClientSecret");
    }
    return clientSecret;
  }
  
  public String getClientState()
  {
    if (clientState == null) {
      clientState = authKeychain.findKey("ClientState");
    }
    return clientState;
  }
  
  String getCurrentLocale()
  {
    return Locale.getDefault().toString();
  }
  
  public String getDeviceID()
  {
    if (deviceID == null) {
      deviceID = authKeychain.findKey("DeviceId");
    }
    return deviceID;
  }
  
  public String getDeviceName()
  {
    if (deviceName == null) {
      deviceName = authKeychain.findKey("DeviceName");
    }
    return deviceName;
  }
  
  public String getDeviceToken()
  {
    if (deviceToken == null)
    {
      Date localDate = authKeychain.getDeviceTokenExpiration();
      if ((localDate != null) && (localDate.getTime() - new Date().getTime() > 0L)) {
        deviceToken = authKeychain.getDeviceToken();
      }
    }
    return deviceToken;
  }
  
  public Date getDeviceTokenExpirationTime()
  {
    if (deviceTokenExpirationTime == null) {
      deviceTokenExpirationTime = authKeychain.getDeviceTokenExpiration();
    }
    Date localDate = null;
    if (deviceTokenExpirationTime != null) {
      localDate = new Date(deviceTokenExpirationTime.getTime());
    }
    return localDate;
  }
  
  URL getDeviceURL()
  {
    try
    {
      URL localURL = new URL(imsHost + "/login/v1/device");
      return localURL;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Invalid device url", localMalformedURLException);
    }
    return null;
  }
  
  public String getDisplayName()
  {
    if (displayName == null) {
      displayName = authKeychain.getDisplayName();
    }
    return displayName;
  }
  
  public String getEmailAddress()
  {
    if (emailAddress == null) {
      emailAddress = authKeychain.getEmailAddress();
    }
    return emailAddress;
  }
  
  public AdobeAuthIMSEnvironment getEnvironment()
  {
    return environment;
  }
  
  public String getFirstName()
  {
    if (firstName == null) {
      firstName = authKeychain.getFirstName();
    }
    return firstName;
  }
  
  public String getIsEnterPrise()
  {
    if (isEnterPrise == null) {
      isEnterPrise = authKeychain.getEnterpriseInfo();
    }
    return isEnterPrise;
  }
  
  String getLastName()
  {
    if (lastName == null) {
      lastName = authKeychain.getLastName();
    }
    return lastName;
  }
  
  public String getRefreshToken()
  {
    if (refreshToken == null)
    {
      Date localDate = authKeychain.getRefreshTokenExpiration();
      if ((localDate != null) && (localDate.getTime() - new Date().getTime() > 0L)) {
        refreshToken = authKeychain.getRefreshToken();
      }
    }
    return refreshToken;
  }
  
  public Date getRefreshTokenExpirationTime()
  {
    if (refreshTokenExpirationTime == null) {
      refreshTokenExpirationTime = authKeychain.getRefreshTokenExpiration();
    }
    Date localDate = null;
    if (refreshTokenExpirationTime != null) {
      localDate = new Date(refreshTokenExpirationTime.getTime());
    }
    return localDate;
  }
  
  public URL getSignInURL()
  {
    String str2 = getAuthURL().toString();
    Object localObject1;
    if (grantType == AdobeAuthIMSGrantType.AdobeAuthIMSGrantTypeAuthorization) {
      localObject1 = str2 + "?redirect_uri=signin%%3A%%2F%%2Fcomplete&scope=" + clientScope + "&idp_flow=login&client_id=" + getClientID() + "&dc=false&locale=" + getCurrentLocale();
    }
    for (;;)
    {
      Object localObject2 = localObject1;
      if (getClientState() != null)
      {
        localObject2 = localObject1;
        if (!getClientState().equals("")) {
          localObject2 = null;
        }
      }
      try
      {
        str2 = URLEncoder.encode(getClientState(), "UTF-8");
        localObject2 = str2;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException2)
      {
        for (;;)
        {
          AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Error during encode process", localUnsupportedEncodingException2);
        }
      }
      localObject2 = (String)localObject1 + "&state=" + (String)localObject2;
      for (;;)
      {
        try
        {
          localObject1 = new URL((String)localObject2);
          return localObject1;
        }
        catch (MalformedURLException localMalformedURLException)
        {
          String str1;
          AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Sign in url is malformed", localMalformedURLException);
        }
        try
        {
          localObject1 = URLEncoder.encode(getDeviceID(), "UTF-8");
          localObject2 = URLEncoder.encode(getDeviceName(), "UTF-8");
          localObject1 = str2 + "?redirect_uri=signin%%3A%%2F%%2Fcomplete&scope=" + clientScope + "&idp_flow=login&response_type=device&device_id=" + (String)localObject1 + "&device_name=" + (String)localObject2 + "&client_id=" + getClientID() + "&dc=false&locale=" + getCurrentLocale();
        }
        catch (UnsupportedEncodingException localUnsupportedEncodingException1)
        {
          AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Error during encode", localUnsupportedEncodingException1);
          str1 = "";
          localObject2 = "";
        }
      }
    }
    return null;
  }
  
  URL getSignOutURL()
  {
    Object localObject = imsHost + "/logout/v1";
    localObject = (String)localObject + "?" + "access_token" + "=" + accessToken + "&" + "client_id" + "=" + getClientID() + "&" + "client_secret" + "=" + getClientSecret();
    try
    {
      localObject = new URL((String)localObject);
      return localObject;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Malformed exception", localMalformedURLException);
    }
    return null;
  }
  
  public URL getSignUpURL()
  {
    String str = getAuthURL().toString();
    Object localObject1;
    if (grantType == AdobeAuthIMSGrantType.AdobeAuthIMSGrantTypeAuthorization) {
      localObject1 = str + "?redirect_uri=signin%%3A%%2F%%2Fcomplete&scope=" + clientScope + "&idp_flow=create_account&client_id=" + getClientID() + "&locale=" + getCurrentLocale();
    }
    for (;;)
    {
      Object localObject2 = localObject1;
      if (getClientState() != null)
      {
        localObject2 = localObject1;
        if (!getClientState().equals("")) {
          localObject2 = null;
        }
      }
      try
      {
        str = URLEncoder.encode(getClientState(), "UTF-8");
        localObject2 = str;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException1)
      {
        for (;;)
        {
          AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Error during encode process", localUnsupportedEncodingException1);
        }
      }
      localObject2 = (String)localObject1 + "&state=" + (String)localObject2;
      for (;;)
      {
        try
        {
          localObject1 = new URL((String)localObject2);
          return localObject1;
        }
        catch (MalformedURLException localMalformedURLException)
        {
          AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Malformed url", localMalformedURLException);
        }
        try
        {
          localObject1 = URLEncoder.encode(getDeviceID(), "UTF-8");
          localObject2 = URLEncoder.encode(getDeviceName(), "UTF-8");
          localObject1 = str + "?redirect_uri=signin%%3A%%2F%%2Fcomplete&scope=" + clientScope + "&idp_flow=create_account&response_type=device&device_id=" + (String)localObject1 + "&device_name=" + (String)localObject2 + "&client_id=" + getClientID() + "&locale=" + getCurrentLocale();
        }
        catch (UnsupportedEncodingException localUnsupportedEncodingException2)
        {
          localObject1 = null;
          localObject2 = null;
          AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Error during encode process", localUnsupportedEncodingException2);
        }
      }
    }
    return null;
  }
  
  public void getTokenExpirationTime(String paramString, final IAdobeNetworkCompletionHandler paramIAdobeNetworkCompletionHandler)
  {
    if ((getClientID() == null) || (getClientSecret() == null))
    {
      paramIAdobeNetworkCompletionHandler.onError(new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorBadRequest));
      return;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("token", paramString);
    localHashMap.put("client_id", getClientID());
    makeHTTPOperationForURL(getValidateTokenURL(), AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET, localHashMap, "application/x-www-form-urlencoded", new IAdobeNetworkCompletionHandler()
    {
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramIAdobeNetworkCompletionHandler.onError(paramAnonymousAdobeNetworkException);
      }
      
      public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        if (paramAnonymousAdobeNetworkHttpResponse.getStatusCode() == 200)
        {
          paramIAdobeNetworkCompletionHandler.onSuccess(paramAnonymousAdobeNetworkHttpResponse);
          return;
        }
        paramIAdobeNetworkCompletionHandler.onError(new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorBadRequest));
      }
    });
  }
  
  URL getTokenURL()
  {
    try
    {
      URL localURL = new URL(imsHost + "/token/v1");
      return localURL;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Invalid token url", localMalformedURLException);
    }
    return null;
  }
  
  URL getValidateTokenURL()
  {
    try
    {
      URL localURL = new URL(imsHost + "/validate_token/v1");
      return localURL;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Invalid validate token url");
    }
    return null;
  }
  
  protected void parseFromProfile(JSONObject paramJSONObject) {}
  
  protected void parseResponse(AdobeJSONObject paramAdobeJSONObject, boolean paramBoolean)
  {
    setAdobeID(paramAdobeJSONObject.getString("userId"));
    setAccessToken(paramAdobeJSONObject.getString("access_token"));
    if (paramAdobeJSONObject.has("device_token"))
    {
      setDeviceToken(paramAdobeJSONObject.getString("device_token"));
      setDeviceTokenExpiration(paramAdobeJSONObject.getString("device_token"));
    }
    if ((paramAdobeJSONObject.has("refresh_token")) && (!paramBoolean))
    {
      setRefreshToken(paramAdobeJSONObject.getString("refresh_token"));
      setRefreshTokenExpiration(paramAdobeJSONObject.getString("refresh_token"));
    }
    setContinuationToken(paramAdobeJSONObject.getString("continuation_token"));
    paramAdobeJSONObject = paramAdobeJSONObject.getString("expires_in");
    if (paramAdobeJSONObject != null)
    {
      long l = Long.parseLong(paramAdobeJSONObject) / 1000L;
      paramAdobeJSONObject = Calendar.getInstance();
      paramAdobeJSONObject.add(13, Long.valueOf(l).intValue());
      setAccessTokenExpirationTime(paramAdobeJSONObject.getTime());
    }
    for (;;)
    {
      fetchEntitlements();
      return;
      setAccessTokenExpirationTime(null);
    }
  }
  
  void refreshAccessToken(String paramString, final IAdobeAuthTokenCallback paramIAdobeAuthTokenCallback)
  {
    if (getClientID() == null)
    {
      paramIAdobeAuthTokenCallback.onInvalidClientId();
      return;
    }
    if (getClientSecret() == null)
    {
      paramIAdobeAuthTokenCallback.onInvalidClientSecret();
      return;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("grant_type", "refresh_token");
    localHashMap.put("refresh_token", paramString);
    localHashMap.put("client_id", getClientID());
    localHashMap.put("client_secret", getClientSecret());
    makeHTTPOperationForURL(getTokenURL(), AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodPOST, localHashMap, "application/x-www-form-urlencoded", new IAdobeNetworkCompletionHandler()
    {
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Network error during refresh access token ", paramAnonymousAdobeNetworkException);
        paramIAdobeAuthTokenCallback.onError(paramAnonymousAdobeNetworkException);
      }
      
      public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        if (paramAnonymousAdobeNetworkHttpResponse.getStatusCode() == 200)
        {
          paramIAdobeAuthTokenCallback.onSuccess(paramAnonymousAdobeNetworkHttpResponse);
          return;
        }
        paramIAdobeAuthTokenCallback.onError(new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorBadRequest));
      }
    });
  }
  
  void setAccessToken(String paramString)
  {
    accessToken = paramString;
    addToKeychain("AccessToken", paramString);
  }
  
  public void setAdditionalClientScopes(String[] paramArrayOfString)
  {
    Object localObject = new LinkedHashSet(Arrays.asList(IMS_CREATIVE_SDK_SCOPES));
    if (paramArrayOfString != null)
    {
      int j = paramArrayOfString.length;
      int i = 0;
      while (i < j)
      {
        String str = paramArrayOfString[i].replaceAll("\\s", "");
        if (str.length() > 0) {
          ((LinkedHashSet)localObject).add(str);
        }
        i += 1;
      }
    }
    paramArrayOfString = new StringBuilder();
    localObject = ((LinkedHashSet)localObject).iterator();
    while (((Iterator)localObject).hasNext()) {
      paramArrayOfString.append((String)((Iterator)localObject).next()).append(",");
    }
    clientScope = paramArrayOfString.substring(0, paramArrayOfString.length() - 1);
  }
  
  void setAdobeID(String paramString)
  {
    adobeID = paramString;
    authKeychain.updateOrAddKey("AdobeID", paramString);
  }
  
  public void setAuthenticationParameters(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    setClientID(paramString1);
    setClientSecret(paramString2);
    setClientState(paramString3);
    setDeviceID(paramString4);
    setDeviceName(paramString5);
  }
  
  public void setCipherKey(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {
      return;
    }
    cipherKey = new byte[paramArrayOfByte.length];
    System.arraycopy(paramArrayOfByte, 0, cipherKey, 0, paramArrayOfByte.length);
    try
    {
      cipher = AdobeCommonCipher.createInstance(cipherKey);
      return;
    }
    catch (Exception paramArrayOfByte)
    {
      throw new IllegalArgumentException("CSDK Foundation Auth : Cannot create Cipher Instance !");
    }
  }
  
  void setClientID(String paramString)
  {
    clientID = paramString;
    addToKeychain("ClientId", paramString);
  }
  
  void setClientSecret(String paramString)
  {
    clientSecret = paramString;
    addToKeychain("ClientSecret", paramString);
  }
  
  public void setClientState(String paramString)
  {
    clientState = paramString;
    addToKeychain("ClientState", paramString);
  }
  
  void setContinuationToken(String paramString)
  {
    continuationToken = paramString;
    addToKeychain("ContinuationToken", paramString);
  }
  
  protected void setDeviceID(String paramString)
  {
    deviceID = paramString;
    addToKeychain("DeviceId", paramString);
  }
  
  void setDeviceName(String paramString)
  {
    deviceName = paramString;
    addToKeychain("DeviceName", paramString);
  }
  
  void setDeviceToken(String paramString)
  {
    deviceToken = paramString;
    addToKeychain("DeviceToken", paramString);
  }
  
  void setDisplayName(String paramString)
  {
    displayName = paramString;
    addToKeychain("DisplayName", paramString);
  }
  
  void setEmailAddress(String paramString)
  {
    emailAddress = paramString;
    addToKeychain("Email", paramString);
  }
  
  void setEmailVerified(String paramString)
  {
    emailVerified = paramString;
    addToKeychain("EmailVerified", paramString);
  }
  
  public void setEnvironment(AdobeAuthIMSEnvironment paramAdobeAuthIMSEnvironment)
  {
    switch (17.$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment[paramAdobeAuthIMSEnvironment.ordinal()])
    {
    default: 
      imsHost = "https://ims-na1.adobelogin.com/ims";
    case 1: 
    case 2: 
    case 3: 
      for (;;)
      {
        networkService = new AdobeNetworkHttpService(imsHost, "Adobe Creative SDK", null);
        environment = paramAdobeAuthIMSEnvironment;
        return;
        imsHost = "https://ims-na1-stg1.adobelogin.com/ims";
        continue;
        imsHost = "https://ims-na1-qa1.adobelogin.com/ims";
        continue;
        imsHost = "https://ims-na1-qa2.adobelogin.com/ims";
      }
    }
    throw new AdobeInvalidIMSHostException();
  }
  
  void setFirstName(String paramString)
  {
    firstName = paramString;
    addToKeychain("FirstName", paramString);
  }
  
  public void setGrantType(AdobeAuthIMSGrantType paramAdobeAuthIMSGrantType)
  {
    grantType = paramAdobeAuthIMSGrantType;
  }
  
  public void setIsEnterPrise(String paramString)
  {
    isEnterPrise = paramString;
    addToKeychain("EnterpriseInfo", paramString);
  }
  
  void setLastName(String paramString)
  {
    lastName = paramString;
    addToKeychain("LastName", paramString);
  }
  
  void setRefreshToken(String paramString)
  {
    refreshToken = paramString;
    addToKeychain("RefreshToken", paramString);
  }
  
  public void signIn(final IAdobeAuthIMSSignInClient paramIAdobeAuthIMSSignInClient)
  {
    deviceToken = getDeviceToken();
    refreshToken = getRefreshToken();
    if ((getDeviceID() == null) || ((deviceToken != null) && (deviceToken.isEmpty()))) {
      deviceToken = null;
    }
    if ((getRefreshToken() == null) || ((refreshToken != null) && (refreshToken.isEmpty()))) {
      refreshToken = null;
    }
    if ((username != null) && (username.isEmpty())) {
      username = null;
    }
    if ((password != null) && (password.length == 0)) {
      password = null;
    }
    if (refreshToken != null)
    {
      refreshAccessToken(refreshToken, new IAdobeAuthTokenCallback()
      {
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          if ((paramAnonymousAdobeNetworkException.getStatusCode().intValue() == 400) || (paramAnonymousAdobeNetworkException.getStatusCode().intValue() == 401))
          {
            retry();
            return;
          }
          paramAnonymousAdobeNetworkException = AdobeAuthIdentityManagementService.this.createAuthError(paramAnonymousAdobeNetworkException);
          paramIAdobeAuthIMSSignInClient.onError(paramAnonymousAdobeNetworkException);
        }
        
        public void onInvalidClientId()
        {
          paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_CLIENT_ID_REQUIRED));
        }
        
        public void onInvalidClientSecret()
        {
          paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_CLIENT_SECRET_REQUIRED));
        }
        
        public void onInvalidDeviceId()
        {
          paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_DEVICE_ID_REQUIRED));
        }
        
        public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          try
          {
            paramAnonymousAdobeNetworkHttpResponse = new AdobeJSONObject(paramAnonymousAdobeNetworkHttpResponse.getDataString());
            final String str1 = paramAnonymousAdobeNetworkHttpResponse.getString("userId");
            final String str2 = paramAnonymousAdobeNetworkHttpResponse.getString("access_token");
            if (str2 != null)
            {
              parseResponse(paramAnonymousAdobeNetworkHttpResponse, false);
              AdobeAuthIdentityManagementService.this.profileFromServiceWithAccessToken(str2, new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
              {
                public void onCompletion(JSONObject paramAnonymous2JSONObject)
                {
                  val$callbackClient.onSuccess(str1, str2);
                }
              }, new IAdobeGenericErrorCallback()
              {
                public void onError(AdobeCSDKException paramAnonymous2AdobeCSDKException)
                {
                  val$callbackClient.onSuccess(str1, str2);
                }
              });
              return;
            }
            retry();
            return;
          }
          catch (JSONException paramAnonymousAdobeNetworkHttpResponse)
          {
            AdobeAuthIdentityManagementService.this.onJSONException(paramAnonymousAdobeNetworkHttpResponse, paramIAdobeAuthIMSSignInClient);
          }
        }
        
        public void retry()
        {
          setRefreshToken(null);
          signIn(paramIAdobeAuthIMSSignInClient);
        }
      });
      return;
    }
    if (deviceToken != null)
    {
      getAccessTokenWithDeviceToken(deviceToken, new IAdobeAuthTokenCallback()
      {
        private void retry()
        {
          setDeviceToken(null);
          signIn(paramIAdobeAuthIMSSignInClient);
        }
        
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          if ((paramAnonymousAdobeNetworkException.getStatusCode().intValue() == 400) || (paramAnonymousAdobeNetworkException.getStatusCode().intValue() == 401))
          {
            retry();
            return;
          }
          paramAnonymousAdobeNetworkException = AdobeAuthIdentityManagementService.this.createAuthError(paramAnonymousAdobeNetworkException);
          paramIAdobeAuthIMSSignInClient.onError(paramAnonymousAdobeNetworkException);
        }
        
        public void onInvalidClientId()
        {
          paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_CLIENT_ID_REQUIRED));
        }
        
        public void onInvalidClientSecret()
        {
          paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_CLIENT_SECRET_REQUIRED));
        }
        
        public void onInvalidDeviceId()
        {
          paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_DEVICE_ID_REQUIRED));
        }
        
        public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          try
          {
            paramAnonymousAdobeNetworkHttpResponse = new AdobeJSONObject(paramAnonymousAdobeNetworkHttpResponse.getDataString());
            final String str1 = paramAnonymousAdobeNetworkHttpResponse.getString("userId");
            final String str2 = paramAnonymousAdobeNetworkHttpResponse.getString("access_token");
            if (str2 != null)
            {
              parseResponse(paramAnonymousAdobeNetworkHttpResponse, true);
              setDeviceToken(deviceToken);
              AdobeAuthIdentityManagementService.this.setDeviceTokenExpiration(deviceToken);
              AdobeAuthIdentityManagementService.this.profileFromServiceWithAccessToken(str2, new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
              {
                public void onCompletion(JSONObject paramAnonymous2JSONObject)
                {
                  val$callbackClient.onSuccess(str1, str2);
                }
              }, new IAdobeGenericErrorCallback()
              {
                public void onError(AdobeCSDKException paramAnonymous2AdobeCSDKException)
                {
                  val$callbackClient.onSuccess(str1, str2);
                }
              });
              return;
            }
            retry();
            return;
          }
          catch (JSONException paramAnonymousAdobeNetworkHttpResponse)
          {
            AdobeAuthIdentityManagementService.this.onJSONException(paramAnonymousAdobeNetworkHttpResponse, paramIAdobeAuthIMSSignInClient);
          }
        }
      });
      return;
    }
    if ((username == null) || (password == null))
    {
      paramIAdobeAuthIMSSignInClient.onInfoNeeded(AdobeAuthIMSInfoNeeded.AdobeAuthIMSInfoNeededUsernameAndPassword);
      return;
    }
    authKeychain.resetTokens();
    getAccessToken(new IAdobeAuthTokenCallback()
    {
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramIAdobeAuthIMSSignInClient.onError(AdobeAuthIdentityManagementService.this.createAuthError(paramAnonymousAdobeNetworkException));
      }
      
      public void onInvalidClientId()
      {
        paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_CLIENT_ID_REQUIRED));
      }
      
      public void onInvalidClientSecret()
      {
        paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_CLIENT_SECRET_REQUIRED));
      }
      
      public void onInvalidDeviceId()
      {
        paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_DEVICE_ID_REQUIRED));
      }
      
      public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        try
        {
          paramAnonymousAdobeNetworkHttpResponse = new AdobeJSONObject(paramAnonymousAdobeNetworkHttpResponse.getDataString());
          final String str1 = paramAnonymousAdobeNetworkHttpResponse.getString("userId");
          final String str2 = paramAnonymousAdobeNetworkHttpResponse.getString("access_token");
          String str3 = paramAnonymousAdobeNetworkHttpResponse.getString("error");
          if (str2 != null)
          {
            parseResponse(paramAnonymousAdobeNetworkHttpResponse, false);
            AdobeAuthIdentityManagementService.this.profileFromServiceWithAccessToken(str2, new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
            {
              public void onCompletion(JSONObject paramAnonymous2JSONObject)
              {
                parseFromProfile(paramAnonymous2JSONObject);
                val$callbackClient.onSuccess(str1, str2);
              }
            }, new IAdobeGenericErrorCallback()
            {
              public void onError(AdobeCSDKException paramAnonymous2AdobeCSDKException)
              {
                val$callbackClient.onSuccess(str1, str2);
              }
            });
            return;
          }
          if (str3 == null) {
            return;
          }
          paramAnonymousAdobeNetworkHttpResponse = AdobeAuthIMSInfoNeeded.valueOf(str3);
          if (paramAnonymousAdobeNetworkHttpResponse == AdobeAuthIMSInfoNeeded.AdobeAuthIMSInfoNeededUnknownError)
          {
            paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_UNKNOWN_ERROR));
            return;
          }
        }
        catch (JSONException paramAnonymousAdobeNetworkHttpResponse)
        {
          AdobeAuthIdentityManagementService.this.onJSONException(paramAnonymousAdobeNetworkHttpResponse, paramIAdobeAuthIMSSignInClient);
          return;
        }
        paramIAdobeAuthIMSSignInClient.onInfoNeeded(paramAnonymousAdobeNetworkHttpResponse);
      }
    });
  }
  
  public void signInWithAuthCode(String paramString, final IAdobeAuthIMSSignInClient paramIAdobeAuthIMSSignInClient)
  {
    getAccessTokenWithAuthCode(paramString, new IAdobeAuthTokenCallback()
    {
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramIAdobeAuthIMSSignInClient.onError(AdobeAuthIdentityManagementService.this.createAuthError(paramAnonymousAdobeNetworkException));
      }
      
      public void onInvalidClientId()
      {
        paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_CLIENT_ID_REQUIRED));
      }
      
      public void onInvalidClientSecret()
      {
        paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_CLIENT_SECRET_REQUIRED));
      }
      
      public void onInvalidDeviceId()
      {
        paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_DEVICE_ID_REQUIRED));
      }
      
      /* Error */
      public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        // Byte code:
        //   0: aconst_null
        //   1: astore 7
        //   3: aconst_null
        //   4: astore 10
        //   6: aconst_null
        //   7: astore_3
        //   8: aconst_null
        //   9: astore 6
        //   11: aconst_null
        //   12: astore 9
        //   14: aconst_null
        //   15: astore_2
        //   16: aconst_null
        //   17: astore 8
        //   19: aconst_null
        //   20: astore 11
        //   22: aconst_null
        //   23: astore 4
        //   25: aload 8
        //   27: astore 5
        //   29: aload_1
        //   30: invokevirtual 70	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse:getDataString	()Ljava/lang/String;
        //   33: ifnull +66 -> 99
        //   36: new 72	com/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject
        //   39: dup
        //   40: aload_1
        //   41: invokevirtual 70	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse:getDataString	()Ljava/lang/String;
        //   44: invokespecial 75	com/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject:<init>	(Ljava/lang/String;)V
        //   47: astore_3
        //   48: aload 9
        //   50: astore_1
        //   51: aload 10
        //   53: astore_2
        //   54: aload_3
        //   55: ldc 77
        //   57: invokevirtual 81	com/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
        //   60: astore 6
        //   62: aload 9
        //   64: astore_1
        //   65: aload 6
        //   67: astore_2
        //   68: aload_3
        //   69: ldc 83
        //   71: invokevirtual 81	com/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
        //   74: astore 7
        //   76: aload 7
        //   78: astore_1
        //   79: aload 6
        //   81: astore_2
        //   82: aload_3
        //   83: ldc 85
        //   85: invokevirtual 81	com/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
        //   88: astore 5
        //   90: aload_3
        //   91: astore 4
        //   93: aload 6
        //   95: astore_3
        //   96: aload 7
        //   98: astore_2
        //   99: aload_2
        //   100: ifnull +76 -> 176
        //   103: aload_0
        //   104: getfield 23	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7:this$0	Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
        //   107: aload 4
        //   109: iconst_0
        //   110: invokevirtual 89	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService:parseResponse	(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;Z)V
        //   113: aload_0
        //   114: getfield 23	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7:this$0	Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
        //   117: aload_2
        //   118: new 13	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7$1
        //   121: dup
        //   122: aload_0
        //   123: aload_3
        //   124: aload_2
        //   125: invokespecial 92	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7$1:<init>	(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7;Ljava/lang/String;Ljava/lang/String;)V
        //   128: new 15	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7$2
        //   131: dup
        //   132: aload_0
        //   133: aload_3
        //   134: aload_2
        //   135: invokespecial 93	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7$2:<init>	(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7;Ljava/lang/String;Ljava/lang/String;)V
        //   138: invokestatic 97	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService:access$000	(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
        //   141: return
        //   142: astore_2
        //   143: aload 11
        //   145: astore 4
        //   147: aload 7
        //   149: astore_3
        //   150: aload 6
        //   152: astore_1
        //   153: getstatic 103	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
        //   156: ldc 8
        //   158: invokevirtual 108	java/lang/Class:getSimpleName	()Ljava/lang/String;
        //   161: ldc 110
        //   163: aload_2
        //   164: invokestatic 116	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
        //   167: aload_1
        //   168: astore_2
        //   169: aload 8
        //   171: astore 5
        //   173: goto -74 -> 99
        //   176: aload 5
        //   178: ifnull -37 -> 141
        //   181: aload 5
        //   183: invokestatic 122	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded:valueOf	(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;
        //   186: astore_1
        //   187: aload_1
        //   188: getstatic 126	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded:AdobeAuthIMSInfoNeededUnknownError	Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;
        //   191: if_acmpne +23 -> 214
        //   194: aload_0
        //   195: getfield 25	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7:val$client	Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;
        //   198: new 43	com/adobe/creativesdk/foundation/auth/AdobeAuthException
        //   201: dup
        //   202: getstatic 129	com/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode:ADOBE_AUTH_ERROR_CODE_UNKNOWN_ERROR	Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;
        //   205: invokespecial 52	com/adobe/creativesdk/foundation/auth/AdobeAuthException:<init>	(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V
        //   208: invokeinterface 40 2 0
        //   213: return
        //   214: aload_0
        //   215: getfield 25	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7:val$client	Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;
        //   218: aload_1
        //   219: invokeinterface 133 2 0
        //   224: return
        //   225: astore 5
        //   227: aload_3
        //   228: astore 4
        //   230: aload_2
        //   231: astore_3
        //   232: aload 5
        //   234: astore_2
        //   235: goto -82 -> 153
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	238	0	this	7
        //   0	238	1	paramAnonymousAdobeNetworkHttpResponse	AdobeNetworkHttpResponse
        //   15	120	2	localObject1	Object
        //   142	22	2	localJSONException1	JSONException
        //   168	67	2	localObject2	Object
        //   7	225	3	localObject3	Object
        //   23	206	4	localObject4	Object
        //   27	155	5	localObject5	Object
        //   225	8	5	localJSONException2	JSONException
        //   9	142	6	str1	String
        //   1	147	7	str2	String
        //   17	153	8	localObject6	Object
        //   12	51	9	localObject7	Object
        //   4	48	10	localObject8	Object
        //   20	124	11	localObject9	Object
        // Exception table:
        //   from	to	target	type
        //   36	48	142	org/json/JSONException
        //   54	62	225	org/json/JSONException
        //   68	76	225	org/json/JSONException
        //   82	90	225	org/json/JSONException
      }
    });
  }
  
  public void signInWithDeviceToken(final String paramString, final IAdobeAuthIMSSignInClient paramIAdobeAuthIMSSignInClient)
  {
    setDeviceTokenExpiration(paramString);
    getAccessTokenWithDeviceToken(paramString, new IAdobeAuthTokenCallback()
    {
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramIAdobeAuthIMSSignInClient.onError(AdobeAuthIdentityManagementService.this.createAuthError(paramAnonymousAdobeNetworkException));
      }
      
      public void onInvalidClientId()
      {
        paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_CLIENT_ID_REQUIRED));
      }
      
      public void onInvalidClientSecret()
      {
        paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_CLIENT_ID_REQUIRED));
      }
      
      public void onInvalidDeviceId()
      {
        paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_DEVICE_ID_REQUIRED));
      }
      
      public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        try
        {
          AdobeJSONObject localAdobeJSONObject = new AdobeJSONObject(paramAnonymousAdobeNetworkHttpResponse.getDataString());
          final String str1 = localAdobeJSONObject.getString("userId");
          final String str2 = localAdobeJSONObject.getString("access_token");
          Object localObject = null;
          if (localAdobeJSONObject.has("error")) {
            localObject = localAdobeJSONObject.getString("error");
          }
          if (str2 != null)
          {
            parseResponse(localAdobeJSONObject, true);
            setDeviceToken(paramString);
            AdobeAuthIdentityManagementService.this.profileFromServiceWithAccessToken(str2, new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
            {
              public void onCompletion(JSONObject paramAnonymous2JSONObject)
              {
                parseFromProfile(paramAnonymous2JSONObject);
                val$client.onSuccess(str1, str2);
              }
            }, new IAdobeGenericErrorCallback()
            {
              public void onError(AdobeCSDKException paramAnonymous2AdobeCSDKException)
              {
                val$client.onSuccess(str1, str2);
              }
            });
            return;
          }
          if (localObject != null)
          {
            localObject = new HashMap();
            ((HashMap)localObject).put("info", Integer.valueOf(paramAnonymousAdobeNetworkHttpResponse.getStatusCode()));
            paramIAdobeAuthIMSSignInClient.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_UNKNOWN_ERROR, (HashMap)localObject));
            return;
          }
        }
        catch (JSONException paramAnonymousAdobeNetworkHttpResponse)
        {
          AdobeLogger.log(Level.ERROR, AdobeAuthIdentityManagementService.class.getSimpleName(), "Error in parsing response for access token", paramAnonymousAdobeNetworkHttpResponse);
          AdobeAuthIdentityManagementService.this.onJSONException(paramAnonymousAdobeNetworkHttpResponse, paramIAdobeAuthIMSSignInClient);
        }
      }
    });
  }
  
  public void signOut(final IAdobeAuthIMSSignOutClient paramIAdobeAuthIMSSignOutClient)
  {
    if (getAccessToken() != null)
    {
      HashMap localHashMap = new HashMap();
      paramIAdobeAuthIMSSignOutClient = new IAdobeNetworkCompletionHandler()
      {
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          AdobeAnalyticsSDKReporter.trackAuthStep("Logout Failure", getAdobeID());
          paramIAdobeAuthIMSSignOutClient.onSuccess();
        }
        
        public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          AdobeAnalyticsSDKReporter.trackAuthStep("Logout Success", getAdobeID());
          paramIAdobeAuthIMSSignOutClient.onSuccess();
        }
      };
      makeHTTPOperationForURL(getSignOutURL(), AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET, localHashMap, null, paramIAdobeAuthIMSSignOutClient);
      resetKeys();
      removeAnySharedSSOAcount();
      return;
    }
    resetKeys();
    removeAnySharedSSOAcount();
    paramIAdobeAuthIMSSignOutClient.onSuccess();
  }
}
