package com.google.android.gms.ads.internal;

import android.content.Context;
import android.view.MotionEvent;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.internal.zzaj;
import com.google.android.gms.internal.zzam;
import com.google.android.gms.internal.zzbu;
import com.google.android.gms.internal.zzby;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzht;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;

@zzgk
class zzh
  implements zzaj, Runnable
{
  private final List<Object[]> zzoP = new Vector();
  private final AtomicReference<zzaj> zzoQ = new AtomicReference();
  CountDownLatch zzoR = new CountDownLatch(1);
  private zzq zzos;
  
  public zzh(zzq paramZzq)
  {
    zzos = paramZzq;
    if (zzk.zzcE().zzgI())
    {
      zzht.zza(this);
      return;
    }
    run();
  }
  
  private void zzbh()
  {
    if (zzoP.isEmpty()) {
      return;
    }
    Iterator localIterator = zzoP.iterator();
    while (localIterator.hasNext())
    {
      Object[] arrayOfObject = (Object[])localIterator.next();
      if (arrayOfObject.length == 1) {
        ((zzaj)zzoQ.get()).zza((MotionEvent)arrayOfObject[0]);
      } else if (arrayOfObject.length == 3) {
        ((zzaj)zzoQ.get()).zza(((Integer)arrayOfObject[0]).intValue(), ((Integer)arrayOfObject[1]).intValue(), ((Integer)arrayOfObject[2]).intValue());
      }
    }
    zzoP.clear();
  }
  
  private Context zzp(Context paramContext)
  {
    if (!((Boolean)zzby.zzuh.get()).booleanValue()) {}
    Context localContext;
    do
    {
      return paramContext;
      localContext = paramContext.getApplicationContext();
    } while (localContext == null);
    return localContext;
  }
  
  public void run()
  {
    label94:
    for (;;)
    {
      try
      {
        if (((Boolean)zzby.zzut.get()).booleanValue()) {
          if (zzos.zzqb.zzIC)
          {
            break label94;
            zza(zzb(zzos.zzqb.zzIz, zzp(zzos.context), bool));
          }
          else
          {
            bool = false;
            continue;
          }
        }
        boolean bool = true;
      }
      finally
      {
        zzoR.countDown();
        zzos = null;
      }
    }
  }
  
  public void zza(int paramInt1, int paramInt2, int paramInt3)
  {
    zzaj localZzaj = (zzaj)zzoQ.get();
    if (localZzaj != null)
    {
      zzbh();
      localZzaj.zza(paramInt1, paramInt2, paramInt3);
      return;
    }
    zzoP.add(new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2), Integer.valueOf(paramInt3) });
  }
  
  public void zza(MotionEvent paramMotionEvent)
  {
    zzaj localZzaj = (zzaj)zzoQ.get();
    if (localZzaj != null)
    {
      zzbh();
      localZzaj.zza(paramMotionEvent);
      return;
    }
    zzoP.add(new Object[] { paramMotionEvent });
  }
  
  protected void zza(zzaj paramZzaj)
  {
    zzoQ.set(paramZzaj);
  }
  
  protected zzaj zzb(String paramString, Context paramContext, boolean paramBoolean)
  {
    return zzam.zza(paramString, paramContext, paramBoolean);
  }
  
  public String zzb(Context paramContext)
  {
    if (zzbg())
    {
      zzaj localZzaj = (zzaj)zzoQ.get();
      if (localZzaj != null)
      {
        zzbh();
        return localZzaj.zzb(zzp(paramContext));
      }
    }
    return "";
  }
  
  public String zzb(Context paramContext, String paramString)
  {
    if (zzbg())
    {
      zzaj localZzaj = (zzaj)zzoQ.get();
      if (localZzaj != null)
      {
        zzbh();
        return localZzaj.zzb(zzp(paramContext), paramString);
      }
    }
    return "";
  }
  
  protected boolean zzbg()
  {
    try
    {
      zzoR.await();
      return true;
    }
    catch (InterruptedException localInterruptedException)
    {
      zzb.zzd("Interrupted during GADSignals creation.", localInterruptedException);
    }
    return false;
  }
}
