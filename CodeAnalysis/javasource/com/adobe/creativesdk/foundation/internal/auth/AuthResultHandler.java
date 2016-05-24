package com.adobe.creativesdk.foundation.internal.auth;

import com.adobe.creativesdk.foundation.auth.AdobeAuthErrorCode;
import com.adobe.creativesdk.foundation.auth.AdobeAuthException;

abstract class AuthResultHandler
{
  private boolean _hasQueuedResult = false;
  private Object _queuedResultData;
  protected AdobeAuthSignInActivity mAuthActivity;
  
  public AuthResultHandler() {}
  
  protected IAdobeAuthIMSSignInClient createImsClientCommon()
  {
    new IAdobeAuthIMSSignInClient()
    {
      public void onError(AdobeAuthException paramAnonymousAdobeAuthException)
      {
        handleResultFromIMS(paramAnonymousAdobeAuthException);
      }
      
      public void onInfoNeeded(AdobeAuthIMSInfoNeeded paramAnonymousAdobeAuthIMSInfoNeeded)
      {
        paramAnonymousAdobeAuthIMSInfoNeeded = new AdobeAuthException(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_USER_CANCELLED);
        handleResultFromIMS(paramAnonymousAdobeAuthIMSInfoNeeded);
      }
      
      public void onSuccess(String paramAnonymousString1, String paramAnonymousString2)
      {
        handleImsAccountResult(paramAnonymousString1, paramAnonymousString2);
        handleResultFromIMS(null);
      }
    };
  }
  
  public abstract void handleAuthCodeReceived(String paramString);
  
  public abstract void handleDeviceTokenReceived(String paramString);
  
  protected void handleImsAccountResult(String paramString1, String paramString2) {}
  
  protected void handleResultFromIMS(AdobeAuthException paramAdobeAuthException)
  {
    sentResultViaActivity(paramAdobeAuthException);
  }
  
  public boolean hasAnyQueuedResult()
  {
    return _hasQueuedResult;
  }
  
  protected abstract void performProcessQueuedResult(Object paramObject);
  
  public void processQueuedResult()
  {
    if (mAuthActivity == null) {
      return;
    }
    performProcessQueuedResult(_queuedResultData);
    resetQueuedData();
  }
  
  protected void resetQueuedData()
  {
    _hasQueuedResult = false;
    _queuedResultData = null;
  }
  
  protected void sentResultViaActivity(AdobeAuthException paramAdobeAuthException)
  {
    if (mAuthActivity == null)
    {
      AdobeAuthSignInActivity.sendResultBack(paramAdobeAuthException);
      return;
    }
    mAuthActivity.handleResult(paramAdobeAuthException);
  }
  
  public void setAuthSingInActivity(AdobeAuthSignInActivity paramAdobeAuthSignInActivity)
  {
    mAuthActivity = paramAdobeAuthSignInActivity;
  }
  
  protected void setQueuedResultData(Object paramObject)
  {
    _hasQueuedResult = true;
    _queuedResultData = paramObject;
  }
}
