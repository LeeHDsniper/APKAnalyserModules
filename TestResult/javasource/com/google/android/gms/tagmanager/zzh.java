package com.google.android.gms.tagmanager;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzh
  extends zzak
{
  private static final String ID = zzad.zzbj.toString();
  private final Context mContext;
  
  public zzh(Context paramContext)
  {
    super(ID, new String[0]);
    mContext = paramContext;
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    try
    {
      paramMap = zzdf.zzK(Integer.valueOf(mContext.getPackageManager().getPackageInfo(mContext.getPackageName(), 0).versionCode));
      return paramMap;
    }
    catch (PackageManager.NameNotFoundException paramMap)
    {
      zzbg.e("Package name " + mContext.getPackageName() + " not found. " + paramMap.getMessage());
    }
    return zzdf.zzBg();
  }
  
  public boolean zzzx()
  {
    return true;
  }
}
