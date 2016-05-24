package com.google.android.gms.internal;

import android.os.Handler;
import com.google.android.gms.ads.internal.util.client.zza;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

class zzii
{
  private final Object zzIJ = new Object();
  private final List<Runnable> zzIK = new ArrayList();
  private final List<Runnable> zzIL = new ArrayList();
  private boolean zzIM = false;
  
  public zzii() {}
  
  private void zzd(Runnable paramRunnable)
  {
    zzht.zza(paramRunnable);
  }
  
  private void zze(Runnable paramRunnable)
  {
    zza.zzIy.post(paramRunnable);
  }
  
  public void zzc(Runnable paramRunnable)
  {
    synchronized (zzIJ)
    {
      if (zzIM)
      {
        zzd(paramRunnable);
        return;
      }
      zzIK.add(paramRunnable);
    }
  }
  
  public void zzgK()
  {
    synchronized (zzIJ)
    {
      if (zzIM) {
        return;
      }
      Iterator localIterator1 = zzIK.iterator();
      if (localIterator1.hasNext()) {
        zzd((Runnable)localIterator1.next());
      }
    }
    Iterator localIterator2 = zzIL.iterator();
    while (localIterator2.hasNext()) {
      zze((Runnable)localIterator2.next());
    }
    zzIK.clear();
    zzIL.clear();
    zzIM = true;
  }
}
