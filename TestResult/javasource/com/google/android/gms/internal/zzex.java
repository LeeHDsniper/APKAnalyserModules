package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import java.util.Map;

@zzgk
public class zzex
{
  private final zzip zzoL;
  private final boolean zzzD;
  private final String zzzE;
  
  public zzex(zzip paramZzip, Map<String, String> paramMap)
  {
    zzoL = paramZzip;
    zzzE = ((String)paramMap.get("forceOrientation"));
    if (paramMap.containsKey("allowOrientationChange"))
    {
      zzzD = Boolean.parseBoolean((String)paramMap.get("allowOrientationChange"));
      return;
    }
    zzzD = true;
  }
  
  public void execute()
  {
    if (zzoL == null)
    {
      zzb.zzaE("AdWebView is null");
      return;
    }
    int i;
    if ("portrait".equalsIgnoreCase(zzzE)) {
      i = zzp.zzbz().zzgw();
    }
    for (;;)
    {
      zzoL.setRequestedOrientation(i);
      return;
      if ("landscape".equalsIgnoreCase(zzzE)) {
        i = zzp.zzbz().zzgv();
      } else if (zzzD) {
        i = -1;
      } else {
        i = zzp.zzbz().zzgx();
      }
    }
  }
}
