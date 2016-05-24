package com.adobe.creativesdk.foundation.internal.PushNotification.delegates;

public abstract interface IAdobeDeviceUnregisterCallback
{
  public abstract void onError();
  
  public abstract void onSuccess();
}
