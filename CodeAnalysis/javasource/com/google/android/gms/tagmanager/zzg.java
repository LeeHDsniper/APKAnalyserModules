package com.google.android.gms.tagmanager;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzg
  extends zzak
{
  private static final String ID = zzad.zzbi.toString();
  private final Context mContext;
  
  public zzg(Context paramContext)
  {
    super(ID, new String[0]);
    mContext = paramContext;
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    try
    {
      paramMap = mContext.getPackageManager();
      paramMap = zzdf.zzK(paramMap.getApplicationLabel(paramMap.getApplicationInfo(mContext.getPackageName(), 0)).toString());
      return paramMap;
    }
    catch (PackageManager.NameNotFoundException paramMap)
    {
      zzbg.zzb("App name is not found.", paramMap);
    }
    return zzdf.zzBg();
  }
  
  public boolean zzzx()
  {
    return true;
  }
}
