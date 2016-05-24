package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzv
  extends zzak
{
  private static final String ID = zzad.zzbn.toString();
  private static final String NAME = zzae.zzfR.toString();
  private static final String zzaPI = zzae.zzeC.toString();
  private final DataLayer zzaOT;
  
  public zzv(DataLayer paramDataLayer)
  {
    super(ID, new String[] { NAME });
    zzaOT = paramDataLayer;
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    Object localObject = zzaOT.get(zzdf.zzg((zzag.zza)paramMap.get(NAME)));
    if (localObject == null)
    {
      paramMap = (zzag.zza)paramMap.get(zzaPI);
      if (paramMap != null) {
        return paramMap;
      }
      return zzdf.zzBg();
    }
    return zzdf.zzK(localObject);
  }
  
  public boolean zzzx()
  {
    return false;
  }
}
