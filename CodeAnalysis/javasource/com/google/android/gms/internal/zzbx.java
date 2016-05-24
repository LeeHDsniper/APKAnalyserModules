package com.google.android.gms.internal;

import android.content.Context;
import android.content.SharedPreferences;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.common.GooglePlayServicesUtil;

@zzgk
public class zzbx
{
  private final Object zzpc = new Object();
  private boolean zzpr = false;
  private SharedPreferences zztU = null;
  
  public zzbx() {}
  
  public <T> T zzd(zzbu<T> paramZzbu)
  {
    synchronized (zzpc)
    {
      if (!zzpr)
      {
        paramZzbu = paramZzbu.zzdd();
        return paramZzbu;
      }
      return paramZzbu.zza(zztU);
    }
  }
  
  public void zzw(Context paramContext)
  {
    synchronized (zzpc)
    {
      if (zzpr) {
        return;
      }
      paramContext = GooglePlayServicesUtil.getRemoteContext(paramContext);
      if (paramContext == null) {
        return;
      }
    }
    zztU = zzp.zzbE().zzv(paramContext);
    zzpr = true;
  }
}
