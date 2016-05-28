package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.util.client.zzb;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Future;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public class zzdl
  implements zzdg
{
  final HashMap<String, zzie<JSONObject>> zzxi = new HashMap();
  
  public zzdl() {}
  
  public Future<JSONObject> zzW(String paramString)
  {
    zzie localZzie = new zzie();
    zzxi.put(paramString, localZzie);
    return localZzie;
  }
  
  public void zzX(String paramString)
  {
    zzie localZzie = (zzie)zzxi.get(paramString);
    if (localZzie == null)
    {
      zzb.e("Could not find the ad request for the corresponding ad response.");
      return;
    }
    if (!localZzie.isDone()) {
      localZzie.cancel(true);
    }
    zzxi.remove(paramString);
  }
  
  public void zza(zzip paramZzip, Map<String, String> paramMap)
  {
    zze((String)paramMap.get("request_id"), (String)paramMap.get("fetched_ad"));
  }
  
  public void zze(String paramString1, String paramString2)
  {
    zzb.zzaC("Received ad from the cache.");
    zzie localZzie = (zzie)zzxi.get(paramString1);
    if (localZzie == null)
    {
      zzb.e("Could not find the ad request for the corresponding ad response.");
      return;
    }
    try
    {
      localZzie.zzf(new JSONObject(paramString2));
      return;
    }
    catch (JSONException paramString2)
    {
      zzb.zzb("Failed constructing JSON object from value passed from javascript", paramString2);
      localZzie.zzf(null);
      return;
    }
    finally
    {
      zzxi.remove(paramString1);
    }
  }
}
