package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzq
  extends zzak
{
  private static final String ID = zzad.zzbo.toString();
  private final String zzWs;
  
  public zzq(String paramString)
  {
    super(ID, new String[0]);
    zzWs = paramString;
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    if (zzWs == null) {
      return zzdf.zzBg();
    }
    return zzdf.zzK(zzWs);
  }
  
  public boolean zzzx()
  {
    return true;
  }
}
