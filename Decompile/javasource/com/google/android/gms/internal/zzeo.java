package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.ads.mediation.MediationBannerAdapter;
import com.google.android.gms.ads.mediation.MediationBannerListener;
import com.google.android.gms.ads.mediation.MediationInterstitialAdapter;
import com.google.android.gms.ads.mediation.MediationInterstitialListener;
import com.google.android.gms.ads.mediation.NativeAdMapper;
import com.google.android.gms.ads.mediation.zza;
import com.google.android.gms.common.internal.zzx;

@zzgk
public final class zzeo
  implements MediationBannerListener, MediationInterstitialListener, com.google.android.gms.ads.mediation.zzb
{
  private final zzej zzyY;
  private NativeAdMapper zzyZ;
  
  public zzeo(zzej paramZzej)
  {
    zzyY = paramZzej;
  }
  
  public void onAdClicked(MediationBannerAdapter paramMediationBannerAdapter)
  {
    zzx.zzch("onAdClicked must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdClicked.");
    try
    {
      zzyY.onAdClicked();
      return;
    }
    catch (RemoteException paramMediationBannerAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdClicked.", paramMediationBannerAdapter);
    }
  }
  
  public void onAdClicked(MediationInterstitialAdapter paramMediationInterstitialAdapter)
  {
    zzx.zzch("onAdClicked must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdClicked.");
    try
    {
      zzyY.onAdClicked();
      return;
    }
    catch (RemoteException paramMediationInterstitialAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdClicked.", paramMediationInterstitialAdapter);
    }
  }
  
  public void onAdClosed(MediationBannerAdapter paramMediationBannerAdapter)
  {
    zzx.zzch("onAdClosed must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdClosed.");
    try
    {
      zzyY.onAdClosed();
      return;
    }
    catch (RemoteException paramMediationBannerAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdClosed.", paramMediationBannerAdapter);
    }
  }
  
  public void onAdClosed(MediationInterstitialAdapter paramMediationInterstitialAdapter)
  {
    zzx.zzch("onAdClosed must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdClosed.");
    try
    {
      zzyY.onAdClosed();
      return;
    }
    catch (RemoteException paramMediationInterstitialAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdClosed.", paramMediationInterstitialAdapter);
    }
  }
  
  public void onAdFailedToLoad(MediationBannerAdapter paramMediationBannerAdapter, int paramInt)
  {
    zzx.zzch("onAdFailedToLoad must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdFailedToLoad with error. " + paramInt);
    try
    {
      zzyY.onAdFailedToLoad(paramInt);
      return;
    }
    catch (RemoteException paramMediationBannerAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdFailedToLoad.", paramMediationBannerAdapter);
    }
  }
  
  public void onAdFailedToLoad(MediationInterstitialAdapter paramMediationInterstitialAdapter, int paramInt)
  {
    zzx.zzch("onAdFailedToLoad must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdFailedToLoad with error " + paramInt + ".");
    try
    {
      zzyY.onAdFailedToLoad(paramInt);
      return;
    }
    catch (RemoteException paramMediationInterstitialAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdFailedToLoad.", paramMediationInterstitialAdapter);
    }
  }
  
  public void onAdLeftApplication(MediationBannerAdapter paramMediationBannerAdapter)
  {
    zzx.zzch("onAdLeftApplication must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdLeftApplication.");
    try
    {
      zzyY.onAdLeftApplication();
      return;
    }
    catch (RemoteException paramMediationBannerAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdLeftApplication.", paramMediationBannerAdapter);
    }
  }
  
  public void onAdLeftApplication(MediationInterstitialAdapter paramMediationInterstitialAdapter)
  {
    zzx.zzch("onAdLeftApplication must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdLeftApplication.");
    try
    {
      zzyY.onAdLeftApplication();
      return;
    }
    catch (RemoteException paramMediationInterstitialAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdLeftApplication.", paramMediationInterstitialAdapter);
    }
  }
  
  public void onAdLoaded(MediationBannerAdapter paramMediationBannerAdapter)
  {
    zzx.zzch("onAdLoaded must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdLoaded.");
    try
    {
      zzyY.onAdLoaded();
      return;
    }
    catch (RemoteException paramMediationBannerAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdLoaded.", paramMediationBannerAdapter);
    }
  }
  
  public void onAdLoaded(MediationInterstitialAdapter paramMediationInterstitialAdapter)
  {
    zzx.zzch("onAdLoaded must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdLoaded.");
    try
    {
      zzyY.onAdLoaded();
      return;
    }
    catch (RemoteException paramMediationInterstitialAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdLoaded.", paramMediationInterstitialAdapter);
    }
  }
  
  public void onAdOpened(MediationBannerAdapter paramMediationBannerAdapter)
  {
    zzx.zzch("onAdOpened must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdOpened.");
    try
    {
      zzyY.onAdOpened();
      return;
    }
    catch (RemoteException paramMediationBannerAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdOpened.", paramMediationBannerAdapter);
    }
  }
  
  public void onAdOpened(MediationInterstitialAdapter paramMediationInterstitialAdapter)
  {
    zzx.zzch("onAdOpened must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdOpened.");
    try
    {
      zzyY.onAdOpened();
      return;
    }
    catch (RemoteException paramMediationInterstitialAdapter)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdOpened.", paramMediationInterstitialAdapter);
    }
  }
  
  public void zza(zza paramZza)
  {
    zzx.zzch("onAdOpened must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdOpened.");
    try
    {
      zzyY.onAdOpened();
      return;
    }
    catch (RemoteException paramZza)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdOpened.", paramZza);
    }
  }
  
  public void zza(zza paramZza, int paramInt)
  {
    zzx.zzch("onAdFailedToLoad must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdFailedToLoad with error " + paramInt + ".");
    try
    {
      zzyY.onAdFailedToLoad(paramInt);
      return;
    }
    catch (RemoteException paramZza)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdFailedToLoad.", paramZza);
    }
  }
  
  public void zza(zza paramZza, NativeAdMapper paramNativeAdMapper)
  {
    zzx.zzch("onAdLoaded must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdLoaded.");
    zzyZ = paramNativeAdMapper;
    try
    {
      zzyY.onAdLoaded();
      return;
    }
    catch (RemoteException paramZza)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdLoaded.", paramZza);
    }
  }
  
  public void zzb(zza paramZza)
  {
    zzx.zzch("onAdClosed must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdClosed.");
    try
    {
      zzyY.onAdClosed();
      return;
    }
    catch (RemoteException paramZza)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdClosed.", paramZza);
    }
  }
  
  public void zzc(zza paramZza)
  {
    zzx.zzch("onAdLeftApplication must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdLeftApplication.");
    try
    {
      zzyY.onAdLeftApplication();
      return;
    }
    catch (RemoteException paramZza)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdLeftApplication.", paramZza);
    }
  }
  
  public void zzd(zza paramZza)
  {
    zzx.zzch("onAdClicked must be called on the main UI thread.");
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Adapter called onAdClicked.");
    try
    {
      zzyY.onAdClicked();
      return;
    }
    catch (RemoteException paramZza)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onAdClicked.", paramZza);
    }
  }
  
  public NativeAdMapper zzdU()
  {
    return zzyZ;
  }
}
