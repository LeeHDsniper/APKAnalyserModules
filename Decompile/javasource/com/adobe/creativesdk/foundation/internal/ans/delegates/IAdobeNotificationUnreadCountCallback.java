package com.adobe.creativesdk.foundation.internal.ans.delegates;

public abstract interface IAdobeNotificationUnreadCountCallback
{
  public abstract void onError();
  
  public abstract void onSuccess(int paramInt);
}
