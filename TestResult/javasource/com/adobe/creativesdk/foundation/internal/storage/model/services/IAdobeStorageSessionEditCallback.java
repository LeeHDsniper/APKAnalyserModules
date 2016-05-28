package com.adobe.creativesdk.foundation.internal.storage.model.services;

import com.adobe.creativesdk.foundation.storage.AdobeAssetException;

public abstract interface IAdobeStorageSessionEditCallback
{
  public abstract void onComplete();
  
  public abstract void onError(AdobeAssetException paramAdobeAssetException);
}
