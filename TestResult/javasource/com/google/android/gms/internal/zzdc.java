package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.util.client.zzb;
import java.util.Map;

@zzgk
public final class zzdc
  implements zzdg
{
  private final zzdd zzwH;
  
  public zzdc(zzdd paramZzdd)
  {
    zzwH = paramZzdd;
  }
  
  public void zza(zzip paramZzip, Map<String, String> paramMap)
  {
    paramZzip = (String)paramMap.get("name");
    if (paramZzip == null)
    {
      zzb.zzaE("App event with no name parameter.");
      return;
    }
    zzwH.onAppEvent(paramZzip, (String)paramMap.get("info"));
  }
}
