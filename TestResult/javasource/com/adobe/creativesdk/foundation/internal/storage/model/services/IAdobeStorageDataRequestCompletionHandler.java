package com.adobe.creativesdk.foundation.internal.storage.model.services;

import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.IAdobeProgressCallback;

public abstract interface IAdobeStorageDataRequestCompletionHandler
  extends IAdobeGenericErrorCallback<AdobeAssetException>, IAdobeProgressCallback
{
  public abstract void onComplete(byte[] paramArrayOfByte);
}
