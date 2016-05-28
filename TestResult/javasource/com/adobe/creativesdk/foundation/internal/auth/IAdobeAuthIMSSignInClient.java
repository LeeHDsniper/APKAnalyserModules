package com.adobe.creativesdk.foundation.internal.auth;

import com.adobe.creativesdk.foundation.auth.AdobeAuthException;

public abstract interface IAdobeAuthIMSSignInClient
{
  public abstract void onError(AdobeAuthException paramAdobeAuthException);
  
  public abstract void onInfoNeeded(AdobeAuthIMSInfoNeeded paramAdobeAuthIMSInfoNeeded);
  
  public abstract void onSuccess(String paramString1, String paramString2);
}
