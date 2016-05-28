package com.adobe.creativesdk.foundation.internal.auth;

class AuthResultHandlerForSingleClient
  extends AuthResultHandler
{
  AuthResultHandlerForSingleClient() {}
  
  public void handleAuthCodeReceived(String paramString)
  {
    AdobeAuthIdentityManagementService.getSharedInstance().signInWithAuthCode(paramString, createImsClientCommon());
  }
  
  public void handleDeviceTokenReceived(String paramString)
  {
    AdobeAuthIdentityManagementService.getSharedInstance().signInWithDeviceToken(paramString, createImsClientCommon());
  }
  
  protected void performProcessQueuedResult(Object paramObject) {}
}
