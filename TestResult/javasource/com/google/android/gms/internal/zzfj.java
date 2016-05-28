package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import org.json.JSONObject;

@zzgk
public class zzfj
  extends Handler
{
  private final zzfi zzBD;
  
  public zzfj(Context paramContext)
  {
    this(new zzfk(paramContext));
  }
  
  public zzfj(zzfi paramZzfi)
  {
    zzBD = paramZzfi;
  }
  
  private void zzc(JSONObject paramJSONObject)
  {
    try
    {
      zzBD.zza(paramJSONObject.getString("request_id"), paramJSONObject.getString("base_url"), paramJSONObject.getString("html"));
      return;
    }
    catch (Exception paramJSONObject) {}
  }
  
  public void handleMessage(Message paramMessage)
  {
    try
    {
      paramMessage = paramMessage.getData();
      if (paramMessage == null) {
        return;
      }
      paramMessage = new JSONObject(paramMessage.getString("data"));
      if ("fetch_html".equals(paramMessage.getString("message_name")))
      {
        zzc(paramMessage);
        return;
      }
    }
    catch (Exception paramMessage) {}
  }
}
