package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.reward.mediation.client.RewardItemParcel;
import com.google.android.gms.ads.internal.reward.mediation.client.zza.zza;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;

@zzgk
public class zzhc
  extends zza.zza
{
  private zzhd zzGq;
  private zzha zzGw;
  private zzhb zzGx;
  
  public zzhc(zzhb paramZzhb)
  {
    zzGx = paramZzhb;
  }
  
  public void zza(zzd paramZzd, RewardItemParcel paramRewardItemParcel)
  {
    if (zzGx != null) {
      zzGx.zza(paramRewardItemParcel);
    }
  }
  
  public void zza(zzha paramZzha)
  {
    zzGw = paramZzha;
  }
  
  public void zza(zzhd paramZzhd)
  {
    zzGq = paramZzhd;
  }
  
  public void zzb(zzd paramZzd, int paramInt)
  {
    if (zzGw != null) {
      zzGw.zzJ(paramInt);
    }
  }
  
  public void zzc(zzd paramZzd, int paramInt)
  {
    if (zzGq != null) {
      zzGq.zzb(zze.zzp(paramZzd).getClass().getName(), paramInt);
    }
  }
  
  public void zzg(zzd paramZzd)
  {
    if (zzGw != null) {
      zzGw.zzfS();
    }
  }
  
  public void zzh(zzd paramZzd)
  {
    if (zzGq != null) {
      zzGq.zzas(zze.zzp(paramZzd).getClass().getName());
    }
  }
  
  public void zzi(zzd paramZzd)
  {
    if (zzGx != null) {
      zzGx.onRewardedVideoAdOpened();
    }
  }
  
  public void zzj(zzd paramZzd)
  {
    if (zzGx != null) {
      zzGx.onRewardedVideoStarted();
    }
  }
  
  public void zzk(zzd paramZzd)
  {
    if (zzGx != null) {
      zzGx.onRewardedVideoAdClosed();
    }
  }
  
  public void zzl(zzd paramZzd)
  {
    if (zzGx != null) {
      zzGx.zzfP();
    }
  }
  
  public void zzm(zzd paramZzd)
  {
    if (zzGx != null) {
      zzGx.onRewardedVideoAdLeftApplication();
    }
  }
}
