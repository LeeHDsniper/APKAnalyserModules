package com.adobe.creativesdk.foundation.internal.ans.delegates;

import org.json.JSONObject;

public abstract interface IAdobeNotificationQueryCallback
{
  public abstract void onError();
  
  public abstract void onSuccess(JSONObject paramJSONObject);
}
