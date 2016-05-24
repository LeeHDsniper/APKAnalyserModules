package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

abstract class zzcz
  extends zzca
{
  public zzcz(String paramString)
  {
    super(paramString);
  }
  
  protected boolean zza(zzag.zza paramZza1, zzag.zza paramZza2, Map<String, zzag.zza> paramMap)
  {
    paramZza1 = zzdf.zzg(paramZza1);
    paramZza2 = zzdf.zzg(paramZza2);
    if ((paramZza1 == zzdf.zzBf()) || (paramZza2 == zzdf.zzBf())) {
      return false;
    }
    return zza(paramZza1, paramZza2, paramMap);
  }
  
  protected abstract boolean zza(String paramString1, String paramString2, Map<String, zzag.zza> paramMap);
}
