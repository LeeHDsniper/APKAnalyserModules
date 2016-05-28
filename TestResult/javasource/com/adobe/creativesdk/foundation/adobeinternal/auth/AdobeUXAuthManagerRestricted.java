package com.adobe.creativesdk.foundation.adobeinternal.auth;

import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.auth.AdobeAuthErrorCode;
import com.adobe.creativesdk.foundation.auth.AdobeAuthException;
import com.adobe.creativesdk.foundation.auth.AdobeAuthSessionLauncher;
import com.adobe.creativesdk.foundation.auth.AdobeAuthUserProfile;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthManager;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;

public class AdobeUXAuthManagerRestricted
{
  private static String _accessGroupAccountTypeForSSO = null;
  public static boolean mMockTestMode = false;
  private static AdobeUXAuthManagerRestricted sharedInstance = null;
  private AdobeAuthManager _authManagerImpl = null;
  
  private AdobeUXAuthManagerRestricted() {}
  
  public static String getAccessGroupAccountType()
  {
    return _accessGroupAccountTypeForSSO;
  }
  
  public static AdobeUXAuthManagerRestricted getSharedAuthManagerRestricted()
  {
    if (sharedInstance == null) {
      sharedInstance = new AdobeUXAuthManagerRestricted();
    }
    return sharedInstance;
  }
  
  public boolean checkAndCallErrorIfInvalidAccessToken(IAdobeGenericErrorCallback<AdobeAuthException> paramIAdobeGenericErrorCallback, String paramString)
  {
    if (mMockTestMode) {}
    for (;;)
    {
      return false;
      boolean bool = hasValidAccessToken();
      if (!bool)
      {
        if (paramIAdobeGenericErrorCallback == null) {
          break label43;
        }
        paramIAdobeGenericErrorCallback.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_USER_CREDENTIALS_REQUIRED));
      }
      while (!bool)
      {
        return true;
        label43:
        AdobeLogger.log(Level.ERROR, AdobeUXAuthManagerRestricted.class.getSimpleName(), paramString);
      }
    }
  }
  
  public boolean checkAndCallErrorIfNotAuthenticated(IAdobeGenericErrorCallback<AdobeAuthException> paramIAdobeGenericErrorCallback, String paramString)
  {
    if (mMockTestMode) {}
    for (;;)
    {
      return false;
      boolean bool = isAuthenticated();
      if (!bool)
      {
        if (paramIAdobeGenericErrorCallback == null) {
          break label43;
        }
        paramIAdobeGenericErrorCallback.onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_USER_CREDENTIALS_REQUIRED));
      }
      while (!bool)
      {
        return true;
        label43:
        AdobeLogger.log(Level.ERROR, AdobeUXAuthManagerRestricted.class.getSimpleName(), paramString);
      }
    }
  }
  
  public String getAdobeID()
  {
    return _authManagerImpl.getAdobeID();
  }
  
  public AdobeAuthUserProfile getUserProfile()
  {
    return _authManagerImpl.getUserProfile();
  }
  
  public boolean hasValidAccessToken()
  {
    return _authManagerImpl.willAccessTokenBeValidIn(0L);
  }
  
  public boolean isAdobeApplication()
  {
    return _authManagerImpl.isAdobeApplication();
  }
  
  public boolean isAuthenticated()
  {
    return _authManagerImpl.isAuthenticated();
  }
  
  public void login(AdobeAuthSessionLauncher paramAdobeAuthSessionLauncher)
  {
    _authManagerImpl.login(paramAdobeAuthSessionLauncher);
  }
  
  public void logout()
  {
    _authManagerImpl.logout();
  }
  
  public boolean reAuthenticate()
  {
    return _authManagerImpl.reAuthenticate();
  }
}
