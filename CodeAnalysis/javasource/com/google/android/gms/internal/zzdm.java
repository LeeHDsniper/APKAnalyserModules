package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zze;
import java.util.HashMap;
import java.util.Map;

@zzgk
public class zzdm
  implements zzdg
{
  static final Map<String, Integer> zzxl = new HashMap();
  private final zze zzxj;
  private final zzew zzxk;
  
  static
  {
    zzxl.put("resize", Integer.valueOf(1));
    zzxl.put("playVideo", Integer.valueOf(2));
    zzxl.put("storePicture", Integer.valueOf(3));
    zzxl.put("createCalendarEvent", Integer.valueOf(4));
    zzxl.put("setOrientationProperties", Integer.valueOf(5));
    zzxl.put("closeResizedAd", Integer.valueOf(6));
  }
  
  public zzdm(zze paramZze, zzew paramZzew)
  {
    zzxj = paramZze;
    zzxk = paramZzew;
  }
  
  public void zza(zzip paramZzip, Map<String, String> paramMap)
  {
    String str = (String)paramMap.get("a");
    int i = ((Integer)zzxl.get(str)).intValue();
    if ((i != 5) && (zzxj != null) && (!zzxj.zzbe()))
    {
      zzxj.zzp(null);
      return;
    }
    switch (i)
    {
    case 2: 
    default: 
      zzb.zzaD("Unknown MRAID command called.");
      return;
    case 1: 
      zzxk.zzg(paramMap);
      return;
    case 4: 
      new zzev(paramZzip, paramMap).execute();
      return;
    case 3: 
      new zzey(paramZzip, paramMap).execute();
      return;
    case 5: 
      new zzex(paramZzip, paramMap).execute();
      return;
    }
    zzxk.zzn(true);
  }
}
