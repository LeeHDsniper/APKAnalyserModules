package com.adobe.creativesdk.foundation.internal.storage.model.services;

import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceCollection;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;

public abstract interface IAdobeStorageCollectionRequestCompletionHandler
  extends IAdobeGenericErrorCallback<AdobeAssetException>
{
  public abstract void onComplete(AdobeStorageResourceCollection paramAdobeStorageResourceCollection);
}
