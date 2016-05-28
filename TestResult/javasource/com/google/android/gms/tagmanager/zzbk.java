package com.google.android.gms.tagmanager;

import android.content.Context;
import android.provider.Settings.Secure;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzag.zza;
import java.util.Map;

class zzbk
  extends zzak
{
  private static final String ID = zzad.zzbQ.toString();
  private final Context mContext;
  
  public zzbk(Context paramContext)
  {
    super(ID, new String[0]);
    mContext = paramContext;
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    paramMap = zzaN(mContext);
    if (paramMap == null) {
      return zzdf.zzBg();
    }
    return zzdf.zzK(paramMap);
  }
  
  protected String zzaN(Context paramContext)
  {
    return Settings.Secure.getString(paramContext.getContentResolver(), "android_id");
  }
  
  public boolean zzzx()
  {
    return true;
  }
}
