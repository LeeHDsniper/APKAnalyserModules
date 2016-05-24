package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzb
  extends zzak
{
  private static final String ID = zzad.zzbf.toString();
  private final zza zzaOI;
  
  public zzb(Context paramContext)
  {
    this(zza.zzaL(paramContext));
  }
  
  zzb(zza paramZza)
  {
    super(ID, new String[0]);
    zzaOI = paramZza;
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    paramMap = zzaOI.zzzt();
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
