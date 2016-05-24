package com.google.android.gms.internal;

import android.os.Handler;
import android.os.Looper;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.atomic.AtomicInteger;

public class zzl
{
  private AtomicInteger zzY = new AtomicInteger();
  private final Map<String, Queue<zzk<?>>> zzZ = new HashMap();
  private final Set<zzk<?>> zzaa = new HashSet();
  private final PriorityBlockingQueue<zzk<?>> zzab = new PriorityBlockingQueue();
  private final PriorityBlockingQueue<zzk<?>> zzac = new PriorityBlockingQueue();
  private zzg[] zzad;
  private zzc zzae;
  private List<zza> zzaf = new ArrayList();
  private final zzb zzj;
  private final zzn zzk;
  private final zzf zzz;
  
  public zzl(zzb paramZzb, zzf paramZzf)
  {
    this(paramZzb, paramZzf, 4);
  }
  
  public zzl(zzb paramZzb, zzf paramZzf, int paramInt)
  {
    this(paramZzb, paramZzf, paramInt, new zze(new Handler(Looper.getMainLooper())));
  }
  
  public zzl(zzb paramZzb, zzf paramZzf, int paramInt, zzn paramZzn)
  {
    zzj = paramZzb;
    zzz = paramZzf;
    zzad = new zzg[paramInt];
    zzk = paramZzn;
  }
  
  public int getSequenceNumber()
  {
    return zzY.incrementAndGet();
  }
  
  public void start()
  {
    stop();
    zzae = new zzc(zzab, zzac, zzj, zzk);
    zzae.start();
    int i = 0;
    while (i < zzad.length)
    {
      zzg localZzg = new zzg(zzac, zzz, zzj, zzk);
      zzad[i] = localZzg;
      localZzg.start();
      i += 1;
    }
  }
  
  public void stop()
  {
    if (zzae != null) {
      zzae.quit();
    }
    int i = 0;
    while (i < zzad.length)
    {
      if (zzad[i] != null) {
        zzad[i].quit();
      }
      i += 1;
    }
  }
  
  public <T> zzk<T> zze(zzk<T> paramZzk)
  {
    paramZzk.zza(this);
    synchronized (zzaa)
    {
      zzaa.add(paramZzk);
      paramZzk.zza(getSequenceNumber());
      paramZzk.zzc("add-to-queue");
      if (!paramZzk.zzr())
      {
        zzac.add(paramZzk);
        return paramZzk;
      }
    }
    for (;;)
    {
      String str;
      synchronized (zzZ)
      {
        str = paramZzk.zzh();
        if (zzZ.containsKey(str))
        {
          Queue localQueue = (Queue)zzZ.get(str);
          ??? = localQueue;
          if (localQueue == null) {
            ??? = new LinkedList();
          }
          ((Queue)???).add(paramZzk);
          zzZ.put(str, ???);
          if (zzs.DEBUG) {
            zzs.zza("Request for cacheKey=%s is in flight, putting on hold.", new Object[] { str });
          }
          return paramZzk;
        }
      }
      zzZ.put(str, null);
      zzab.add(paramZzk);
    }
  }
  
  <T> void zzf(zzk<T> paramZzk)
  {
    Object localObject2;
    synchronized (zzaa)
    {
      zzaa.remove(paramZzk);
      synchronized (zzaf)
      {
        localObject2 = zzaf.iterator();
        if (((Iterator)localObject2).hasNext()) {
          ((zza)((Iterator)localObject2).next()).zzg(paramZzk);
        }
      }
    }
    if (paramZzk.zzr()) {
      synchronized (zzZ)
      {
        paramZzk = paramZzk.zzh();
        localObject2 = (Queue)zzZ.remove(paramZzk);
        if (localObject2 != null)
        {
          if (zzs.DEBUG) {
            zzs.zza("Releasing %d waiting requests for cacheKey=%s.", new Object[] { Integer.valueOf(((Queue)localObject2).size()), paramZzk });
          }
          zzab.addAll((Collection)localObject2);
        }
        return;
      }
    }
  }
  
  public static abstract interface zza<T>
  {
    public abstract void zzg(zzk<T> paramZzk);
  }
}
