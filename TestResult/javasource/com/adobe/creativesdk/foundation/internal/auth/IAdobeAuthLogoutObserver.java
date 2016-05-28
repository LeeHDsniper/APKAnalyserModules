package com.adobe.creativesdk.foundation.internal.auth;

import com.adobe.creativesdk.foundation.auth.AdobeAuthException;

public abstract interface IAdobeAuthLogoutObserver
{
  public abstract void onError(AdobeAuthException paramAdobeAuthException);
  
  public abstract void onSuccess();
}
