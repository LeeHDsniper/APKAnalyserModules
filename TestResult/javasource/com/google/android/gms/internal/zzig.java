package com.google.android.gms.internal;

import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;

public class zzig
{
  public static <A, B> zzih<B> zza(final zzih<A> paramZzih, final zza<A, B> paramZza)
  {
    zzie localZzie = new zzie();
    paramZzih.zzc(new Runnable()
    {
      public void run()
      {
        try
        {
          zzIG.zzf(paramZza.zze(paramZzih.get()));
          return;
        }
        catch (ExecutionException localExecutionException)
        {
          zzIG.cancel(true);
          return;
        }
        catch (InterruptedException localInterruptedException)
        {
          for (;;) {}
        }
        catch (CancellationException localCancellationException)
        {
          for (;;) {}
        }
      }
    });
    return localZzie;
  }
  
  public static abstract interface zza<D, R>
  {
    public abstract R zze(D paramD);
  }
}
