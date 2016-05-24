package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzaf.zzj;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

class zzcm
  implements zzp.zze
{
  private boolean mClosed;
  private final Context mContext;
  private final String zzaOS;
  private String zzaPp;
  private zzbf<zzaf.zzj> zzaRo;
  private zzs zzaRp;
  private final ScheduledExecutorService zzaRr;
  private final zza zzaRs;
  private ScheduledFuture<?> zzaRt;
  
  public zzcm(Context paramContext, String paramString, zzs paramZzs)
  {
    this(paramContext, paramString, paramZzs, null, null);
  }
  
  zzcm(Context paramContext, String paramString, zzs paramZzs, zzb paramZzb, zza paramZza)
  {
    zzaRp = paramZzs;
    mContext = paramContext;
    zzaOS = paramString;
    paramContext = paramZzb;
    if (paramZzb == null) {
      paramContext = new zzb()
      {
        public ScheduledExecutorService zzAC()
        {
          return Executors.newSingleThreadScheduledExecutor();
        }
      };
    }
    zzaRr = paramContext.zzAC();
    if (paramZza == null)
    {
      zzaRs = new zza()
      {
        public zzcl zza(zzs paramAnonymousZzs)
        {
          return new zzcl(zzcm.zza(zzcm.this), zzcm.zzb(zzcm.this), paramAnonymousZzs);
        }
      };
      return;
    }
    zzaRs = paramZza;
  }
  
  private void zzAB()
  {
    try
    {
      if (mClosed) {
        throw new IllegalStateException("called method after closed");
      }
    }
    finally {}
  }
  
  private zzcl zzeR(String paramString)
  {
    zzcl localZzcl = zzaRs.zza(zzaRp);
    localZzcl.zza(zzaRo);
    localZzcl.zzeB(zzaPp);
    localZzcl.zzeQ(paramString);
    return localZzcl;
  }
  
  public void release()
  {
    try
    {
      zzAB();
      if (zzaRt != null) {
        zzaRt.cancel(false);
      }
      zzaRr.shutdown();
      mClosed = true;
      return;
    }
    finally {}
  }
  
  public void zzeB(String paramString)
  {
    try
    {
      zzAB();
      zzaPp = paramString;
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public void zzf(long paramLong, String paramString)
  {
    try
    {
      zzbg.v("loadAfterDelay: containerId=" + zzaOS + " delay=" + paramLong);
      zzAB();
      if (zzaRo == null) {
        throw new IllegalStateException("callback must be set before loadAfterDelay() is called.");
      }
    }
    finally {}
    if (zzaRt != null) {
      zzaRt.cancel(false);
    }
    zzaRt = zzaRr.schedule(zzeR(paramString), paramLong, TimeUnit.MILLISECONDS);
  }
  
  static abstract interface zza
  {
    public abstract zzcl zza(zzs paramZzs);
  }
  
  static abstract interface zzb
  {
    public abstract ScheduledExecutorService zzAC();
  }
}
