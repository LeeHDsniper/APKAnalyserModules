package com.google.android.gms.common.internal;

import android.content.Context;
import android.content.ServiceConnection;

public abstract class zzl
{
  private static final Object zzadT = new Object();
  private static zzl zzadU;
  
  public zzl() {}
  
  public static zzl zzak(Context paramContext)
  {
    synchronized (zzadT)
    {
      if (zzadU == null) {
        zzadU = new zzm(paramContext.getApplicationContext());
      }
      return zzadU;
    }
  }
  
  public abstract boolean zza(String paramString1, ServiceConnection paramServiceConnection, String paramString2);
  
  public abstract void zzb(String paramString1, ServiceConnection paramServiceConnection, String paramString2);
}
