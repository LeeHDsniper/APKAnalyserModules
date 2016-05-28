package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

abstract class zzbv
  extends zzca
{
  public zzbv(String paramString)
  {
    super(paramString);
  }
  
  protected boolean zza(zzag.zza paramZza1, zzag.zza paramZza2, Map<String, zzag.zza> paramMap)
  {
    paramZza1 = zzdf.zzh(paramZza1);
    paramZza2 = zzdf.zzh(paramZza2);
    if ((paramZza1 == zzdf.zzBe()) || (paramZza2 == zzdf.zzBe())) {
      return false;
    }
    return zza(paramZza1, paramZza2, paramMap);
  }
  
  protected abstract boolean zza(zzde paramZzde1, zzde paramZzde2, Map<String, zzag.zza> paramMap);
}
