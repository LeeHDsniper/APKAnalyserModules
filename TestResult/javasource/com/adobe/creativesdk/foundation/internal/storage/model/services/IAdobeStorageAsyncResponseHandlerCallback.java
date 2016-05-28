package com.adobe.creativesdk.foundation.internal.storage.model.services;

import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpResponse;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException;

public abstract interface IAdobeStorageAsyncResponseHandlerCallback
{
  public abstract void onComplete(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse);
  
  public abstract void onError(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse);
  
  public abstract void onError(AdobeNetworkException paramAdobeNetworkException);
}
