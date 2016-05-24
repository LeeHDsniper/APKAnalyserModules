package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.dynamic.zze;

@zzgk
public class zzgz
  extends zzhq
  implements zzha, zzhd
{
  private final Context mContext;
  private final zzhj.zza zzCF;
  private int zzCI = 3;
  private final String zzGh;
  private final zzgy zzGp;
  private final zzhd zzGq;
  private final String zzGr;
  private int zzGs = 0;
  private final Object zzpc;
  private final String zzyH;
  
  public zzgz(Context paramContext, String paramString1, String paramString2, String paramString3, zzhj.zza paramZza, zzgy paramZzgy, zzhd paramZzhd)
  {
    mContext = paramContext;
    zzyH = paramString1;
    zzGh = paramString2;
    zzGr = paramString3;
    zzCF = paramZza;
    zzGp = paramZzgy;
    zzpc = new Object();
    zzGq = paramZzhd;
  }
  
  private void zzk(long paramLong)
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzGs != 0) {
          return;
        }
        if (!zze(paramLong)) {
          return;
        }
      }
    }
  }
  
  public void onStop() {}
  
  public void zzJ(int paramInt)
  {
    zzb(zzyH, 0);
  }
  
  public void zzas(String arg1)
  {
    synchronized (zzpc)
    {
      zzGs = 1;
      zzpc.notify();
      return;
    }
  }
  
  public void zzb(String arg1, int paramInt)
  {
    synchronized (zzpc)
    {
      zzGs = 2;
      zzCI = paramInt;
      zzpc.notify();
      return;
    }
  }
  
  public void zzdG()
  {
    if ((zzGp == null) || (zzGp.zzfR() == null) || (zzGp.zzfQ() == null)) {
      return;
    }
    final zzhc localZzhc = zzGp.zzfR();
    localZzhc.zza(this);
    localZzhc.zza(this);
    final AdRequestParcel localAdRequestParcel = zzCF.zzGL.zzDy;
    final zzei localZzei = zzGp.zzfQ();
    try
    {
      if (localZzei.isInitialized()) {
        zza.zzIy.post(new Runnable()
        {
          public void run()
          {
            try
            {
              localZzei.zza(localAdRequestParcel, zzgz.zza(zzgz.this));
              return;
            }
            catch (RemoteException localRemoteException)
            {
              zzb.zzd("Fail to load ad from adapter.", localRemoteException);
              zzb(zzgz.zzb(zzgz.this), 0);
            }
          }
        });
      }
      for (;;)
      {
        zzk(zzp.zzbB().elapsedRealtime());
        localZzhc.zza(null);
        localZzhc.zza(null);
        if (zzGs != 1) {
          break;
        }
        zzGq.zzas(zzyH);
        return;
        zza.zzIy.post(new Runnable()
        {
          public void run()
          {
            try
            {
              localZzei.zza(zze.zzx(zzgz.zzc(zzgz.this)), localAdRequestParcel, zzgz.zzd(zzgz.this), localZzhc, zzgz.zza(zzgz.this));
              return;
            }
            catch (RemoteException localRemoteException)
            {
              zzb.zzd("Fail to initialize adapter " + zzgz.zzb(zzgz.this), localRemoteException);
              zzb(zzgz.zzb(zzgz.this), 0);
            }
          }
        });
      }
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        zzb.zzd("Fail to check if adapter is initialized.", localRemoteException);
        zzb(zzyH, 0);
      }
      zzGq.zzb(zzyH, zzCI);
    }
  }
  
  protected boolean zze(long paramLong)
  {
    paramLong = 20000L - (zzp.zzbB().elapsedRealtime() - paramLong);
    if (paramLong <= 0L) {
      return false;
    }
    try
    {
      zzpc.wait(paramLong);
      return true;
    }
    catch (InterruptedException localInterruptedException) {}
    return false;
  }
  
  public void zzfS()
  {
    zzGp.zzfR();
    AdRequestParcel localAdRequestParcel = zzCF.zzGL.zzDy;
    zzei localZzei = zzGp.zzfQ();
    try
    {
      localZzei.zza(localAdRequestParcel, zzGr);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Fail to load ad from adapter.", localRemoteException);
      zzb(zzyH, 0);
    }
  }
}
