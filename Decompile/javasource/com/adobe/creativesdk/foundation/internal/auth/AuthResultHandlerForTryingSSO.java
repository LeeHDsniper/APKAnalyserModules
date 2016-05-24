package com.adobe.creativesdk.foundation.internal.auth;

import com.adobe.creativesdk.foundation.auth.AdobeAuthErrorCode;
import com.adobe.creativesdk.foundation.auth.AdobeAuthException;

class AuthResultHandlerForTryingSSO
  extends AuthResultHandlerForSingleClient
{
  private boolean _forceReInitiateSignInDueToDeviceTokenImsFailure = false;
  private boolean _gotDeviceTokenFromSharedAccount = false;
  private TrySSOQueuedData _ssoData;
  
  public AuthResultHandlerForTryingSSO() {}
  
  private void performCommonTokenHandling(TrySSOQueuedData paramTrySSOQueuedData)
  {
    if ((tokenDetails != null) && (!_forceReInitiateSignInDueToDeviceTokenImsFailure))
    {
      handleDeviceTokenReceived(tokenDetails.deviceToken);
      return;
    }
    mAuthActivity.noSharedAccountContinueNormalSignIn();
  }
  
  protected void handleImsAccountResult(String paramString1, String paramString2)
  {
    if (!_gotDeviceTokenFromSharedAccount)
    {
      paramString1 = AdobeAuthIdentityManagementService.getSharedInstance();
      paramString2 = new AdobeCSDKAdobeIdAuthenticatorHelper.TokenDetails();
      adobeId = paramString1.getEmailAddress();
      deviceToken = paramString1.getDeviceToken();
      deviceExpirationTime = paramString1.getDeviceTokenExpirationTime();
      AdobeAuthSignInActivity.addNewAccountToAccountManager(paramString2);
    }
  }
  
  protected void handleResultFromIMS(AdobeAuthException paramAdobeAuthException)
  {
    int j = 0;
    int i = j;
    if (paramAdobeAuthException != null)
    {
      i = j;
      if (_ssoData != null)
      {
        i = j;
        if (_ssoData.tokenDetails != null)
        {
          i = j;
          if (paramAdobeAuthException.getErrorCode() != AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_OFFLINE) {
            if (mAuthActivity == null)
            {
              i = j;
              if (!AdobeAuthSignInActivity.isLastActivityClosedDuetoManualClose())
              {
                _forceReInitiateSignInDueToDeviceTokenImsFailure = true;
                setQueuedResultData(_ssoData);
              }
            }
            else
            {
              i = 1;
            }
          }
        }
      }
    }
    if (i != 0)
    {
      _gotDeviceTokenFromSharedAccount = false;
      mAuthActivity.noSharedAccountContinueNormalSignIn();
      return;
    }
    super.handleResultFromIMS(paramAdobeAuthException);
  }
  
  public void handleSharedTokenRequestResult(AdobeCSDKAdobeIdAuthenticatorHelper.TokenDetails paramTokenDetails)
  {
    if ((paramTokenDetails != null) && (deviceToken != null)) {
      _gotDeviceTokenFromSharedAccount = true;
    }
    TrySSOQueuedData localTrySSOQueuedData = new TrySSOQueuedData();
    tokenDetails = paramTokenDetails;
    _ssoData = localTrySSOQueuedData;
    if (mAuthActivity == null)
    {
      setQueuedResultData(localTrySSOQueuedData);
      return;
    }
    performCommonTokenHandling(localTrySSOQueuedData);
  }
  
  protected void performProcessQueuedResult(Object paramObject)
  {
    performCommonTokenHandling((TrySSOQueuedData)paramObject);
  }
  
  public void setAccountManagerRequestCancelled()
  {
    TrySSOQueuedData localTrySSOQueuedData = new TrySSOQueuedData();
    isRequesUserCancelled = true;
    if (mAuthActivity == null)
    {
      setQueuedResultData(localTrySSOQueuedData);
      return;
    }
    performCommonTokenHandling(localTrySSOQueuedData);
  }
}
