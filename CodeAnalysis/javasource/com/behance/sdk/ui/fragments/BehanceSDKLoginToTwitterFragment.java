package com.behance.sdk.ui.fragments;

import android.annotation.SuppressLint;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ProgressBar;
import android.widget.Toast;
import com.behance.sdk.BehanceSDKSocialAccountManager;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.asynctask.params.BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;
import com.behance.sdk.asynctask.params.BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;
import com.behance.sdk.asynctasks.result.BehanceSDKGetAuthUrlFromTwitterTaskResult;
import com.behance.sdk.asynctasks.result.BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;
import com.behance.sdk.dto.BehanceSDKSocialAccountDTO;
import com.behance.sdk.enums.BehanceSDKSocialAccountType;
import com.behance.sdk.fragments.headless.BehanceSDKLoginToTwitterHeadlessFragment;
import com.behance.sdk.fragments.headless.BehanceSDKLoginToTwitterHeadlessFragment.Callbacks;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;

public class BehanceSDKLoginToTwitterFragment
  extends Fragment
  implements BehanceSDKLoginToTwitterHeadlessFragment.Callbacks
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKLoginToTwitterFragment.class);
  private Callbacks callbacks;
  private ProgressBar progressBar;
  private View rootView;
  private BehanceSDKLoginToTwitterHeadlessFragment shareProjectOnTwitterHeadlessFragment;
  private Toast toastMessage;
  private BehanceSDKSocialAccountDTO twitterAccount;
  private WebView webview = null;
  private WebSettings webviewSettings = null;
  
  public BehanceSDKLoginToTwitterFragment() {}
  
  private void displayNoInternetConnectivity()
  {
    if (getActivity() != null)
    {
      toastMessage = Toast.makeText(getActivity(), "Please check internet connectivity", 1);
      toastMessage.setGravity(17, 0, 0);
      toastMessage.show();
      getActivity().setResult(2);
      getActivity().finishActivity(56789);
    }
  }
  
  private void getAuthURLFromTwitter()
  {
    String str1 = twitterAccount.getAccountClientId();
    String str2 = twitterAccount.getAccountClientSecret();
    if ((str1 != null) && (!str1.isEmpty()) && (str2 != null) && (!str2.isEmpty()))
    {
      BehanceSDKGetAuthURLFromTwitterAsyncTaskParams localBehanceSDKGetAuthURLFromTwitterAsyncTaskParams = new BehanceSDKGetAuthURLFromTwitterAsyncTaskParams();
      localBehanceSDKGetAuthURLFromTwitterAsyncTaskParams.setConsumerKey(str1);
      localBehanceSDKGetAuthURLFromTwitterAsyncTaskParams.setConsumerSecret(str2);
      shareProjectOnTwitterHeadlessFragment.getAuthURLFromTwitter(localBehanceSDKGetAuthURLFromTwitterAsyncTaskParams);
    }
  }
  
  private void hideProgressBar()
  {
    if (progressBar != null) {
      progressBar.setVisibility(4);
    }
  }
  
  private void retrieveTokenFromURLCallback(String paramString)
  {
    String str1 = twitterAccount.getAccountClientId();
    String str2 = twitterAccount.getAccountClientSecret();
    if ((str1 != null) && (!str1.isEmpty()) && (str2 != null) && (!str2.isEmpty()))
    {
      BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams localBehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams = new BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams();
      localBehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams.setConsumerKey(str1);
      localBehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams.setConsumerSecret(str2);
      localBehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams.setAuthURL(paramString);
      shareProjectOnTwitterHeadlessFragment.retrieveAccessTokenFromTwitter(localBehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams);
    }
  }
  
  public void onBackPressed()
  {
    if (getActivity() != null) {
      getActivity().finish();
    }
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
  }
  
  @SuppressLint({"SetJavaScriptEnabled"})
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    rootView = paramLayoutInflater.inflate(R.layout.bsdk_dialog_fragment_login_user_to_social_client, paramViewGroup, false);
    progressBar = ((ProgressBar)rootView.findViewById(R.id.bsdkLoginUserToSocialClientProgressBar));
    int i = 1;
    shareProjectOnTwitterHeadlessFragment = ((BehanceSDKLoginToTwitterHeadlessFragment)getActivity().getSupportFragmentManager().findFragmentByTag("HEADLESS_FRAGMENT_SHARE_PROJECT_ON_TWITTER"));
    if (shareProjectOnTwitterHeadlessFragment == null)
    {
      shareProjectOnTwitterHeadlessFragment = new BehanceSDKLoginToTwitterHeadlessFragment();
      getActivity().getSupportFragmentManager().beginTransaction().add(shareProjectOnTwitterHeadlessFragment, "HEADLESS_FRAGMENT_SHARE_PROJECT_ON_TWITTER").commit();
    }
    shareProjectOnTwitterHeadlessFragment.setCallbacks(this);
    paramLayoutInflater = ((ConnectivityManager)getActivity().getSystemService("connectivity")).getActiveNetworkInfo();
    if ((paramLayoutInflater == null) || (!paramLayoutInflater.isConnected()))
    {
      i = 0;
      displayNoInternetConnectivity();
    }
    twitterAccount = BehanceSDKSocialAccountManager.getInstance(getActivity()).getAccount(BehanceSDKSocialAccountType.TWITTER);
    webview = ((WebView)rootView.findViewById(R.id.bsdkLoginUserToSocialClientWebView));
    webviewSettings = webview.getSettings();
    webviewSettings.setSupportZoom(true);
    webviewSettings.setBuiltInZoomControls(true);
    webviewSettings.setUseWideViewPort(true);
    webviewSettings.setJavaScriptEnabled(true);
    webviewSettings.setLoadWithOverviewMode(true);
    if (i != 0) {
      getAuthURLFromTwitter();
    }
    return rootView;
  }
  
  public void onGetAuthURLFromTwitterFailure(Exception paramException)
  {
    if (getActivity() != null)
    {
      logger.error(paramException, "Problem retrieving auth URL from Twitter. [Error - %s]", new Object[] { paramException.getMessage() });
      if (callbacks != null) {
        callbacks.onTwitterAuthenticationFailure(paramException);
      }
    }
  }
  
  public void onGetAuthURLFromTwitterSuccess(BehanceSDKGetAuthUrlFromTwitterTaskResult paramBehanceSDKGetAuthUrlFromTwitterTaskResult)
  {
    if (getActivity() != null)
    {
      if ((paramBehanceSDKGetAuthUrlFromTwitterTaskResult.getAuthURL() != null) && (paramBehanceSDKGetAuthUrlFromTwitterTaskResult.getAuthURL().length() > 0)) {
        setWebViewforAuthorization(paramBehanceSDKGetAuthUrlFromTwitterTaskResult.getAuthURL());
      }
    }
    else {
      return;
    }
    logger.error("Problem retrieving auth URL. AUTH URL retrieved is null", new Object[0]);
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default: 
      return super.onOptionsItemSelected(paramMenuItem);
    }
    onBackPressed();
    return true;
  }
  
  public void onRetrieveAccessTokenFromTwitterFailure(Exception paramException)
  {
    if (getActivity() != null)
    {
      logger.error(paramException, "Problem retrieving access token and secret from Twitter. [Error - %s]", new Object[] { paramException.getMessage() });
      if (callbacks != null) {
        callbacks.onTwitterAuthenticationFailure(paramException);
      }
    }
  }
  
  public void onRetrieveAccessTokenFromTwitterSuccess(BehanceSDKRetrieveAccessTokenFromTwitterTaskResult paramBehanceSDKRetrieveAccessTokenFromTwitterTaskResult)
  {
    if ((getActivity() != null) && (callbacks != null)) {
      callbacks.onTwitterAuthenticationSuccess(paramBehanceSDKRetrieveAccessTokenFromTwitterTaskResult);
    }
  }
  
  public void setCallbacks(Callbacks paramCallbacks)
  {
    callbacks = paramCallbacks;
  }
  
  public void setWebViewforAuthorization(String paramString)
  {
    hideProgressBar();
    webview.setWebViewClient(new WebViewClient()
    {
      public void onReceivedError(WebView paramAnonymousWebView, int paramAnonymousInt, String paramAnonymousString1, String paramAnonymousString2)
      {
        super.onReceivedError(paramAnonymousWebView, paramAnonymousInt, paramAnonymousString1, paramAnonymousString2);
        BehanceSDKLoginToTwitterFragment.this.displayNoInternetConnectivity();
      }
      
      public boolean shouldOverrideUrlLoading(WebView paramAnonymousWebView, String paramAnonymousString)
      {
        if ((paramAnonymousString != null) && (paramAnonymousString.startsWith("com.behance.behance://oauth.callback")))
        {
          BehanceSDKLoginToTwitterFragment.this.retrieveTokenFromURLCallback(paramAnonymousString);
          paramAnonymousWebView.setVisibility(8);
          return true;
        }
        return false;
      }
    });
    webview.loadUrl(paramString);
  }
  
  public static abstract interface Callbacks
  {
    public abstract void onTwitterAuthenticationFailure(Exception paramException);
    
    public abstract void onTwitterAuthenticationSuccess(BehanceSDKRetrieveAccessTokenFromTwitterTaskResult paramBehanceSDKRetrieveAccessTokenFromTwitterTaskResult);
  }
}
