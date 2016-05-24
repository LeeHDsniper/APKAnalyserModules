package com.google.android.gms.tagmanager;

import android.os.Build.VERSION;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzbx
  extends zzak
{
  private static final String ID = zzad.zzbz.toString();
  
  public zzbx()
  {
    super(ID, new String[0]);
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    return zzdf.zzK(Build.VERSION.RELEASE);
  }
  
  public boolean zzzx()
  {
    return true;
  }
}
