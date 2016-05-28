package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

class zzx
  extends zzdd
{
  private static final String ID = zzad.zzbS.toString();
  private static final String VALUE = zzae.zzhF.toString();
  private static final String zzaPT = zzae.zzdW.toString();
  private final DataLayer zzaOT;
  
  public zzx(DataLayer paramDataLayer)
  {
    super(ID, new String[] { VALUE });
    zzaOT = paramDataLayer;
  }
  
  private void zza(zzag.zza paramZza)
  {
    if ((paramZza == null) || (paramZza == zzdf.zzBa())) {}
    do
    {
      return;
      paramZza = zzdf.zzg(paramZza);
    } while (paramZza == zzdf.zzBf());
    zzaOT.zzeC(paramZza);
  }
  
  private void zzb(zzag.zza paramZza)
  {
    if ((paramZza == null) || (paramZza == zzdf.zzBa())) {}
    for (;;)
    {
      return;
      paramZza = zzdf.zzl(paramZza);
      if ((paramZza instanceof List))
      {
        paramZza = ((List)paramZza).iterator();
        while (paramZza.hasNext())
        {
          Object localObject = paramZza.next();
          if ((localObject instanceof Map))
          {
            localObject = (Map)localObject;
            zzaOT.push((Map)localObject);
          }
        }
      }
    }
  }
  
  public void zzI(Map<String, zzag.zza> paramMap)
  {
    zzb((zzag.zza)paramMap.get(VALUE));
    zza((zzag.zza)paramMap.get(zzaPT));
  }
}
