package com.adobe.creativesdk.foundation.internal.storage.model.services;

import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;

public abstract interface IAdobeStorageSessionQuotaCallback
  extends IAdobeGenericErrorCallback<AdobeCSDKException>
{
  public abstract void onCompletion(Number paramNumber1, Number paramNumber2, Number paramNumber3);
}
