package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zze
  extends zzak
{
  private static final String ID = zzad.zzbJ.toString();
  private static final String zzaOJ = zzae.zzeb.toString();
  private static final String zzaOK = zzae.zzee.toString();
  private final Context context;
  
  public zze(Context paramContext)
  {
    super(ID, new String[] { zzaOK });
    context = paramContext;
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    Object localObject = (zzag.zza)paramMap.get(zzaOK);
    if (localObject == null) {
      return zzdf.zzBg();
    }
    localObject = zzdf.zzg((zzag.zza)localObject);
    paramMap = (zzag.zza)paramMap.get(zzaOJ);
    if (paramMap != null) {}
    for (paramMap = zzdf.zzg(paramMap);; paramMap = null)
    {
      paramMap = zzax.zzg(context, (String)localObject, paramMap);
      if (paramMap == null) {
        break;
      }
      return zzdf.zzK(paramMap);
    }
    return zzdf.zzBg();
  }
  
  public boolean zzzx()
  {
    return true;
  }
}
