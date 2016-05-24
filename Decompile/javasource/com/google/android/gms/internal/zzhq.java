package com.google.android.gms.internal;

import java.util.concurrent.Future;

@zzgk
public abstract class zzhq
{
  private volatile Thread zzHt;
  private final Runnable zzx = new Runnable()
  {
    public final void run()
    {
      zzhq.zza(zzhq.this, Thread.currentThread());
      zzdG();
    }
  };
  
  public zzhq() {}
  
  public final void cancel()
  {
    onStop();
    if (zzHt != null) {
      zzHt.interrupt();
    }
  }
  
  public abstract void onStop();
  
  public abstract void zzdG();
  
  public final Future zzgn()
  {
    return zzht.zza(zzx);
  }
  
  public final void zzgo()
  {
    zzht.zza(1, zzx);
  }
}
