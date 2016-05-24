package com.google.android.gms.internal;

import android.os.Handler;
import android.os.RemoteException;
import com.google.ads.AdRequest.ErrorCode;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationBannerListener;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationInterstitialListener;
import com.google.ads.mediation.MediationServerParameters;
import com.google.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;

@zzgk
public final class zzet<NETWORK_EXTRAS extends NetworkExtras, SERVER_PARAMETERS extends MediationServerParameters>
  implements MediationBannerListener, MediationInterstitialListener
{
  private final zzej zzyY;
  
  public zzet(zzej paramZzej)
  {
    zzyY = paramZzej;
  }
  
  public void onClick(MediationBannerAdapter<?, ?> paramMediationBannerAdapter)
  {
    zzb.zzaC("Adapter called onClick.");
    if (!zzk.zzcE().zzgI())
    {
      zzb.zzaE("onClick must be called on the main UI thread.");
      zza.zzIy.post(new Runnable()
      {
        public void run()
        {
          try
          {
            zzet.zza(zzet.this).onAdClicked();
            return;
          }
          catch (RemoteException localRemoteException)
          {
            zzb.zzd("Could not call onAdClicked.", localRemoteException);
          }
        }
      });
      return;
    }
    try
    {
      zzyY.onAdClicked();
      return;
    }
    catch (RemoteException paramMediationBannerAdapter)
    {
      zzb.zzd("Could not call onAdClicked.", paramMediationBannerAdapter);
    }
  }
  
  public void onDismissScreen(MediationBannerAdapter<?, ?> paramMediationBannerAdapter)
  {
    zzb.zzaC("Adapter called onDismissScreen.");
    if (!zzk.zzcE().zzgI())
    {
      zzb.zzaE("onDismissScreen must be called on the main UI thread.");
      zza.zzIy.post(new Runnable()
      {
        public void run()
        {
          try
          {
            zzet.zza(zzet.this).onAdClosed();
            return;
          }
          catch (RemoteException localRemoteException)
          {
            zzb.zzd("Could not call onAdClosed.", localRemoteException);
          }
        }
      });
      return;
    }
    try
    {
      zzyY.onAdClosed();
      return;
    }
    catch (RemoteException paramMediationBannerAdapter)
    {
      zzb.zzd("Could not call onAdClosed.", paramMediationBannerAdapter);
    }
  }
  
  public void onDismissScreen(MediationInterstitialAdapter<?, ?> paramMediationInterstitialAdapter)
  {
    zzb.zzaC("Adapter called onDismissScreen.");
    if (!zzk.zzcE().zzgI())
    {
      zzb.zzaE("onDismissScreen must be called on the main UI thread.");
      zza.zzIy.post(new Runnable()
      {
        public void run()
        {
          try
          {
            zzet.zza(zzet.this).onAdClosed();
            return;
          }
          catch (RemoteException localRemoteException)
          {
            zzb.zzd("Could not call onAdClosed.", localRemoteException);
          }
        }
      });
      return;
    }
    try
    {
      zzyY.onAdClosed();
      return;
    }
    catch (RemoteException paramMediationInterstitialAdapter)
    {
      zzb.zzd("Could not call onAdClosed.", paramMediationInterstitialAdapter);
    }
  }
  
  public void onFailedToReceiveAd(MediationBannerAdapter<?, ?> paramMediationBannerAdapter, final AdRequest.ErrorCode paramErrorCode)
  {
    zzb.zzaC("Adapter called onFailedToReceiveAd with error. " + paramErrorCode);
    if (!zzk.zzcE().zzgI())
    {
      zzb.zzaE("onFailedToReceiveAd must be called on the main UI thread.");
      zza.zzIy.post(new Runnable()
      {
        public void run()
        {
          try
          {
            zzet.zza(zzet.this).onAdFailedToLoad(zzeu.zza(paramErrorCode));
            return;
          }
          catch (RemoteException localRemoteException)
          {
            zzb.zzd("Could not call onAdFailedToLoad.", localRemoteException);
          }
        }
      });
      return;
    }
    try
    {
      zzyY.onAdFailedToLoad(zzeu.zza(paramErrorCode));
      return;
    }
    catch (RemoteException paramMediationBannerAdapter)
    {
      zzb.zzd("Could not call onAdFailedToLoad.", paramMediationBannerAdapter);
    }
  }
  
  public void onFailedToReceiveAd(MediationInterstitialAdapter<?, ?> paramMediationInterstitialAdapter, final AdRequest.ErrorCode paramErrorCode)
  {
    zzb.zzaC("Adapter called onFailedToReceiveAd with error " + paramErrorCode + ".");
    if (!zzk.zzcE().zzgI())
    {
      zzb.zzaE("onFailedToReceiveAd must be called on the main UI thread.");
      zza.zzIy.post(new Runnable()
      {
        public void run()
        {
          try
          {
            zzet.zza(zzet.this).onAdFailedToLoad(zzeu.zza(paramErrorCode));
            return;
          }
          catch (RemoteException localRemoteException)
          {
            zzb.zzd("Could not call onAdFailedToLoad.", localRemoteException);
          }
        }
      });
      return;
    }
    try
    {
      zzyY.onAdFailedToLoad(zzeu.zza(paramErrorCode));
      return;
    }
    catch (RemoteException paramMediationInterstitialAdapter)
    {
      zzb.zzd("Could not call onAdFailedToLoad.", paramMediationInterstitialAdapter);
    }
  }
  
  public void onLeaveApplication(MediationBannerAdapter<?, ?> paramMediationBannerAdapter)
  {
    zzb.zzaC("Adapter called onLeaveApplication.");
    if (!zzk.zzcE().zzgI())
    {
      zzb.zzaE("onLeaveApplication must be called on the main UI thread.");
      zza.zzIy.post(new Runnable()
      {
        public void run()
        {
          try
          {
            zzet.zza(zzet.this).onAdLeftApplication();
            return;
          }
          catch (RemoteException localRemoteException)
          {
            zzb.zzd("Could not call onAdLeftApplication.", localRemoteException);
          }
        }
      });
      return;
    }
    try
    {
      zzyY.onAdLeftApplication();
      return;
    }
    catch (RemoteException paramMediationBannerAdapter)
    {
      zzb.zzd("Could not call onAdLeftApplication.", paramMediationBannerAdapter);
    }
  }
  
  public void onLeaveApplication(MediationInterstitialAdapter<?, ?> paramMediationInterstitialAdapter)
  {
    zzb.zzaC("Adapter called onLeaveApplication.");
    if (!zzk.zzcE().zzgI())
    {
      zzb.zzaE("onLeaveApplication must be called on the main UI thread.");
      zza.zzIy.post(new Runnable()
      {
        public void run()
        {
          try
          {
            zzet.zza(zzet.this).onAdLeftApplication();
            return;
          }
          catch (RemoteException localRemoteException)
          {
            zzb.zzd("Could not call onAdLeftApplication.", localRemoteException);
          }
        }
      });
      return;
    }
    try
    {
      zzyY.onAdLeftApplication();
      return;
    }
    catch (RemoteException paramMediationInterstitialAdapter)
    {
      zzb.zzd("Could not call onAdLeftApplication.", paramMediationInterstitialAdapter);
    }
  }
  
  public void onPresentScreen(MediationBannerAdapter<?, ?> paramMediationBannerAdapter)
  {
    zzb.zzaC("Adapter called onPresentScreen.");
    if (!zzk.zzcE().zzgI())
    {
      zzb.zzaE("onPresentScreen must be called on the main UI thread.");
      zza.zzIy.post(new Runnable()
      {
        public void run()
        {
          try
          {
            zzet.zza(zzet.this).onAdOpened();
            return;
          }
          catch (RemoteException localRemoteException)
          {
            zzb.zzd("Could not call onAdOpened.", localRemoteException);
          }
        }
      });
      return;
    }
    try
    {
      zzyY.onAdOpened();
      return;
    }
    catch (RemoteException paramMediationBannerAdapter)
    {
      zzb.zzd("Could not call onAdOpened.", paramMediationBannerAdapter);
    }
  }
  
  public void onPresentScreen(MediationInterstitialAdapter<?, ?> paramMediationInterstitialAdapter)
  {
    zzb.zzaC("Adapter called onPresentScreen.");
    if (!zzk.zzcE().zzgI())
    {
      zzb.zzaE("onPresentScreen must be called on the main UI thread.");
      zza.zzIy.post(new Runnable()
      {
        public void run()
        {
          try
          {
            zzet.zza(zzet.this).onAdOpened();
            return;
          }
          catch (RemoteException localRemoteException)
          {
            zzb.zzd("Could not call onAdOpened.", localRemoteException);
          }
        }
      });
      return;
    }
    try
    {
      zzyY.onAdOpened();
      return;
    }
    catch (RemoteException paramMediationInterstitialAdapter)
    {
      zzb.zzd("Could not call onAdOpened.", paramMediationInterstitialAdapter);
    }
  }
  
  public void onReceivedAd(MediationBannerAdapter<?, ?> paramMediationBannerAdapter)
  {
    zzb.zzaC("Adapter called onReceivedAd.");
    if (!zzk.zzcE().zzgI())
    {
      zzb.zzaE("onReceivedAd must be called on the main UI thread.");
      zza.zzIy.post(new Runnable()
      {
        public void run()
        {
          try
          {
            zzet.zza(zzet.this).onAdLoaded();
            return;
          }
          catch (RemoteException localRemoteException)
          {
            zzb.zzd("Could not call onAdLoaded.", localRemoteException);
          }
        }
      });
      return;
    }
    try
    {
      zzyY.onAdLoaded();
      return;
    }
    catch (RemoteException paramMediationBannerAdapter)
    {
      zzb.zzd("Could not call onAdLoaded.", paramMediationBannerAdapter);
    }
  }
  
  public void onReceivedAd(MediationInterstitialAdapter<?, ?> paramMediationInterstitialAdapter)
  {
    zzb.zzaC("Adapter called onReceivedAd.");
    if (!zzk.zzcE().zzgI())
    {
      zzb.zzaE("onReceivedAd must be called on the main UI thread.");
      zza.zzIy.post(new Runnable()
      {
        public void run()
        {
          try
          {
            zzet.zza(zzet.this).onAdLoaded();
            return;
          }
          catch (RemoteException localRemoteException)
          {
            zzb.zzd("Could not call onAdLoaded.", localRemoteException);
          }
        }
      });
      return;
    }
    try
    {
      zzyY.onAdLoaded();
      return;
    }
    catch (RemoteException paramMediationInterstitialAdapter)
    {
      zzb.zzd("Could not call onAdLoaded.", paramMediationInterstitialAdapter);
    }
  }
}
