package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzf
  extends zzak
{
  private static final String ID = zzad.zzbh.toString();
  private final Context mContext;
  
  public zzf(Context paramContext)
  {
    super(ID, new String[0]);
    mContext = paramContext;
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    return zzdf.zzK(mContext.getPackageName());
  }
  
  public boolean zzzx()
  {
    return true;
  }
}
