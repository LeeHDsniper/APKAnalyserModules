package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.os.RemoteException;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.reward.client.zzf;
import com.google.android.gms.ads.internal.reward.client.zzi;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.reward.RewardedVideoAd;
import com.google.android.gms.internal.zzeg;

public class zzaa
{
  private static final Object zzpm = new Object();
  private static zzaa zztt;
  private zzv zztu;
  private RewardedVideoAd zztv;
  
  private zzaa() {}
  
  public static zzaa zzcU()
  {
    synchronized (zzpm)
    {
      if (zztt == null) {
        zztt = new zzaa();
      }
      zzaa localZzaa = zztt;
      return localZzaa;
    }
  }
  
  public RewardedVideoAd getRewardedVideoAdInstance(Context paramContext)
  {
    synchronized (zzpm)
    {
      if (zztv != null)
      {
        paramContext = zztv;
        return paramContext;
      }
      zzeg localZzeg = new zzeg();
      zztv = new zzi(paramContext, zzk.zzcJ().zza(paramContext, localZzeg));
      paramContext = zztv;
      return paramContext;
    }
  }
  
  public void zza(Context paramContext, String paramString, zzab paramZzab)
  {
    synchronized (zzpm)
    {
      if (zztu != null) {
        return;
      }
      if (paramContext == null) {
        throw new IllegalArgumentException("Context cannot be null.");
      }
    }
    if (TextUtils.isEmpty(paramString)) {
      throw new IllegalArgumentException("applicationCode cannot be empty.");
    }
    for (;;)
    {
      try
      {
        zztu = zzk.zzcH().zzt(paramContext);
        zzv localZzv = zztu;
        if (paramZzab != null) {
          continue;
        }
        paramContext = null;
        localZzv.zza(paramString, paramContext);
      }
      catch (RemoteException paramContext)
      {
        zzb.zzaE("Fail to initialize mobile ads setting manager");
        continue;
      }
      return;
      paramContext = new MobileAdsSettingsParcel(paramZzab);
    }
  }
}
