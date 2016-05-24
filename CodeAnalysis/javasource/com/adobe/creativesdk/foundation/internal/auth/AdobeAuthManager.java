package com.adobe.creativesdk.foundation.internal.auth;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import com.adobe.creativesdk.foundation.adobeinternal.auth.AdobeUXAuthManagerRestricted;
import com.adobe.creativesdk.foundation.auth.AdobeAuthErrorCode;
import com.adobe.creativesdk.foundation.auth.AdobeAuthException;
import com.adobe.creativesdk.foundation.auth.AdobeAuthSessionLauncher;
import com.adobe.creativesdk.foundation.auth.AdobeAuthUserProfile;
import com.adobe.creativesdk.foundation.internal.analytics.AdobeAnalyticsSDKReporter;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.notification.IAdobeNotificationID;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;
import java.util.concurrent.Semaphore;
import javax.crypto.NoSuchPaddingException;

public class AdobeAuthManager
{
  private static AdobeAuthManager sharedManager = null;
  private boolean _adobeApplication;
  private Activity _currentTopActivity = null;
  private Map<IAdobeAuthLoginObserver, LoginObserver> _loginMap = null;
  private Map<IAdobeAuthLogoutObserver, LogoutObserver> _logoutMap = null;
  private AdobeAuthSessionLauncher _sessionLauncher = null;
  private AdobeAuthOptions[] mAuthOptions = null;
  private IAdobeAuthIMSSignInClient mSignInClient = null;
  private AdobeAuthUserProfileImpl mUserProfile = null;
  
  private AdobeAuthManager() {}
  
  private Context getApplicationContext()
  {
    return AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext();
  }
  
  private AdobeAuthIdentityManagementService getIMSService()
  {
    return AdobeAuthIdentityManagementService.getSharedInstance();
  }
  
  private void handleEmergencyLogOut()
  {
    try
    {
      new Handler(getApplicationContext().getMainLooper()).post(new Runnable()
      {
        public void run()
        {
          logout();
        }
      });
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private boolean isInitialized()
  {
    return getApplicationContext() != null;
  }
  
  static boolean isInstanceCreated()
  {
    return sharedManager != null;
  }
  
  private void launchSignInActivity(int paramInt)
  {
    Object localObject2 = _sessionLauncher.getLauncherActivity();
    int j = 1;
    int k = _sessionLauncher.getIntentFlags();
    Object localObject1 = localObject2;
    int i = k;
    if (localObject2 == null)
    {
      j = 0;
      localObject1 = _sessionLauncher.getLauncherContext();
      i = k | 0x10000000;
    }
    localObject2 = new Intent((Context)localObject1, AdobeAuthSignInActivity.class);
    if (AdobeAuthIdentityManagementService.getSharedInstance().getDeviceID() != null) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      boolean bool2 = bool1;
      if (bool1)
      {
        bool2 = false;
        if (AdobeUXAuthManagerRestricted.getAccessGroupAccountType() != null) {
          bool2 = AdobeUXAuthManagerRestricted.getAccessGroupAccountType().equalsIgnoreCase("com.adobe.creativesdk.foundation.auth.adobeID");
        }
      }
      if (bool2) {
        ((Intent)localObject2).putExtra("uxauth_trysharedtoken", true);
      }
      ((Intent)localObject2).putExtra(AdobeAuthConstants.SIGN_IN_UI_TYPE, paramInt);
      ((Intent)localObject2).addFlags(i);
      if (j == 0) {
        break;
      }
      ((Activity)localObject1).startActivityForResult((Intent)localObject2, _sessionLauncher.getRequestCode());
      return;
    }
    ((Context)localObject1).startActivity((Intent)localObject2);
  }
  
  private void loginInternal(final AdobeAuthInteraction paramAdobeAuthInteraction, final boolean paramBoolean)
  {
    String str = null;
    if (getUserProfile() != null) {
      str = getUserProfile().getAdobeID();
    }
    AdobeAnalyticsSDKReporter.trackAuthStep("Login Attempt", str);
    paramAdobeAuthInteraction = new IAdobeAuthIMSSignInClient()
    {
      public void onError(AdobeAuthException paramAnonymousAdobeAuthException)
      {
        AdobeAuthManager.this.postLoginError(paramBoolean, paramAnonymousAdobeAuthException);
      }
      
      public void onInfoNeeded(AdobeAuthIMSInfoNeeded paramAnonymousAdobeAuthIMSInfoNeeded)
      {
        if (paramAdobeAuthInteraction == AdobeAuthInteraction.AdobeAuthInteractionInteractive)
        {
          if (paramAnonymousAdobeAuthIMSInfoNeeded == AdobeAuthIMSInfoNeeded.AdobeAuthIMSInfoNeededUsernameAndPassword)
          {
            AdobeAuthManager.this.launchSignInActivity(AdobeAuthConstants.AUTH_SESSION_TYPE_SIGN_IN);
            return;
          }
          onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_USER_INTERACTION_REQUIRED));
          return;
        }
        onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_USER_INTERACTION_REQUIRED));
      }
      
      public void onSuccess(String paramAnonymousString1, String paramAnonymousString2)
      {
        AdobeAnalyticsSDKReporter.trackAuthStep("Valid Authentication Token", paramAnonymousString1);
        AdobeAuthManager.this.postLoginSuccess(paramBoolean);
      }
    };
    setSignInClient(paramAdobeAuthInteraction);
    getIMSService().signIn(paramAdobeAuthInteraction);
  }
  
  private void postLoginError(boolean paramBoolean, AdobeAuthException paramAdobeAuthException)
  {
    Object localObject = null;
    if (getUserProfile() != null) {
      localObject = getUserProfile().getAdobeID();
    }
    if (paramAdobeAuthException.getErrorCode() == AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_USER_CANCELLED) {
      AdobeAnalyticsSDKReporter.trackAuthStep("Login Cancel", (String)localObject);
    }
    for (;;)
    {
      localObject = new HashMap();
      ((Map)localObject).put("Error", paramAdobeAuthException);
      paramAdobeAuthException = AdobeInternalNotificationID.AdobeAuthLoginNotification;
      if (paramBoolean) {
        paramAdobeAuthException = AdobeInternalNotificationID.AdobeAuthLoginExternalNotification;
      }
      paramAdobeAuthException = new AdobeNotification(paramAdobeAuthException, (Map)localObject);
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(paramAdobeAuthException);
      return;
      AdobeAnalyticsSDKReporter.trackAuthStep("Login Failure", (String)localObject);
    }
  }
  
  private void postLoginSuccess(boolean paramBoolean)
  {
    if (getUserProfile() != null) {}
    for (Object localObject = getUserProfile().getAdobeID();; localObject = "")
    {
      AdobeAnalyticsSDKReporter.trackAuthStep("Login Success", (String)localObject);
      localObject = AdobeInternalNotificationID.AdobeAuthLoginNotification;
      if (paramBoolean) {
        localObject = AdobeInternalNotificationID.AdobeAuthLoginExternalNotification;
      }
      localObject = new AdobeNotification((IAdobeNotificationID)localObject, null);
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification((AdobeNotification)localObject);
      return;
    }
  }
  
  private void setCurrentLauncherObject(AdobeAuthSessionLauncher paramAdobeAuthSessionLauncher)
  {
    _sessionLauncher = paramAdobeAuthSessionLauncher;
  }
  
  public static AdobeAuthManager sharedAuthManager()
  {
    if (sharedManager == null) {
      sharedManager = new AdobeAuthManager();
    }
    return sharedManager;
  }
  
  public boolean canRefreshAccessToken()
  {
    boolean bool2 = false;
    Object localObject2 = getIMSService();
    Object localObject1 = ((AdobeAuthIdentityManagementService)localObject2).getDeviceToken();
    localObject2 = ((AdobeAuthIdentityManagementService)localObject2).getRefreshToken();
    boolean bool1 = bool2;
    if (localObject2 != null)
    {
      bool1 = bool2;
      if (((String)localObject2).length() > 0)
      {
        localObject2 = getIMSService().getRefreshTokenExpirationTime();
        bool1 = bool2;
        if (localObject2 != null) {
          if (((Date)localObject2).getTime() - new Date().getTime() <= 0L) {
            break label136;
          }
        }
      }
    }
    label136:
    for (bool1 = true;; bool1 = false)
    {
      bool2 = bool1;
      if (!bool1)
      {
        bool2 = bool1;
        if (localObject1 != null)
        {
          bool2 = bool1;
          if (((String)localObject1).length() > 0)
          {
            localObject1 = getIMSService().getDeviceTokenExpirationTime();
            bool2 = bool1;
            if (localObject1 != null)
            {
              if (((Date)localObject1).getTime() - new Date().getTime() <= 0L) {
                break;
              }
              bool2 = true;
            }
          }
        }
      }
      return bool2;
    }
    return false;
  }
  
  public String getAdobeID()
  {
    return getIMSService().getAdobeID();
  }
  
  public AdobeAuthSessionLauncher getCurrentAuthSessionLauncher()
  {
    return _sessionLauncher;
  }
  
  public IAdobeAuthIMSSignInClient getCurrentSignInClient()
  {
    return mSignInClient;
  }
  
  public AdobeAuthUserProfile getUserProfile()
  {
    if ((!isInitialized()) || (!isAuthenticated())) {
      return null;
    }
    mUserProfile = new AdobeAuthUserProfileImpl();
    AdobeAuthIdentityManagementService localAdobeAuthIdentityManagementService = AdobeAuthIdentityManagementService.getSharedInstance();
    mUserProfile.setAdobeID(localAdobeAuthIdentityManagementService.getAdobeID());
    mUserProfile.setDisplayName(localAdobeAuthIdentityManagementService.getDisplayName());
    mUserProfile.setFirstName(localAdobeAuthIdentityManagementService.getFirstName());
    mUserProfile.setLastName(localAdobeAuthIdentityManagementService.getLastName());
    mUserProfile.setEmail(localAdobeAuthIdentityManagementService.getEmailAddress());
    if ((localAdobeAuthIdentityManagementService.getIsEnterPrise() != null) && (localAdobeAuthIdentityManagementService.getIsEnterPrise().equals("true"))) {}
    for (boolean bool = true;; bool = false)
    {
      mUserProfile.setEnterprise(bool);
      return mUserProfile;
    }
  }
  
  public boolean hasValidAccessToken()
  {
    boolean bool2 = false;
    Object localObject = getIMSService().getAccessToken();
    boolean bool1 = bool2;
    if (localObject != null)
    {
      bool1 = bool2;
      if (((String)localObject).length() > 0)
      {
        localObject = getIMSService().getAccessTokenExpirationTime();
        bool1 = bool2;
        if (localObject != null)
        {
          bool1 = bool2;
          if (((Date)localObject).getTime() - new Date().getTime() > 0L) {
            bool1 = true;
          }
        }
      }
    }
    return bool1;
  }
  
  public boolean isAdobeApplication()
  {
    return _adobeApplication;
  }
  
  public boolean isAuthenticated()
  {
    if (!isInitialized()) {}
    while ((!hasValidAccessToken()) && (!canRefreshAccessToken())) {
      return false;
    }
    return true;
  }
  
  public void login(AdobeAuthSessionLauncher paramAdobeAuthSessionLauncher)
  {
    setCurrentLauncherObject(paramAdobeAuthSessionLauncher);
    AdobeAnalyticsSDKReporter.trackAuthStep("Login Start", null);
    if (hasValidAccessToken())
    {
      postLoginSuccess(true);
      return;
    }
    paramAdobeAuthSessionLauncher = null;
    if (getUserProfile() != null) {
      paramAdobeAuthSessionLauncher = getUserProfile().getAdobeID();
    }
    if (AdobeAuthIdentityManagementService.getSharedInstance().getAccessToken() != null) {
      AdobeAnalyticsSDKReporter.trackAuthStep("Expired Authentication Token", paramAdobeAuthSessionLauncher);
    }
    for (;;)
    {
      loginInternal(AdobeAuthInteraction.AdobeAuthInteractionInteractive, true);
      return;
      AdobeAnalyticsSDKReporter.trackAuthStep("Missing Authentication Token", null);
    }
  }
  
  public void logout()
  {
    AdobeAuthUserProfile localAdobeAuthUserProfile = getUserProfile();
    Object localObject = null;
    if (localAdobeAuthUserProfile != null)
    {
      AdobeAnalyticsSDKReporter.trackAuthStep("Logout Attempt", localAdobeAuthUserProfile.getAdobeID());
      localObject = localAdobeAuthUserProfile.getAdobeID();
    }
    if (getApplicationContext() == null)
    {
      localObject = new HashMap();
      ((Map)localObject).put("Error", new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_AUTH_MODULE_NOT_INITIALIZED));
      localObject = new AdobeNotification(AdobeInternalNotificationID.AdobeAuthLogoutNotification, (Map)localObject);
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification((AdobeNotification)localObject);
      return;
    }
    localObject = new IAdobeAuthIMSSignOutClient()
    {
      public void onSuccess()
      {
        AdobeAnalyticsSDKReporter.trackAuthStep("Logout Success", val$adobeID);
        AdobeNotification localAdobeNotification = new AdobeNotification(AdobeInternalNotificationID.AdobeAuthLogoutNotification, null);
        AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(localAdobeNotification);
      }
    };
    getIMSService().signOut((IAdobeAuthIMSSignOutClient)localObject);
  }
  
  public void promptForSignUp(AdobeAuthSessionLauncher paramAdobeAuthSessionLauncher)
  {
    AdobeAnalyticsSDKReporter.trackRegStep("Signup Start", null);
    setCurrentLauncherObject(paramAdobeAuthSessionLauncher);
    if (getApplicationContext() == null)
    {
      AdobeAnalyticsSDKReporter.trackRegStep("Signup Failure", null);
      postLoginError(true, new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_AUTH_MODULE_NOT_INITIALIZED));
      return;
    }
    if ((getUserProfile() != null) && (getUserProfile().getAdobeID() != null))
    {
      AdobeAnalyticsSDKReporter.trackRegStep("Signup Failure", getUserProfile().getAdobeID());
      postLoginError(true, new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_UNKNOWN_ERROR));
      return;
    }
    paramAdobeAuthSessionLauncher = new IAdobeAuthIMSSignInClient()
    {
      public void onError(AdobeAuthException paramAnonymousAdobeAuthException)
      {
        if (paramAnonymousAdobeAuthException.getErrorCode() == AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_USER_CANCELLED) {
          AdobeAnalyticsSDKReporter.trackRegStep("Signup Cancel", getAdobeID());
        }
        for (;;)
        {
          AdobeAuthManager.this.postLoginError(true, paramAnonymousAdobeAuthException);
          return;
          AdobeAnalyticsSDKReporter.trackRegStep("Signup Failure", getAdobeID());
        }
      }
      
      public void onInfoNeeded(AdobeAuthIMSInfoNeeded paramAnonymousAdobeAuthIMSInfoNeeded)
      {
        onError(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_UNKNOWN_ERROR));
      }
      
      public void onSuccess(String paramAnonymousString1, String paramAnonymousString2)
      {
        AdobeAnalyticsSDKReporter.trackRegStep("Signup Success", paramAnonymousString1);
        AdobeAuthManager.this.postLoginSuccess(true);
      }
    };
    launchSignInActivity(AdobeAuthConstants.AUTH_SESSION_TYPE_SIGN_UP);
    setSignInClient(paramAdobeAuthSessionLauncher);
  }
  
  public boolean reAuthenticate()
  {
    if (!isInitialized()) {
      return false;
    }
    final Semaphore localSemaphore = new Semaphore(1, true);
    try
    {
      localSemaphore.acquire();
      localObject = getIMSService().getAccessTokenExpirationTime();
      if ((localObject != null) && (((Date)localObject).getTime() - new Date().getTime() > 0L)) {
        AdobeLogger.log(Level.WARN, "Authentication", "Access token required reauthentication sooner than expected.");
      }
      localObject = new Observer()
      {
        public boolean _result = false;
        
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeAuthLoginNotification, this);
          paramAnonymousObservable = (AdobeNotification)paramAnonymousObject;
          if ((paramAnonymousObservable.getInfo() == null) || (paramAnonymousObservable.getInfo().get("Error") == null)) {
            _result = true;
          }
          for (;;)
          {
            localSemaphore.release();
            return;
            paramAnonymousObservable = (AdobeAuthException)paramAnonymousObservable.getInfo().get("Error");
            if ((paramAnonymousObservable != null) && (paramAnonymousObservable.getErrorCode() == AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_USER_INTERACTION_REQUIRED)) {
              this$0.handleEmergencyLogOut();
            }
          }
        }
      };
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLoginNotification, (Observer)localObject);
      loginInternal(AdobeAuthInteraction.AdobeAuthInteractionHeadless, false);
    }
    catch (InterruptedException localInterruptedException2)
    {
      try
      {
        Object localObject;
        localSemaphore.acquire();
        return _result;
        localInterruptedException2 = localInterruptedException2;
        AdobeLogger.log(Level.WARN, "Authentication", "Reauthenticate: Can not aquire permit.", localInterruptedException2);
      }
      catch (InterruptedException localInterruptedException1)
      {
        for (;;)
        {
          AdobeLogger.log(Level.WARN, "Authentication", "Reauthenticate: Can not acquire permit.", localInterruptedException1);
        }
      }
    }
  }
  
  public void registerLoginClient(IAdobeAuthLoginObserver paramIAdobeAuthLoginObserver)
  {
    _loginMap.put(paramIAdobeAuthLoginObserver, new LoginObserver(paramIAdobeAuthLoginObserver));
    ((LoginObserver)_loginMap.get(paramIAdobeAuthLoginObserver)).registerForLogin();
  }
  
  public void registerLogoutClient(IAdobeAuthLogoutObserver paramIAdobeAuthLogoutObserver)
  {
    _logoutMap.put(paramIAdobeAuthLogoutObserver, new LogoutObserver(paramIAdobeAuthLogoutObserver));
    ((LogoutObserver)_logoutMap.get(paramIAdobeAuthLogoutObserver)).registerForLogout();
  }
  
  public void setAuthenticationParameters(String paramString1, String paramString2, byte[] paramArrayOfByte)
    throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException
  {
    if (isInitialized())
    {
      AdobeAuthIdentityManagementService localAdobeAuthIdentityManagementService = AdobeAuthIdentityManagementService.getSharedInstance();
      mAuthOptions = new AdobeAuthOptions[] { AdobeAuthOptions.AdobeAuthOptionsHideSignUpOnSignIn };
      localAdobeAuthIdentityManagementService.setCipherKey(paramArrayOfByte);
      localAdobeAuthIdentityManagementService.setAuthenticationParameters(paramString1, paramString2, null, null, null);
      localAdobeAuthIdentityManagementService.setGrantType(AdobeAuthIMSGrantType.AdobeAuthIMSGrantTypeAuthorization);
      localAdobeAuthIdentityManagementService.setAdditionalClientScopes(null);
      _adobeApplication = false;
    }
  }
  
  public void setCurrentActivity(Activity paramActivity)
  {
    _currentTopActivity = paramActivity;
  }
  
  void setSignInClient(IAdobeAuthIMSSignInClient paramIAdobeAuthIMSSignInClient)
  {
    mSignInClient = paramIAdobeAuthIMSSignInClient;
  }
  
  public void unregisterLoginClient(IAdobeAuthLoginObserver paramIAdobeAuthLoginObserver)
  {
    ((LoginObserver)_loginMap.get(paramIAdobeAuthLoginObserver)).unregisterForLogin();
    _loginMap.put(paramIAdobeAuthLoginObserver, null);
  }
  
  public void unregisterLogoutClient(IAdobeAuthLogoutObserver paramIAdobeAuthLogoutObserver)
  {
    ((LogoutObserver)_logoutMap.get(paramIAdobeAuthLogoutObserver)).unregisterForLogout();
    _logoutMap.put(paramIAdobeAuthLogoutObserver, null);
  }
  
  public boolean willAccessTokenBeValidIn(long paramLong)
  {
    boolean bool2 = false;
    Object localObject = getIMSService().getAccessToken();
    boolean bool1 = bool2;
    if (localObject != null)
    {
      bool1 = bool2;
      if (((String)localObject).length() > 0)
      {
        localObject = getIMSService().getAccessTokenExpirationTime();
        bool1 = bool2;
        if (localObject != null)
        {
          if (((Date)localObject).getTime() <= new Date().getTime() + 1000L * paramLong) {
            break label77;
          }
          bool1 = true;
        }
      }
    }
    return bool1;
    label77:
    return false;
  }
  
  class LoginObserver
    implements Observer
  {
    IAdobeAuthLoginObserver _loginClient = null;
    
    LoginObserver(IAdobeAuthLoginObserver paramIAdobeAuthLoginObserver)
    {
      _loginClient = paramIAdobeAuthLoginObserver;
    }
    
    public void registerForLogin()
    {
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLoginExternalNotification, this);
    }
    
    public void unregisterForLogin()
    {
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeAuthLoginExternalNotification, this);
    }
    
    public void update(Observable paramObservable, Object paramObject)
    {
      paramObservable = (AdobeNotification)paramObject;
      if ((paramObservable.getInfo() != null) && (paramObservable.getInfo().get("Error") != null))
      {
        paramObservable = (AdobeAuthException)paramObservable.getInfo().get("Error");
        _loginClient.onError(paramObservable);
        return;
      }
      _loginClient.onSuccess(getUserProfile());
    }
  }
  
  static class LogoutObserver
    implements Observer
  {
    IAdobeAuthLogoutObserver _logoutClient = null;
    
    LogoutObserver(IAdobeAuthLogoutObserver paramIAdobeAuthLogoutObserver)
    {
      _logoutClient = paramIAdobeAuthLogoutObserver;
    }
    
    public void registerForLogout()
    {
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLogoutNotification, this);
    }
    
    public void unregisterForLogout()
    {
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeAuthLogoutNotification, this);
    }
    
    public void update(Observable paramObservable, Object paramObject)
    {
      paramObservable = (AdobeNotification)paramObject;
      if ((paramObservable.getInfo() != null) && (paramObservable.getInfo().get("Error") != null))
      {
        paramObservable = (AdobeAuthException)paramObservable.getInfo().get("Error");
        _logoutClient.onError(paramObservable);
        return;
      }
      _logoutClient.onSuccess();
    }
  }
}
