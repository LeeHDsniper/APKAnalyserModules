package com.google.android.gms.common.api;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import android.util.Pair;
import com.google.android.gms.common.internal.zzq;
import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public abstract class zzb<R extends Result>
  implements PendingResult<R>
{
  private boolean zzL;
  private final Object zzYD = new Object();
  protected final zza<R> zzYE;
  private final ArrayList<PendingResult.BatchCallback> zzYF = new ArrayList();
  private ResultCallback<R> zzYG;
  private volatile R zzYH;
  private volatile boolean zzYI;
  private boolean zzYJ;
  private zzq zzYK;
  private final CountDownLatch zzoR = new CountDownLatch(1);
  
  protected zzb(Looper paramLooper)
  {
    zzYE = new zza(paramLooper);
  }
  
  private R get()
  {
    boolean bool = true;
    synchronized (zzYD)
    {
      if (!zzYI)
      {
        zzx.zza(bool, "Result has already been consumed.");
        zzx.zza(isReady(), "Result is not ready.");
        Result localResult = zzYH;
        zzYH = null;
        zzYG = null;
        zzYI = true;
        zzmZ();
        return localResult;
      }
      bool = false;
    }
  }
  
  private void zzb(R paramR)
  {
    zzYH = paramR;
    zzYK = null;
    zzoR.countDown();
    paramR = zzYH.getStatus();
    if (zzYG != null)
    {
      zzYE.zzna();
      if (!zzL) {
        zzYE.zza(zzYG, get());
      }
    }
    Iterator localIterator = zzYF.iterator();
    while (localIterator.hasNext()) {
      ((PendingResult.BatchCallback)localIterator.next()).onComplete(paramR);
    }
    zzYF.clear();
  }
  
  static void zzc(Result paramResult)
  {
    if ((paramResult instanceof Releasable)) {}
    try
    {
      ((Releasable)paramResult).release();
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      Log.w("AbstractPendingResult", "Unable to release " + paramResult, localRuntimeException);
    }
  }
  
  public final R await(long paramLong, TimeUnit paramTimeUnit)
  {
    boolean bool2 = true;
    boolean bool1;
    if ((paramLong <= 0L) || (Looper.myLooper() != Looper.getMainLooper())) {
      bool1 = true;
    }
    for (;;)
    {
      zzx.zza(bool1, "await must not be called on the UI thread when time is greater than zero.");
      if (!zzYI)
      {
        bool1 = bool2;
        zzx.zza(bool1, "Result has already been consumed.");
      }
      try
      {
        if (!zzoR.await(paramLong, paramTimeUnit)) {
          zzw(Status.zzaaG);
        }
        zzx.zza(isReady(), "Result is not ready.");
        return get();
        bool1 = false;
        continue;
        bool1 = false;
      }
      catch (InterruptedException paramTimeUnit)
      {
        for (;;)
        {
          zzw(Status.zzaaE);
        }
      }
    }
  }
  
  public void cancel()
  {
    synchronized (zzYD)
    {
      if ((zzL) || (zzYI)) {
        return;
      }
      zzq localZzq = zzYK;
      if (localZzq == null) {}
    }
    try
    {
      zzYK.cancel();
      zzc(zzYH);
      zzYG = null;
      zzL = true;
      zzb(zzb(Status.zzaaH));
      return;
      localObject2 = finally;
      throw localObject2;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;) {}
    }
  }
  
  public boolean isCanceled()
  {
    synchronized (zzYD)
    {
      boolean bool = zzL;
      return bool;
    }
  }
  
  public final boolean isReady()
  {
    return zzoR.getCount() == 0L;
  }
  
  public final void setResultCallback(ResultCallback<R> paramResultCallback)
  {
    if (!zzYI) {}
    for (boolean bool = true;; bool = false)
    {
      zzx.zza(bool, "Result has already been consumed.");
      for (;;)
      {
        synchronized (zzYD)
        {
          if (isCanceled()) {
            return;
          }
          if (isReady())
          {
            zzYE.zza(paramResultCallback, get());
            return;
          }
        }
        zzYG = paramResultCallback;
      }
    }
  }
  
  public final void zza(R paramR)
  {
    boolean bool2 = true;
    for (;;)
    {
      synchronized (zzYD)
      {
        if ((zzYJ) || (zzL))
        {
          zzc(paramR);
          return;
        }
        if (!isReady())
        {
          bool1 = true;
          zzx.zza(bool1, "Results have already been set");
          if (zzYI) {
            break label83;
          }
          bool1 = bool2;
          zzx.zza(bool1, "Result has already been consumed");
          zzb(paramR);
          return;
        }
      }
      boolean bool1 = false;
      continue;
      label83:
      bool1 = false;
    }
  }
  
  protected abstract R zzb(Status paramStatus);
  
  protected void zzmZ() {}
  
  public final void zzw(Status paramStatus)
  {
    synchronized (zzYD)
    {
      if (!isReady())
      {
        zza(zzb(paramStatus));
        zzYJ = true;
      }
      return;
    }
  }
  
  public static class zza<R extends Result>
    extends Handler
  {
    public zza()
    {
      this(Looper.getMainLooper());
    }
    
    public zza(Looper paramLooper)
    {
      super();
    }
    
    public void handleMessage(Message paramMessage)
    {
      switch (what)
      {
      default: 
        Log.wtf("AbstractPendingResult", "Don't know how to handle this message.");
        return;
      case 1: 
        paramMessage = (Pair)obj;
        zzb((ResultCallback)first, (Result)second);
        return;
      }
      ((zzb)obj).zzw(Status.zzaaG);
    }
    
    public void zza(ResultCallback<R> paramResultCallback, R paramR)
    {
      sendMessage(obtainMessage(1, new Pair(paramResultCallback, paramR)));
    }
    
    protected void zzb(ResultCallback<R> paramResultCallback, R paramR)
    {
      try
      {
        paramResultCallback.onResult(paramR);
        return;
      }
      catch (RuntimeException paramResultCallback)
      {
        zzb.zzc(paramR);
        throw paramResultCallback;
      }
    }
    
    public void zzna()
    {
      removeMessages(2);
    }
  }
}
