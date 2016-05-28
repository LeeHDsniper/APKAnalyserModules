package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.util.client.zzb;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public class zzez
{
  private final boolean zzzI;
  private final boolean zzzJ;
  private final boolean zzzK;
  private final boolean zzzL;
  private final boolean zzzM;
  
  private zzez(zza paramZza)
  {
    zzzI = zza.zza(paramZza);
    zzzJ = zza.zzb(paramZza);
    zzzK = zza.zzc(paramZza);
    zzzL = zza.zzd(paramZza);
    zzzM = zza.zze(paramZza);
  }
  
  public JSONObject toJson()
  {
    try
    {
      JSONObject localJSONObject = new JSONObject().put("sms", zzzI).put("tel", zzzJ).put("calendar", zzzK).put("storePicture", zzzL).put("inlineVideo", zzzM);
      return localJSONObject;
    }
    catch (JSONException localJSONException)
    {
      zzb.zzb("Error occured while obtaining the MRAID capabilities.", localJSONException);
    }
    return null;
  }
  
  public static final class zza
  {
    private boolean zzzI;
    private boolean zzzJ;
    private boolean zzzK;
    private boolean zzzL;
    private boolean zzzM;
    
    public zza() {}
    
    public zzez zzea()
    {
      return new zzez(this, null);
    }
    
    public zza zzo(boolean paramBoolean)
    {
      zzzI = paramBoolean;
      return this;
    }
    
    public zza zzp(boolean paramBoolean)
    {
      zzzJ = paramBoolean;
      return this;
    }
    
    public zza zzq(boolean paramBoolean)
    {
      zzzK = paramBoolean;
      return this;
    }
    
    public zza zzr(boolean paramBoolean)
    {
      zzzL = paramBoolean;
      return this;
    }
    
    public zza zzs(boolean paramBoolean)
    {
      zzzM = paramBoolean;
      return this;
    }
  }
}
