package com.google.android.gms.internal;

import java.util.concurrent.CancellationException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

@zzgk
public class zzie<T>
  implements zzih<T>
{
  private T zzID = null;
  private boolean zzIE = false;
  private final zzii zzIF = new zzii();
  private final Object zzpc = new Object();
  private boolean zzyg = false;
  
  public zzie() {}
  
  public boolean cancel(boolean paramBoolean)
  {
    if (!paramBoolean) {
      return false;
    }
    synchronized (zzpc)
    {
      if (zzIE) {
        return false;
      }
    }
    zzyg = true;
    zzIE = true;
    zzpc.notifyAll();
    zzIF.zzgK();
    return true;
  }
  
  public T get()
  {
    synchronized (zzpc)
    {
      boolean bool = zzIE;
      if (bool) {}
    }
    try
    {
      zzpc.wait();
      if (zzyg)
      {
        throw new CancellationException("CallbackFuture was cancelled.");
        localObject2 = finally;
        throw localObject2;
      }
      Object localObject3 = zzID;
      return localObject3;
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;) {}
    }
  }
  
  public T get(long paramLong, TimeUnit paramTimeUnit)
    throws TimeoutException
  {
    synchronized (zzpc)
    {
      boolean bool = zzIE;
      if (!bool) {}
      try
      {
        paramLong = paramTimeUnit.toMillis(paramLong);
        if (paramLong != 0L) {
          zzpc.wait(paramLong);
        }
      }
      catch (InterruptedException paramTimeUnit)
      {
        for (;;) {}
      }
      if (!zzIE) {
        throw new TimeoutException("CallbackFuture timed out.");
      }
    }
    if (zzyg) {
      throw new CancellationException("CallbackFuture was cancelled.");
    }
    paramTimeUnit = zzID;
    return paramTimeUnit;
  }
  
  public boolean isCancelled()
  {
    synchronized (zzpc)
    {
      boolean bool = zzyg;
      return bool;
    }
  }
  
  public boolean isDone()
  {
    synchronized (zzpc)
    {
      boolean bool = zzIE;
      return bool;
    }
  }
  
  public void zzc(Runnable paramRunnable)
  {
    zzIF.zzc(paramRunnable);
  }
  
  public void zzf(T paramT)
  {
    synchronized (zzpc)
    {
      if (zzIE) {
        throw new IllegalStateException("Provided CallbackFuture with multiple values.");
      }
    }
    zzIE = true;
    zzID = paramT;
    zzpc.notifyAll();
    zzIF.zzgK();
  }
}
