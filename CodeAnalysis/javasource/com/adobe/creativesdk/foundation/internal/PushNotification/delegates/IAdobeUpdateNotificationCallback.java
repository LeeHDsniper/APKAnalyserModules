package com.adobe.creativesdk.foundation.internal.PushNotification.delegates;

import org.json.JSONObject;

public abstract interface IAdobeUpdateNotificationCallback
{
  public abstract void onError();
  
  public abstract void onSuccess(JSONObject paramJSONObject);
}
