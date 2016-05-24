package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzn
  extends zzak
{
  private static final String ID = zzad.zzbl.toString();
  private static final String VALUE = zzae.zzhF.toString();
  
  public zzn()
  {
    super(ID, new String[] { VALUE });
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    return (zzag.zza)paramMap.get(VALUE);
  }
  
  public boolean zzzx()
  {
    return true;
  }
}
