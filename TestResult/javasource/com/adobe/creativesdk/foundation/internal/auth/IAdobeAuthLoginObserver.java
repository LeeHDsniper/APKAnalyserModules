package com.adobe.creativesdk.foundation.internal.auth;

import com.adobe.creativesdk.foundation.auth.AdobeAuthException;
import com.adobe.creativesdk.foundation.auth.AdobeAuthUserProfile;

public abstract interface IAdobeAuthLoginObserver
{
  public abstract void onError(AdobeAuthException paramAdobeAuthException);
  
  public abstract void onSuccess(AdobeAuthUserProfile paramAdobeAuthUserProfile);
}
