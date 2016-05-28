package com.google.android.gms.internal;

import android.os.Process;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

@zzgk
public final class zzht
{
  private static final ExecutorService zzHy = Executors.newFixedThreadPool(10, zzav("Default"));
  private static final ExecutorService zzHz = Executors.newFixedThreadPool(5, zzav("Loader"));
  
  public static zzih<Void> zza(int paramInt, Runnable paramRunnable)
  {
    if (paramInt == 1) {
      zza(zzHz, new Callable()
      {
        public Void zzgp()
        {
          zzHA.run();
          return null;
        }
      });
    }
    zza(zzHy, new Callable()
    {
      public Void zzgp()
      {
        zzHA.run();
        return null;
      }
    });
  }
  
  public static zzih<Void> zza(Runnable paramRunnable)
  {
    return zza(0, paramRunnable);
  }
  
  public static <T> zzih<T> zza(Callable<T> paramCallable)
  {
    return zza(zzHy, paramCallable);
  }
  
  public static <T> zzih<T> zza(ExecutorService paramExecutorService, final Callable<T> paramCallable)
  {
    zzie localZzie = new zzie();
    try
    {
      paramExecutorService.submit(new Runnable()
      {
        public void run()
        {
          try
          {
            Process.setThreadPriority(10);
            zzrp.zzf(paramCallable.call());
            return;
          }
          catch (Exception localException)
          {
            zzp.zzbA().zzc(localException, true);
            zzrp.cancel(true);
          }
        }
      });
      return localZzie;
    }
    catch (RejectedExecutionException paramExecutorService)
    {
      zzb.zzd("Thread execution is rejected.", paramExecutorService);
      localZzie.cancel(true);
    }
    return localZzie;
  }
  
  private static ThreadFactory zzav(String paramString)
  {
    new ThreadFactory()
    {
      private final AtomicInteger zzHC = new AtomicInteger(1);
      
      public Thread newThread(Runnable paramAnonymousRunnable)
      {
        return new Thread(paramAnonymousRunnable, "AdWorker(" + zzHD + ") #" + zzHC.getAndIncrement());
      }
    };
  }
}
