package com.adobe.creativesdk.foundation.internal.net;

import com.adobe.creativesdk.foundation.network.AdobeNetworkException;

public abstract interface IAdobeNetworkCompletionHandler
{
  public abstract void onError(AdobeNetworkException paramAdobeNetworkException);
  
  public abstract void onSuccess(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse);
}
