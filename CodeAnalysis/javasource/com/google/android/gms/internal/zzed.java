package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.RemoteException;
import android.os.SystemClock;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.dynamic.zze;
import java.util.List;

@zzgk
public final class zzed
  implements zzee.zza
{
  private final Context mContext;
  private final NativeAdOptionsParcel zzoX;
  private final List<String> zzoY;
  private final zzeh zzow;
  private final VersionInfoParcel zzpa;
  private final Object zzpc = new Object();
  private final AdRequestParcel zzpz;
  private final String zzyH;
  private final long zzyI;
  private final zzdz zzyJ;
  private final AdSizeParcel zzyK;
  private zzei zzyL;
  private int zzyM = -2;
  private final boolean zzyf;
  
  public zzed(Context paramContext, String paramString, zzeh paramZzeh, zzea paramZzea, zzdz paramZzdz, AdRequestParcel paramAdRequestParcel, AdSizeParcel paramAdSizeParcel, VersionInfoParcel paramVersionInfoParcel, boolean paramBoolean, NativeAdOptionsParcel paramNativeAdOptionsParcel, List<String> paramList)
  {
    mContext = paramContext;
    zzow = paramZzeh;
    zzyJ = paramZzdz;
    if ("com.google.ads.mediation.customevent.CustomEventAdapter".equals(paramString))
    {
      zzyH = zzdQ();
      if (zzyv == -1L) {
        break label124;
      }
    }
    label124:
    for (long l = zzyv;; l = 10000L)
    {
      zzyI = l;
      zzpz = paramAdRequestParcel;
      zzyK = paramAdSizeParcel;
      zzpa = paramVersionInfoParcel;
      zzyf = paramBoolean;
      zzoX = paramNativeAdOptionsParcel;
      zzoY = paramList;
      return;
      zzyH = paramString;
      break;
    }
  }
  
  private void zza(long paramLong1, long paramLong2, long paramLong3, long paramLong4)
  {
    for (;;)
    {
      if (zzyM != -2) {
        return;
      }
      zzb(paramLong1, paramLong2, paramLong3, paramLong4);
    }
  }
  
  private void zza(zzec paramZzec)
  {
    if ("com.google.ads.mediation.AdUrlAdapter".equals(zzyH))
    {
      Bundle localBundle2 = zzpz.zzsA.getBundle(zzyH);
      Bundle localBundle1 = localBundle2;
      if (localBundle2 == null) {
        localBundle1 = new Bundle();
      }
      localBundle1.putString("sdk_less_network_id", zzyJ.zzyl);
      zzpz.zzsA.putBundle(zzyH, localBundle1);
    }
    try
    {
      if (zzpa.zzIB < 4100000)
      {
        if (zzyK.zzsH)
        {
          zzyL.zza(zze.zzx(mContext), zzpz, zzyJ.zzyr, paramZzec);
          return;
        }
        zzyL.zza(zze.zzx(mContext), zzyK, zzpz, zzyJ.zzyr, paramZzec);
        return;
      }
    }
    catch (RemoteException paramZzec)
    {
      zzb.zzd("Could not request ad from mediation adapter.", paramZzec);
      zzq(5);
      return;
    }
    if (zzyf)
    {
      zzyL.zza(zze.zzx(mContext), zzpz, zzyJ.zzyr, zzyJ.zzyk, paramZzec, zzoX, zzoY);
      return;
    }
    if (zzyK.zzsH)
    {
      zzyL.zza(zze.zzx(mContext), zzpz, zzyJ.zzyr, zzyJ.zzyk, paramZzec);
      return;
    }
    zzyL.zza(zze.zzx(mContext), zzyK, zzpz, zzyJ.zzyr, zzyJ.zzyk, paramZzec);
  }
  
  private void zzb(long paramLong1, long paramLong2, long paramLong3, long paramLong4)
  {
    long l = SystemClock.elapsedRealtime();
    paramLong1 = paramLong2 - (l - paramLong1);
    paramLong2 = paramLong4 - (l - paramLong3);
    if ((paramLong1 <= 0L) || (paramLong2 <= 0L))
    {
      zzb.zzaD("Timed out waiting for adapter.");
      zzyM = 3;
      return;
    }
    try
    {
      zzpc.wait(Math.min(paramLong1, paramLong2));
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      zzyM = -1;
    }
  }
  
  private String zzdQ()
  {
    try
    {
      if (!TextUtils.isEmpty(zzyJ.zzyo))
      {
        if (zzow.zzac(zzyJ.zzyo)) {
          return "com.google.android.gms.ads.mediation.customevent.CustomEventAdapter";
        }
        return "com.google.ads.mediation.customevent.CustomEventAdapter";
      }
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzaE("Fail to determine the custom event's version, assuming the old one.");
    }
    return "com.google.ads.mediation.customevent.CustomEventAdapter";
  }
  
  private zzei zzdR()
  {
    zzb.zzaD("Instantiating mediation adapter: " + zzyH);
    try
    {
      zzei localZzei = zzow.zzab(zzyH);
      return localZzei;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zza("Could not instantiate mediation adapter: " + zzyH, localRemoteException);
    }
    return null;
  }
  
  public void cancel()
  {
    synchronized (zzpc)
    {
      try
      {
        if (zzyL != null) {
          zzyL.destroy();
        }
        zzyM = -1;
        zzpc.notify();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        for (;;)
        {
          zzb.zzd("Could not destroy mediation adapter.", localRemoteException);
        }
      }
    }
  }
  
  public zzee zza(long paramLong1, long paramLong2)
  {
    synchronized (zzpc)
    {
      long l = SystemClock.elapsedRealtime();
      Object localObject2 = new zzec();
      zzhu.zzHK.post(new Runnable()
      {
        public void run()
        {
          synchronized (zzed.zza(zzed.this))
          {
            if (zzed.zzb(zzed.this) != -2) {
              return;
            }
            zzed.zza(zzed.this, zzed.zzc(zzed.this));
            if (zzed.zzd(zzed.this) == null)
            {
              zzq(4);
              return;
            }
          }
          zzyN.zza(zzed.this);
          zzed.zza(zzed.this, zzyN);
        }
      });
      zza(l, zzyI, paramLong1, paramLong2);
      localObject2 = new zzee(zzyJ, zzyL, zzyH, (zzec)localObject2, zzyM);
      return localObject2;
    }
  }
  
  public void zzq(int paramInt)
  {
    synchronized (zzpc)
    {
      zzyM = paramInt;
      zzpc.notify();
      return;
    }
  }
}
