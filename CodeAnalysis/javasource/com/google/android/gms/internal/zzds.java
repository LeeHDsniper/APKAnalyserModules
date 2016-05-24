package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.zzd;
import com.google.android.gms.ads.internal.zzp;
import java.util.Map;

@zzgk
public class zzds
  implements zzdg
{
  public zzds() {}
  
  public void zza(zzip paramZzip, Map<String, String> paramMap)
  {
    zzdq localZzdq = zzp.zzbK();
    if (paramMap.containsKey("abort"))
    {
      if (!localZzdq.zza(paramZzip)) {
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("Precache abort but no preload task running.");
      }
      return;
    }
    String str = (String)paramMap.get("src");
    if (str == null)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("Precache video action is missing the src parameter.");
      return;
    }
    try
    {
      i = Integer.parseInt((String)paramMap.get("player"));
      if (paramMap.containsKey("mimetype"))
      {
        paramMap = (String)paramMap.get("mimetype");
        if (!localZzdq.zzb(paramZzip)) {
          break label121;
        }
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("Precache task already running.");
      }
    }
    catch (NumberFormatException localNumberFormatException)
    {
      int i;
      for (;;)
      {
        i = 0;
        continue;
        paramMap = "";
      }
      label121:
      com.google.android.gms.common.internal.zzb.zzr(paramZzip.zzgP());
      new zzdp(paramZzip, zzgPzzoF.zza(paramZzip, i, paramMap), str).zzgn();
    }
  }
}
