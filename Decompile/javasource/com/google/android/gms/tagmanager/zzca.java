package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;

public abstract class zzca
  extends zzak
{
  private static final String zzaPY = zzae.zzdz.toString();
  private static final String zzaQW = zzae.zzdA.toString();
  
  public zzca(String paramString)
  {
    super(paramString, new String[] { zzaPY, zzaQW });
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    Object localObject = paramMap.values().iterator();
    while (((Iterator)localObject).hasNext()) {
      if ((zzag.zza)((Iterator)localObject).next() == zzdf.zzBg()) {
        return zzdf.zzK(Boolean.valueOf(false));
      }
    }
    localObject = (zzag.zza)paramMap.get(zzaPY);
    zzag.zza localZza = (zzag.zza)paramMap.get(zzaQW);
    if ((localObject == null) || (localZza == null)) {}
    for (boolean bool = false;; bool = zza((zzag.zza)localObject, localZza, paramMap)) {
      return zzdf.zzK(Boolean.valueOf(bool));
    }
  }
  
  protected abstract boolean zza(zzag.zza paramZza1, zzag.zza paramZza2, Map<String, zzag.zza> paramMap);
  
  public boolean zzzx()
  {
    return true;
  }
}
