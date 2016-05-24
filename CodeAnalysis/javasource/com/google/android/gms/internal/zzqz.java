package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.tagmanager.zzbg;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

public class zzqz
{
  private boolean mClosed;
  private String zzaPw = null;
  private final ScheduledExecutorService zzaRr;
  private ScheduledFuture<?> zzaRt = null;
  
  public zzqz()
  {
    this(Executors.newSingleThreadScheduledExecutor());
  }
  
  public zzqz(String paramString)
  {
    this(Executors.newSingleThreadScheduledExecutor());
    zzaPw = paramString;
  }
  
  zzqz(ScheduledExecutorService paramScheduledExecutorService)
  {
    zzaRr = paramScheduledExecutorService;
    mClosed = false;
  }
  
  public void zza(Context paramContext, zzqn paramZzqn, long paramLong, zzqx paramZzqx)
  {
    for (;;)
    {
      try
      {
        zzbg.v("ResourceLoaderScheduler: Loading new resource.");
        if (zzaRt != null) {
          return;
        }
        if (zzaPw != null)
        {
          paramContext = new zzqy(paramContext, paramZzqn, paramZzqx, zzaPw);
          zzaRt = zzaRr.schedule(paramContext, paramLong, TimeUnit.MILLISECONDS);
          return;
        }
      }
      finally {}
      paramContext = new zzqy(paramContext, paramZzqn, paramZzqx);
    }
  }
}
