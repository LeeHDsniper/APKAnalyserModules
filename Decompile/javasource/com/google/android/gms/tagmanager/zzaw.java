package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzaw
  extends zzak
{
  private static final String ID = zzad.zzbO.toString();
  private static final String zzaOJ = zzae.zzeb.toString();
  private final Context context;
  
  public zzaw(Context paramContext)
  {
    super(ID, new String[0]);
    context = paramContext;
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    if ((zzag.zza)paramMap.get(zzaOJ) != null) {}
    for (paramMap = zzdf.zzg((zzag.zza)paramMap.get(zzaOJ));; paramMap = null)
    {
      paramMap = zzax.zzk(context, paramMap);
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
