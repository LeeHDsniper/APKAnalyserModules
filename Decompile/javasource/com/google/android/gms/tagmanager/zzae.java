package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzae
  extends zzcz
{
  private static final String ID = zzad.zzcg.toString();
  
  public zzae()
  {
    super(ID);
  }
  
  protected boolean zza(String paramString1, String paramString2, Map<String, zzag.zza> paramMap)
  {
    return paramString1.endsWith(paramString2);
  }
}
