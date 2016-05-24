package com.google.android.gms.internal;

import java.util.Map;

@zzgk
public class zzdj
  implements zzdg
{
  private final zzdk zzxh;
  
  public zzdj(zzdk paramZzdk)
  {
    zzxh = paramZzdk;
  }
  
  public void zza(zzip paramZzip, Map<String, String> paramMap)
  {
    boolean bool = "1".equals(paramMap.get("transparentBackground"));
    zzxh.zzd(bool);
  }
}
