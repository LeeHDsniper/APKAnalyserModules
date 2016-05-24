package com.google.android.gms.ads.internal.reward.client;

import com.google.android.gms.ads.reward.RewardedVideoAdListener;

public class zzg
  extends zzd.zza
{
  private final RewardedVideoAdListener zzGm;
  
  public zzg(RewardedVideoAdListener paramRewardedVideoAdListener)
  {
    zzGm = paramRewardedVideoAdListener;
  }
  
  public void onRewardedVideoAdClosed()
  {
    if (zzGm != null) {
      zzGm.onRewardedVideoAdClosed();
    }
  }
  
  public void onRewardedVideoAdFailedToLoad(int paramInt)
  {
    if (zzGm != null) {
      zzGm.onRewardedVideoAdFailedToLoad(paramInt);
    }
  }
  
  public void onRewardedVideoAdLeftApplication()
  {
    if (zzGm != null) {
      zzGm.onRewardedVideoAdLeftApplication();
    }
  }
  
  public void onRewardedVideoAdLoaded()
  {
    if (zzGm != null) {
      zzGm.onRewardedVideoAdLoaded();
    }
  }
  
  public void onRewardedVideoAdOpened()
  {
    if (zzGm != null) {
      zzGm.onRewardedVideoAdOpened();
    }
  }
  
  public void onRewardedVideoStarted()
  {
    if (zzGm != null) {
      zzGm.onRewardedVideoStarted();
    }
  }
  
  public void zza(zza paramZza)
  {
    if (zzGm != null) {
      zzGm.onRewarded(new zze(paramZza));
    }
  }
}
