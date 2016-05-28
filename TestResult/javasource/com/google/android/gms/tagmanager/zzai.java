package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzai
  extends zzak
{
  private static final String ID = zzad.zzbv.toString();
  private final zzcp zzaOU;
  
  public zzai(zzcp paramZzcp)
  {
    super(ID, new String[0]);
    zzaOU = paramZzcp;
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    paramMap = zzaOU.zzAF();
    if (paramMap == null) {
      return zzdf.zzBg();
    }
    return zzdf.zzK(paramMap);
  }
  
  public boolean zzzx()
  {
    return false;
  }
}
