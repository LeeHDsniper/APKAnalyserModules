package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzcc
  extends zzak
{
  private static final String ID = zzad.zzbB.toString();
  private static final String zzaRg = zzae.zzfP.toString();
  private static final String zzaRh = zzae.zzfN.toString();
  
  public zzcc()
  {
    super(ID, new String[0]);
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    Object localObject = (zzag.zza)paramMap.get(zzaRg);
    paramMap = (zzag.zza)paramMap.get(zzaRh);
    double d2;
    double d1;
    if ((localObject != null) && (localObject != zzdf.zzBg()) && (paramMap != null) && (paramMap != zzdf.zzBg()))
    {
      localObject = zzdf.zzh((zzag.zza)localObject);
      paramMap = zzdf.zzh(paramMap);
      if ((localObject != zzdf.zzBe()) && (paramMap != zzdf.zzBe()))
      {
        d2 = ((zzde)localObject).doubleValue();
        d1 = paramMap.doubleValue();
        if (d2 > d1) {}
      }
    }
    for (;;)
    {
      return zzdf.zzK(Long.valueOf(Math.round((d1 - d2) * Math.random() + d2)));
      d1 = 2.147483647E9D;
      d2 = 0.0D;
    }
  }
  
  public boolean zzzx()
  {
    return false;
  }
}
