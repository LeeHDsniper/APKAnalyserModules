package com.google.android.gms.ads.internal.reward.mediation.client;

import android.os.RemoteException;
import com.google.android.gms.ads.reward.RewardItem;
import com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdAdapter;
import com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdListener;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.internal.zzgk;

@zzgk
public class zzb
  implements MediationRewardedVideoAdListener
{
  private final zza zzGD;
  
  public zzb(zza paramZza)
  {
    zzGD = paramZza;
  }
  
  public void onAdClicked(MediationRewardedVideoAdAdapter paramMediationRewardedVideoAdAdapter)
  {
    zzx.zzch("onAdClicked must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdClicked.");
    try
    {
      zzGD.zzl(zze.zzx(paramMediationRewardedVideoAdAdapter));
      return;
    }
    catch (RemoteException paramMediationRewardedVideoAdAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdClicked.", paramMediationRewardedVideoAdAdapter);
    }
  }
  
  public void onAdClosed(MediationRewardedVideoAdAdapter paramMediationRewardedVideoAdAdapter)
  {
    zzx.zzch("onAdClosed must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdClosed.");
    try
    {
      zzGD.zzk(zze.zzx(paramMediationRewardedVideoAdAdapter));
      return;
    }
    catch (RemoteException paramMediationRewardedVideoAdAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdClosed.", paramMediationRewardedVideoAdAdapter);
    }
  }
  
  public void onAdFailedToLoad(MediationRewardedVideoAdAdapter paramMediationRewardedVideoAdAdapter, int paramInt)
  {
    zzx.zzch("onAdFailedToLoad must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdFailedToLoad.");
    try
    {
      zzGD.zzc(zze.zzx(paramMediationRewardedVideoAdAdapter), paramInt);
      return;
    }
    catch (RemoteException paramMediationRewardedVideoAdAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdFailedToLoad.", paramMediationRewardedVideoAdAdapter);
    }
  }
  
  public void onAdLeftApplication(MediationRewardedVideoAdAdapter paramMediationRewardedVideoAdAdapter)
  {
    zzx.zzch("onAdLeftApplication must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdLeftApplication.");
    try
    {
      zzGD.zzm(zze.zzx(paramMediationRewardedVideoAdAdapter));
      return;
    }
    catch (RemoteException paramMediationRewardedVideoAdAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdLeftApplication.", paramMediationRewardedVideoAdAdapter);
    }
  }
  
  public void onAdLoaded(MediationRewardedVideoAdAdapter paramMediationRewardedVideoAdAdapter)
  {
    zzx.zzch("onAdLoaded must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdLoaded.");
    try
    {
      zzGD.zzh(zze.zzx(paramMediationRewardedVideoAdAdapter));
      return;
    }
    catch (RemoteException paramMediationRewardedVideoAdAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdLoaded.", paramMediationRewardedVideoAdAdapter);
    }
  }
  
  public void onAdOpened(MediationRewardedVideoAdAdapter paramMediationRewardedVideoAdAdapter)
  {
    zzx.zzch("onAdOpened must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdOpened.");
    try
    {
      zzGD.zzi(zze.zzx(paramMediationRewardedVideoAdAdapter));
      return;
    }
    catch (RemoteException paramMediationRewardedVideoAdAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdOpened.", paramMediationRewardedVideoAdAdapter);
    }
  }
  
  public void onInitializationFailed(MediationRewardedVideoAdAdapter paramMediationRewardedVideoAdAdapter, int paramInt)
  {
    zzx.zzch("onInitializationFailed must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onInitializationFailed.");
    try
    {
      zzGD.zzb(zze.zzx(paramMediationRewardedVideoAdAdapter), paramInt);
      return;
    }
    catch (RemoteException paramMediationRewardedVideoAdAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onInitializationFailed.", paramMediationRewardedVideoAdAdapter);
    }
  }
  
  public void onInitializationSucceeded(MediationRewardedVideoAdAdapter paramMediationRewardedVideoAdAdapter)
  {
    zzx.zzch("onInitializationSucceeded must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onInitializationSucceeded.");
    try
    {
      zzGD.zzg(zze.zzx(paramMediationRewardedVideoAdAdapter));
      return;
    }
    catch (RemoteException paramMediationRewardedVideoAdAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onInitializationSucceeded.", paramMediationRewardedVideoAdAdapter);
    }
  }
  
  public void onRewarded(MediationRewardedVideoAdAdapter paramMediationRewardedVideoAdAdapter, RewardItem paramRewardItem)
  {
    zzx.zzch("onRewarded must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onRewarded.");
    if (paramRewardItem != null) {}
    try
    {
      zzGD.zza(zze.zzx(paramMediationRewardedVideoAdAdapter), new RewardItemParcel(paramRewardItem));
      return;
    }
    catch (RemoteException paramMediationRewardedVideoAdAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onRewarded.", paramMediationRewardedVideoAdAdapter);
    }
    zzGD.zza(zze.zzx(paramMediationRewardedVideoAdAdapter), new RewardItemParcel(paramMediationRewardedVideoAdAdapter.getClass().getName(), 1));
    return;
  }
  
  public void onVideoStarted(MediationRewardedVideoAdAdapter paramMediationRewardedVideoAdAdapter)
  {
    zzx.zzch("onVideoStarted must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onVideoStarted.");
    try
    {
      zzGD.zzj(zze.zzx(paramMediationRewardedVideoAdAdapter));
      return;
    }
    catch (RemoteException paramMediationRewardedVideoAdAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onVideoStarted.", paramMediationRewardedVideoAdAdapter);
    }
  }
}
