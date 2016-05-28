package com.adobe.creativesdk.foundation.internal.auth;

import android.net.UrlQuerySanitizer;
import android.net.UrlQuerySanitizer.ParameterValuePair;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.adobe.creativesdk.foundation.auth.AdobeAuthErrorCode;
import com.adobe.creativesdk.foundation.auth.AdobeAuthException;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.util.List;

class AuthWebViewClient
  extends WebViewClient
{
  private AuthResultHandler _authClientResultHandler;
  String authorizationCode = "code";
  String deviceToken = "device_token";
  AdobeAuthSignInActivity.AdobeAuthSignInFragment signInView;
  
  public AuthWebViewClient(AdobeAuthSignInActivity.AdobeAuthSignInFragment paramAdobeAuthSignInFragment)
  {
    signInView = paramAdobeAuthSignInFragment;
  }
  
  private boolean handleOverrideUrlCommon(String paramString)
  {
    boolean bool = false;
    paramString = new UrlQuerySanitizer(paramString).getParameterList();
    int i = 0;
    if (i < paramString.size())
    {
      UrlQuerySanitizer.ParameterValuePair localParameterValuePair = (UrlQuerySanitizer.ParameterValuePair)paramString.get(i);
      if (mParameter.equals(authorizationCode))
      {
        _authClientResultHandler.handleAuthCodeReceived(mValue);
        bool = true;
      }
      for (;;)
      {
        i += 1;
        break;
        if (mParameter.equals(deviceToken))
        {
          _authClientResultHandler.handleDeviceTokenReceived(mValue);
          bool = true;
        }
      }
    }
    return bool;
  }
  
  public void onPageFinished(WebView paramWebView, String paramString)
  {
    AdobeLogger.log(Level.INFO, "Authentication", "onPageFinished:Webpage =" + paramString);
    signInView.pageLoaded();
  }
  
  public void onReceivedError(WebView paramWebView, int paramInt, String paramString1, String paramString2)
  {
    AdobeLogger.log(Level.ERROR, "Authentication", "onReceivedError:Webpage Error=" + paramString1 + " with webpage error " + paramInt);
    if ((paramInt == -1) && (paramString1.equals("net::ERR_CACHE_MISS")))
    {
      paramWebView = new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_USER_CANCELLED);
      _authClientResultHandler.handleResultFromIMS(paramWebView);
      return;
    }
    signInView.handleError();
  }
  
  public void setAuthResultHandler(AuthResultHandler paramAuthResultHandler)
  {
    _authClientResultHandler = paramAuthResultHandler;
  }
  
  public boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
  {
    return handleOverrideUrlCommon(paramString);
  }
}
