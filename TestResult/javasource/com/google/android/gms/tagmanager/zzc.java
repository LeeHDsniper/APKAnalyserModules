package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzc
  extends zzak
{
  private static final String ID = zzad.zzbg.toString();
  private final zza zzaOI;
  
  public zzc(Context paramContext)
  {
    this(zza.zzaL(paramContext));
  }
  
  zzc(zza paramZza)
  {
    super(ID, new String[0]);
    zzaOI = paramZza;
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    if (!zzaOI.isLimitAdTrackingEnabled()) {}
    for (boolean bool = true;; bool = false) {
      return zzdf.zzK(Boolean.valueOf(bool));
    }
  }
  
  public boolean zzzx()
  {
    return false;
  }
}
