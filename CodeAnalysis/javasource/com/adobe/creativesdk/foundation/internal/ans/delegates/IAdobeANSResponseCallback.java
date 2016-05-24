package com.adobe.creativesdk.foundation.internal.ans.delegates;

import com.adobe.creativesdk.foundation.network.AdobeNetworkException;
import org.json.JSONObject;

public abstract interface IAdobeANSResponseCallback
{
  public abstract void onError(AdobeNetworkException paramAdobeNetworkException);
  
  public abstract void onSuccess(JSONObject paramJSONObject);
}
