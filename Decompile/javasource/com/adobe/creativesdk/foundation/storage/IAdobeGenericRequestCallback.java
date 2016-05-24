package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;

public abstract interface IAdobeGenericRequestCallback<T, ET>
  extends IAdobeGenericCompletionCallback<T>, IAdobeGenericErrorCallback<ET>, IAdobeCancelCallback, IAdobeProgressCallback
{}
