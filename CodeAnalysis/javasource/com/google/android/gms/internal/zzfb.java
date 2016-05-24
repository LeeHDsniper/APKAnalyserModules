package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.util.client.zzb;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public class zzfb
{
  private final zzip zzoL;
  private final String zzzX;
  
  public zzfb(zzip paramZzip)
  {
    this(paramZzip, "");
  }
  
  public zzfb(zzip paramZzip, String paramString)
  {
    zzoL = paramZzip;
    zzzX = paramString;
  }
  
  public void zza(int paramInt1, int paramInt2, int paramInt3, int paramInt4, float paramFloat, int paramInt5)
  {
    try
    {
      JSONObject localJSONObject = new JSONObject().put("width", paramInt1).put("height", paramInt2).put("maxSizeWidth", paramInt3).put("maxSizeHeight", paramInt4).put("density", paramFloat).put("rotation", paramInt5);
      zzoL.zzb("onScreenInfoChanged", localJSONObject);
      return;
    }
    catch (JSONException localJSONException)
    {
      zzb.zzb("Error occured while obtaining screen information.", localJSONException);
    }
  }
  
  public void zzah(String paramString)
  {
    try
    {
      paramString = new JSONObject().put("message", paramString).put("action", zzzX);
      zzoL.zzb("onError", paramString);
      return;
    }
    catch (JSONException paramString)
    {
      zzb.zzb("Error occurred while dispatching error event.", paramString);
    }
  }
  
  public void zzai(String paramString)
  {
    try
    {
      paramString = new JSONObject().put("js", paramString);
      zzoL.zzb("onReadyEventReceived", paramString);
      return;
    }
    catch (JSONException paramString)
    {
      zzb.zzb("Error occured while dispatching ready Event.", paramString);
    }
  }
  
  public void zzaj(String paramString)
  {
    try
    {
      paramString = new JSONObject().put("state", paramString);
      zzoL.zzb("onStateChanged", paramString);
      return;
    }
    catch (JSONException paramString)
    {
      zzb.zzb("Error occured while dispatching state change.", paramString);
    }
  }
  
  public void zzb(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    try
    {
      JSONObject localJSONObject = new JSONObject().put("x", paramInt1).put("y", paramInt2).put("width", paramInt3).put("height", paramInt4);
      zzoL.zzb("onSizeChanged", localJSONObject);
      return;
    }
    catch (JSONException localJSONException)
    {
      zzb.zzb("Error occured while dispatching size change.", localJSONException);
    }
  }
  
  public void zzc(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    try
    {
      JSONObject localJSONObject = new JSONObject().put("x", paramInt1).put("y", paramInt2).put("width", paramInt3).put("height", paramInt4);
      zzoL.zzb("onDefaultPositionReceived", localJSONObject);
      return;
    }
    catch (JSONException localJSONException)
    {
      zzb.zzb("Error occured while dispatching default position.", localJSONException);
    }
  }
}
