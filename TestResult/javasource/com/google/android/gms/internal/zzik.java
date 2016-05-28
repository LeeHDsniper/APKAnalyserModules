package com.google.android.gms.internal;

import java.util.Iterator;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

@zzgk
public class zzik<T>
  implements zzij<T>
{
  protected final BlockingQueue<zzik<T>.zza> zzIN = new LinkedBlockingQueue();
  protected T zzIO;
  private final Object zzpc = new Object();
  protected int zzxJ = 0;
  
  public zzik() {}
  
  public int getStatus()
  {
    return zzxJ;
  }
  
  public void reject()
  {
    synchronized (zzpc)
    {
      if (zzxJ != 0) {
        throw new UnsupportedOperationException();
      }
    }
    zzxJ = -1;
    Iterator localIterator = zzIN.iterator();
    while (localIterator.hasNext()) {
      nextzzIQ.run();
    }
    zzIN.clear();
  }
  
  public void zza(zzij.zzc<T> paramZzc, zzij.zza paramZza)
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzxJ == 1)
        {
          paramZzc.zzc(zzIO);
          return;
        }
        if (zzxJ == -1) {
          paramZza.run();
        }
      }
      if (zzxJ == 0) {
        zzIN.add(new zza(paramZzc, paramZza));
      }
    }
  }
  
  public void zzg(T paramT)
  {
    synchronized (zzpc)
    {
      if (zzxJ != 0) {
        throw new UnsupportedOperationException();
      }
    }
    zzIO = paramT;
    zzxJ = 1;
    Iterator localIterator = zzIN.iterator();
    while (localIterator.hasNext()) {
      nextzzIP.zzc(paramT);
    }
    zzIN.clear();
  }
  
  class zza
  {
    public final zzij.zzc<T> zzIP;
    public final zzij.zza zzIQ;
    
    public zza(zzij.zza paramZza)
    {
      zzIP = paramZza;
      Object localObject;
      zzIQ = localObject;
    }
  }
}
