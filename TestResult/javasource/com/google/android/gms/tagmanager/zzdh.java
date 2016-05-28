package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzdh
  extends zzak
{
  private static final String ID = zzad.zzbU.toString();
  private static final String zzaPY = zzae.zzdz.toString();
  
  public zzdh()
  {
    super(ID, new String[] { zzaPY });
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    return zzdf.zzK(zzdf.zzg((zzag.zza)paramMap.get(zzaPY)).toUpperCase());
  }
  
  public boolean zzzx()
  {
    return true;
  }
}
