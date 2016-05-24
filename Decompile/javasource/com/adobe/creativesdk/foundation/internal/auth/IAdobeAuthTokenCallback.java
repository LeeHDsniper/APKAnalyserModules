package com.adobe.creativesdk.foundation.internal.auth;

import com.adobe.creativesdk.foundation.internal.net.IAdobeNetworkCompletionHandler;

public abstract interface IAdobeAuthTokenCallback
  extends IAdobeNetworkCompletionHandler
{
  public abstract void onInvalidClientId();
  
  public abstract void onInvalidClientSecret();
  
  public abstract void onInvalidDeviceId();
}
