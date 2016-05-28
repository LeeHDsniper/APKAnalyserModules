package com.google.android.gms.internal;

import android.os.Handler;
import java.util.concurrent.Executor;

public class zze
  implements zzn
{
  private final Executor zzs;
  
  public zze(final Handler paramHandler)
  {
    zzs = new Executor()
    {
      public void execute(Runnable paramAnonymousRunnable)
      {
        paramHandler.post(paramAnonymousRunnable);
      }
    };
  }
  
  public void zza(zzk<?> paramZzk, zzm<?> paramZzm)
  {
    zza(paramZzk, paramZzm, null);
  }
  
  public void zza(zzk<?> paramZzk, zzm<?> paramZzm, Runnable paramRunnable)
  {
    paramZzk.zzv();
    paramZzk.zzc("post-response");
    zzs.execute(new zza(paramZzk, paramZzm, paramRunnable));
  }
  
  public void zza(zzk<?> paramZzk, zzr paramZzr)
  {
    paramZzk.zzc("post-error");
    paramZzr = zzm.zzd(paramZzr);
    zzs.execute(new zza(paramZzk, paramZzr, null));
  }
  
  private class zza
    implements Runnable
  {
    private final zzk zzv;
    private final zzm zzw;
    private final Runnable zzx;
    
    public zza(zzk paramZzk, zzm paramZzm, Runnable paramRunnable)
    {
      zzv = paramZzk;
      zzw = paramZzm;
      zzx = paramRunnable;
    }
    
    public void run()
    {
      if (zzv.isCanceled()) {
        zzv.zzd("canceled-at-delivery");
      }
      label97:
      label107:
      for (;;)
      {
        return;
        if (zzw.isSuccess())
        {
          zzv.zza(zzw.result);
          if (!zzw.zzai) {
            break label97;
          }
          zzv.zzc("intermediate-response");
        }
        for (;;)
        {
          if (zzx == null) {
            break label107;
          }
          zzx.run();
          return;
          zzv.zzc(zzw.zzah);
          break;
          zzv.zzd("done");
        }
      }
    }
  }
}
