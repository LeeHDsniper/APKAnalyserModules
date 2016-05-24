package com.adobe.creativesdk.foundation.internal.PushNotification.delegates;

import org.json.JSONObject;

public abstract interface IAdobeDeviceRegistrationCallback
{
  public abstract void onError();
  
  public abstract void onSuccess(JSONObject paramJSONObject);
}
