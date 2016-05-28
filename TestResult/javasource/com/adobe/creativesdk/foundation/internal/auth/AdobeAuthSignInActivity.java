package com.adobe.creativesdk.foundation.internal.auth;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.view.ViewCompat;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.widget.Toolbar;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.webkit.CookieManager;
import android.webkit.CookieSyncManager;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ProgressBar;
import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability;
import com.adobe.creativesdk.foundation.auth.AdobeAuthErrorCode;
import com.adobe.creativesdk.foundation.auth.AdobeAuthException;
import com.adobe.creativesdk.foundation.auth.R.id;
import com.adobe.creativesdk.foundation.auth.R.layout;
import com.adobe.creativesdk.foundation.auth.R.string;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonErrorViewFragment;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKActionBarController;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.net.URL;
import java.util.Observable;
import java.util.Observer;

public class AdobeAuthSignInActivity
  extends ActionBarActivity
{
  private static boolean _activityClosedDueToManualClose = false;
  private AdobeAuthSignInFragment _signInFragment;
  String signInFragmentTag = "SignInfragment";
  
  public AdobeAuthSignInActivity() {}
  
  public static void addNewAccountToAccountManager(AdobeCSDKAdobeIdAuthenticatorHelper.TokenDetails paramTokenDetails)
  {
    if ((deviceToken != null) && (adobeId != null))
    {
      Context localContext = AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext();
      AdobeCSDKAdobeIdAuthenticatorHelper.getInstance().addNewAccountDirectlyToAccountManager(localContext, paramTokenDetails, false);
    }
  }
  
  private AuthResultHandler createResultHandler()
  {
    if (shouldTrySharedToken()) {
      return new AuthResultHandlerForTryingSSO();
    }
    return new AuthResultHandlerForSingleClient();
  }
  
  public static boolean isLastActivityClosedDuetoManualClose()
  {
    return _activityClosedDueToManualClose;
  }
  
  private void prepareAndSendResult(AdobeAuthException paramAdobeAuthException)
  {
    Intent localIntent = new Intent();
    if (paramAdobeAuthException != null)
    {
      localIntent.putExtra("AdobeAuthErrorCode", paramAdobeAuthException.getErrorCode().getValue());
      if (paramAdobeAuthException.getErrorCode() == AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_USER_CANCELLED)
      {
        setResult(0, localIntent);
        sendResultBack(paramAdobeAuthException);
      }
    }
    else
    {
      localIntent.putExtra("AdobeAuthErrorCode", 0);
    }
    setResult(-1, localIntent);
    sendResultBack(paramAdobeAuthException);
  }
  
  static void sendResultBack(AdobeAuthException paramAdobeAuthException)
  {
    IAdobeAuthIMSSignInClient localIAdobeAuthIMSSignInClient = AdobeAuthManager.sharedAuthManager().getCurrentSignInClient();
    if (localIAdobeAuthIMSSignInClient != null)
    {
      if (paramAdobeAuthException != null) {
        localIAdobeAuthIMSSignInClient.onError(paramAdobeAuthException);
      }
    }
    else {
      return;
    }
    paramAdobeAuthException = AdobeAuthIdentityManagementService.getSharedInstance();
    localIAdobeAuthIMSSignInClient.onSuccess(paramAdobeAuthException.getAdobeID(), paramAdobeAuthException.getAccessToken());
  }
  
  private boolean shouldTrySharedToken()
  {
    return getIntent().getExtras().getBoolean("uxauth_trysharedtoken", false);
  }
  
  void handleResult(AdobeAuthException paramAdobeAuthException)
  {
    prepareAndSendResult(paramAdobeAuthException);
    finish();
  }
  
  public void noSharedAccountContinueNormalSignIn()
  {
    _signInFragment.trySignInViaSharedAdobeIdAuthToken(false);
    _signInFragment.performWork();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    boolean bool2 = true;
    boolean bool1 = true;
    _activityClosedDueToManualClose = false;
    if (!AdobeAuthManager.isInstanceCreated()) {
      finish();
    }
    AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().setApplicationContext(this);
    super.onCreate(paramBundle);
    setContentView(R.layout.adobe_ux_auth_activity_container_view);
    CookieSyncManager.createInstance(this);
    CookieManager.getInstance().removeAllCookie();
    setSupportActionBar((Toolbar)findViewById(R.id.actionbar_toolbar));
    paramBundle = getSupportActionBar();
    if (paramBundle != null)
    {
      paramBundle.setDisplayShowHomeEnabled(false);
      paramBundle.setDisplayHomeAsUpEnabled(false);
    }
    AdobeCSDKActionBarController.setTitle(findViewById(16908290), getString(R.string.adobe_auth_sign_in_close));
    AdobeCSDKActionBarController.getTextView(findViewById(16908290)).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AdobeAuthSignInActivity.access$002(true);
        AdobeAuthSignInActivity.this.prepareAndSendResult(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_USER_CANCELLED));
        finish();
      }
    });
    paramBundle = getSupportFragmentManager();
    AdobeAuthSignInFragment localAdobeAuthSignInFragment = (AdobeAuthSignInFragment)paramBundle.findFragmentByTag(signInFragmentTag);
    int i;
    if (localAdobeAuthSignInFragment == null)
    {
      localAdobeAuthSignInFragment = new AdobeAuthSignInFragment();
      _signInFragment = localAdobeAuthSignInFragment;
      AuthResultHandler localAuthResultHandler = createResultHandler();
      localAuthResultHandler.setAuthSingInActivity(this);
      localAdobeAuthSignInFragment.setSignInResultHandler(localAuthResultHandler);
      paramBundle.beginTransaction().add(R.id.creativesdk_foundation_auth_fragment_container, localAdobeAuthSignInFragment, signInFragmentTag).commit();
      i = getIntent().getExtras().getInt(AdobeAuthConstants.SIGN_IN_UI_TYPE, AdobeAuthConstants.AUTH_SESSION_TYPE_SIGN_IN);
      localAdobeAuthSignInFragment.setUIType(i);
      if ((shouldTrySharedToken()) && (i == AdobeAuthConstants.AUTH_SESSION_TYPE_SIGN_IN)) {
        localAdobeAuthSignInFragment.trySignInViaSharedAdobeIdAuthToken(bool1);
      }
    }
    do
    {
      return;
      bool1 = false;
      break;
      _signInFragment = localAdobeAuthSignInFragment;
      paramBundle = localAdobeAuthSignInFragment.getSignInResultHandler();
      if (paramBundle == null)
      {
        paramBundle = createResultHandler();
        paramBundle.setAuthSingInActivity(this);
        localAdobeAuthSignInFragment.setSignInResultHandler(paramBundle);
        i = getIntent().getExtras().getInt(AdobeAuthConstants.SIGN_IN_UI_TYPE, AdobeAuthConstants.AUTH_SESSION_TYPE_SIGN_IN);
        localAdobeAuthSignInFragment.setUIType(i);
        if ((shouldTrySharedToken()) && (i == AdobeAuthConstants.AUTH_SESSION_TYPE_SIGN_IN)) {}
        for (bool1 = bool2;; bool1 = false)
        {
          localAdobeAuthSignInFragment.trySignInViaSharedAdobeIdAuthToken(bool1);
          return;
        }
      }
      paramBundle.setAuthSingInActivity(this);
    } while (!paramBundle.hasAnyQueuedResult());
    paramBundle.processQueuedResult();
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    if (_signInFragment != null) {
      _signInFragment.getSignInResultHandler().setAuthSingInActivity(null);
    }
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 4)
    {
      AdobeAuthSignInFragment localAdobeAuthSignInFragment = (AdobeAuthSignInFragment)getSupportFragmentManager().findFragmentByTag(signInFragmentTag);
      if ((localAdobeAuthSignInFragment != null) && (localAdobeAuthSignInFragment.shouldHandleBackPressed()))
      {
        localAdobeAuthSignInFragment.handleBackPressed();
        return true;
      }
      prepareAndSendResult(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_USER_CANCELLED));
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (paramMenuItem.getItemId() == 16908332)
    {
      prepareAndSendResult(new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_USER_CANCELLED));
      onBackPressed();
    }
    return super.onOptionsItemSelected(paramMenuItem);
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
  }
  
  public static class AdobeAuthSignInFragment
    extends Fragment
  {
    private AuthResultHandler _authResultHandler;
    boolean _errorCondition;
    boolean _loaded = false;
    NetWorkObserver _netObserver = null;
    private AdobeNetworkReachability _netReachability = null;
    private SharedAdobeIdTokenAccessor _sharedAdobeIdTokenAccessor;
    private boolean _shouldTrySignInViaSharedAdobeIdAuthToken;
    int _uiType = AdobeAuthConstants.AUTH_SESSION_TYPE_SIGN_IN;
    private ViewGroup mAuthViewContainer;
    private WebView mAuthWebView;
    AdobeCommonErrorViewFragment mErrorFragment;
    private View mErrorView;
    private ProgressBar mProgressBar;
    
    public AdobeAuthSignInFragment() {}
    
    private void _cameOnline()
    {
      mErrorView.setVisibility(0);
      _hideError();
      _errorCondition = false;
      performWork();
      AdobeLogger.log(Level.INFO, "Authentication", " _cameOnline");
    }
    
    private void _hideError()
    {
      mErrorView.setVisibility(4);
    }
    
    private void _loadURL()
    {
      if (_loaded) {
        return;
      }
      _loaded = true;
      mAuthWebView.setVisibility(4);
      Object localObject = new AuthWebViewClient(this);
      ((AuthWebViewClient)localObject).setAuthResultHandler(_authResultHandler);
      mAuthWebView.setWebViewClient((WebViewClient)localObject);
      localObject = getSignInOrSignUpUrl();
      mAuthWebView.loadUrl(((URL)localObject).toString());
      AdobeLogger.log(Level.INFO, "Authentication", " Loading URL" + ((URL)localObject).toString());
    }
    
    private void _showError(String paramString)
    {
      if (paramString != null) {
        mErrorFragment.setMessage(paramString);
      }
      mErrorView.setVisibility(0);
    }
    
    private void _wentOffline()
    {
      _loaded = false;
      _showError(getString(R.string.adobe_common_error_view_no_internet_connection));
      AdobeLogger.log(Level.INFO, "Authentication", " _wentOffline");
    }
    
    private void performWork()
    {
      int j = 1;
      int i = j;
      if (shouldTrySignInThrouhgSharedAdobeIdAuthToken())
      {
        _sharedAdobeIdTokenAccessor = new SharedAdobeIdTokenAccessor();
        i = j;
        if (_sharedAdobeIdTokenAccessor.hasSharedAdobeIdAccount())
        {
          i = 0;
          _sharedAdobeIdTokenAccessor.tryGettingSharedTokenFromAccountManager();
        }
      }
      if (i != 0)
      {
        showWebviewWithSignInUpUrl();
        _loadURL();
      }
    }
    
    private void showWebviewWithSignInUpUrl()
    {
      if (mAuthWebView == null)
      {
        CookieManager.getInstance().removeAllCookie();
        mAuthWebView = new WebView(getActivity());
        mAuthWebView.setClipChildren(false);
        ViewCompat.setLayerType(mAuthWebView, 1, null);
        mAuthWebView.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        mAuthWebView.getSettings().setLoadWithOverviewMode(true);
        mAuthWebView.getSettings().setUseWideViewPort(true);
        mAuthWebView.getSettings().setBuiltInZoomControls(true);
        mAuthWebView.getSettings().setSupportZoom(true);
        mAuthWebView.getSettings().setJavaScriptEnabled(true);
        mAuthViewContainer.addView(mAuthWebView);
      }
    }
    
    URL getSignInOrSignUpUrl()
    {
      if (_uiType == AdobeAuthConstants.AUTH_SESSION_TYPE_SIGN_UP) {
        return AdobeAuthIdentityManagementService.getSharedInstance().getSignUpURL();
      }
      return AdobeAuthIdentityManagementService.getSharedInstance().getSignInURL();
    }
    
    public AuthResultHandler getSignInResultHandler()
    {
      return _authResultHandler;
    }
    
    public void handleBackPressed()
    {
      if (mAuthWebView != null) {
        mAuthWebView.goBack();
      }
    }
    
    void handleError()
    {
      if (!isAdded()) {
        return;
      }
      _loaded = false;
      _errorCondition = true;
      if (!_netReachability.isOnline())
      {
        _wentOffline();
        AdobeLogger.log(Level.INFO, "Authentication", " Handle error condition offline");
        return;
      }
      _showError(getString(R.string.adobe_common_error_view_unknown_authenticate_error));
      AdobeLogger.log(Level.INFO, "Authentication", " Webpage error");
    }
    
    public void onCreate(Bundle paramBundle)
    {
      super.onCreate(paramBundle);
      setRetainInstance(true);
    }
    
    public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
    {
      paramLayoutInflater = paramLayoutInflater.inflate(R.layout.adobe_ux_auth_fragment_view, paramViewGroup, false);
      if (shouldTrySignInThrouhgSharedAdobeIdAuthToken()) {
        _sharedAdobeIdTokenAccessor = new SharedAdobeIdTokenAccessor();
      }
      return paramLayoutInflater;
    }
    
    public void onDestroy()
    {
      super.onDestroy();
    }
    
    public void onDestroyView()
    {
      _netReachability = null;
      if (mAuthWebView != null) {
        mAuthViewContainer.removeView(mAuthWebView);
      }
      super.onDestroyView();
    }
    
    public void onSaveInstanceState(Bundle paramBundle)
    {
      super.onSaveInstanceState(paramBundle);
    }
    
    public void onStart()
    {
      super.onStart();
      _netObserver = new NetWorkObserver();
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeNetworkStatusChangeNotification, _netObserver);
      _netReachability.startNotification(getActivity());
      AdobeLogger.log(Level.INFO, "Authentication", "Started SignIn page");
    }
    
    public void onStop()
    {
      super.onStop();
      _netReachability.stopNotification();
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeNetworkStatusChangeNotification, _netObserver);
      _netObserver = null;
      AdobeLogger.log(Level.INFO, "Authentication", "Stopped SignIn page");
    }
    
    public void onViewCreated(View paramView, Bundle paramBundle)
    {
      super.onViewCreated(paramView, paramBundle);
      mAuthViewContainer = ((ViewGroup)paramView.findViewById(R.id.creativesdk_foundation_auth_webview_container));
      paramBundle = getFragmentManager();
      if (mAuthWebView != null) {
        mAuthViewContainer.addView(mAuthWebView);
      }
      if (!shouldTrySignInThrouhgSharedAdobeIdAuthToken()) {
        showWebviewWithSignInUpUrl();
      }
      mErrorFragment = new AdobeCommonErrorViewFragment();
      paramBundle.beginTransaction().replace(R.id.creativesdk_foundation_auth_signin_error, mErrorFragment).commit();
      mProgressBar = ((ProgressBar)paramView.findViewById(R.id.creativesdk_foundation_auth_progressBar));
      mErrorView = paramView.findViewById(R.id.creativesdk_foundation_auth_signin_error);
      _netReachability = AdobeNetworkReachability.createAndGetNetworkReachability();
    }
    
    public void onViewStateRestored(Bundle paramBundle)
    {
      super.onViewStateRestored(paramBundle);
    }
    
    void pageLoaded()
    {
      AdobeLogger.log(Level.INFO, "Authentication", " Page loaded");
      if (!_errorCondition)
      {
        mAuthWebView.setVisibility(0);
        mProgressBar.setVisibility(4);
        mErrorView.setVisibility(4);
        AdobeLogger.log(Level.INFO, "Authentication", " No Error Condition");
      }
    }
    
    public void setSignInResultHandler(AuthResultHandler paramAuthResultHandler)
    {
      _authResultHandler = paramAuthResultHandler;
    }
    
    public void setUIType(int paramInt)
    {
      _uiType = paramInt;
    }
    
    public boolean shouldHandleBackPressed()
    {
      return (mAuthWebView != null) && (mAuthWebView.getVisibility() == 0) && (mErrorView.getVisibility() != 0) && (mAuthWebView.canGoBack());
    }
    
    boolean shouldTrySignInThrouhgSharedAdobeIdAuthToken()
    {
      return _shouldTrySignInViaSharedAdobeIdAuthToken;
    }
    
    public void trySignInViaSharedAdobeIdAuthToken(boolean paramBoolean)
    {
      _shouldTrySignInViaSharedAdobeIdAuthToken = paramBoolean;
    }
    
    class NetWorkObserver
      implements Observer
    {
      NetWorkObserver() {}
      
      public void update(Observable paramObservable, Object paramObject)
      {
        if (((AdobeNotification)paramObject).getId() != AdobeInternalNotificationID.AdobeNetworkStatusChangeNotification)
        {
          AdobeLogger.log(Level.ERROR, "Authentication", "Expected a network status changed message!");
          return;
        }
        if (!_netReachability.isOnline())
        {
          AdobeAuthSignInActivity.AdobeAuthSignInFragment.this._wentOffline();
          return;
        }
        AdobeAuthSignInActivity.AdobeAuthSignInFragment.this._cameOnline();
      }
    }
    
    class SharedAdobeIdTokenAccessor
    {
      SharedAdobeIdTokenAccessor() {}
      
      private void handleAccountManagerTokenResult(AdobeCSDKAdobeIdAuthenticatorHelper.SharedAccountRequestResultData paramSharedAccountRequestResultData, boolean paramBoolean)
      {
        AuthResultHandlerForTryingSSO localAuthResultHandlerForTryingSSO = (AuthResultHandlerForTryingSSO)_authResultHandler;
        if (isRequestCancelled)
        {
          localAuthResultHandlerForTryingSSO.setAccountManagerRequestCancelled();
          return;
        }
        if ((tokenDetails != null) && (paramBoolean) && (AdobeCSDKAdobeIdAuthenticatorHelper.isSharedDeviceTokenExpired(tokenDetails)))
        {
          removeCurrentSharedAccount();
          tokenDetails = null;
        }
        localAuthResultHandlerForTryingSSO.handleSharedTokenRequestResult(tokenDetails);
      }
      
      private void removeCurrentSharedAccount()
      {
        AdobeCSDKAdobeIdAuthenticatorHelper.removeCurrentSharedAdobeIDFromAccountManager(getActivity());
      }
      
      Bundle getAuthenticatorOptions()
      {
        return null;
      }
      
      public boolean hasSharedAdobeIdAccount()
      {
        return AdobeCSDKAdobeIdAuthenticatorHelper.isAccountManagerHasSharedAdobeIdAccount(getActivity());
      }
      
      public void tryGettingSharedTokenFromAccountManager()
      {
        AdobeCSDKAdobeIdAuthenticatorHelper.getInstance().getSharedAdobeIdTokenFromAccountManager(getActivity(), getAuthenticatorOptions(), new AdobeCSDKAdobeIdAuthenticatorHelper.ICSDKAdobeIdAuthTokenResultHandler()
        {
          public void handleAuthenticatorTokenResult(AdobeCSDKAdobeIdAuthenticatorHelper.SharedAccountRequestResultData paramAnonymousSharedAccountRequestResultData)
          {
            AdobeAuthSignInActivity.AdobeAuthSignInFragment.SharedAdobeIdTokenAccessor.this.handleAccountManagerTokenResult(paramAnonymousSharedAccountRequestResultData, true);
          }
        });
      }
    }
  }
}
