package com.google.android.gms.analytics.internal;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzlm;
import com.google.android.gms.internal.zzof;

abstract class zzt
{
  private static volatile Handler zzMR;
  private final zzf zzLy;
  private volatile long zzMS;
  private boolean zzMT;
  private final Runnable zzx;
  
  zzt(zzf paramZzf)
  {
    zzx.zzv(paramZzf);
    zzLy = paramZzf;
    zzx = new Runnable()
    {
      public void run()
      {
        if (Looper.myLooper() == Looper.getMainLooper()) {
          zzt.zza(zzt.this).zzig().zzf(this);
        }
        boolean bool;
        do
        {
          return;
          bool = zzbr();
          zzt.zza(zzt.this, 0L);
        } while ((!bool) || (zzt.zzb(zzt.this)));
        zzt.this.run();
      }
    };
  }
  
  private Handler getHandler()
  {
    if (zzMR != null) {
      return zzMR;
    }
    try
    {
      if (zzMR == null) {
        zzMR = new Handler(zzLy.getContext().getMainLooper());
      }
      Handler localHandler = zzMR;
      return localHandler;
    }
    finally {}
  }
  
  public void cancel()
  {
    zzMS = 0L;
    getHandler().removeCallbacks(zzx);
  }
  
  public abstract void run();
  
  public boolean zzbr()
  {
    return zzMS != 0L;
  }
  
  public long zzjR()
  {
    if (zzMS == 0L) {
      return 0L;
    }
    return Math.abs(zzLy.zzid().currentTimeMillis() - zzMS);
  }
  
  public void zzt(long paramLong)
  {
    cancel();
    if (paramLong >= 0L)
    {
      zzMS = zzLy.zzid().currentTimeMillis();
      if (!getHandler().postDelayed(zzx, paramLong)) {
        zzLy.zzie().zze("Failed to schedule delayed post. time", Long.valueOf(paramLong));
      }
    }
  }
  
  public void zzu(long paramLong)
  {
    long l = 0L;
    if (!zzbr()) {
      return;
    }
    if (paramLong < 0L)
    {
      cancel();
      return;
    }
    paramLong -= Math.abs(zzLy.zzid().currentTimeMillis() - zzMS);
    if (paramLong < 0L) {
      paramLong = l;
    }
    for (;;)
    {
      getHandler().removeCallbacks(zzx);
      if (getHandler().postDelayed(zzx, paramLong)) {
        break;
      }
      zzLy.zzie().zze("Failed to adjust delayed post. time", Long.valueOf(paramLong));
      return;
    }
  }
}
