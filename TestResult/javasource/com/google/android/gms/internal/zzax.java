package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import org.json.JSONObject;

@zzgk
public final class zzax
{
  private final String zzqH;
  private final JSONObject zzqI;
  private final String zzqJ;
  private final String zzqK;
  private final boolean zzqL;
  
  public zzax(String paramString1, VersionInfoParcel paramVersionInfoParcel, String paramString2, JSONObject paramJSONObject, boolean paramBoolean)
  {
    zzqK = zzIz;
    zzqI = paramJSONObject;
    zzqJ = paramString1;
    zzqH = paramString2;
    zzqL = paramBoolean;
  }
  
  public String zzbU()
  {
    return zzqH;
  }
  
  public String zzbV()
  {
    return zzqK;
  }
  
  public JSONObject zzbW()
  {
    return zzqI;
  }
  
  public String zzbX()
  {
    return zzqJ;
  }
  
  public boolean zzbY()
  {
    return zzqL;
  }
}
