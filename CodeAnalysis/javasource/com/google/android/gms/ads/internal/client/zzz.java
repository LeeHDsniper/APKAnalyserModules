package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.doubleclick.AppEventListener;
import com.google.android.gms.ads.doubleclick.OnCustomRenderedAdLoadedListener;
import com.google.android.gms.ads.doubleclick.PublisherInterstitialAd;
import com.google.android.gms.ads.purchase.InAppPurchaseListener;
import com.google.android.gms.ads.purchase.PlayStorePurchaseListener;
import com.google.android.gms.internal.zzci;
import com.google.android.gms.internal.zzeg;
import com.google.android.gms.internal.zzfr;
import com.google.android.gms.internal.zzfv;

public class zzz
{
  private final Context mContext;
  private final zzg zznK;
  private String zzoZ;
  private AppEventListener zzsK;
  private zza zzsn;
  private AdListener zzso;
  private final zzeg zztk = new zzeg();
  private zzr zztm;
  private String zztn;
  private InAppPurchaseListener zztp;
  private PlayStorePurchaseListener zztq;
  private OnCustomRenderedAdLoadedListener zztr;
  private PublisherInterstitialAd zzts;
  
  public zzz(Context paramContext)
  {
    this(paramContext, zzg.zzcA(), null);
  }
  
  public zzz(Context paramContext, PublisherInterstitialAd paramPublisherInterstitialAd)
  {
    this(paramContext, zzg.zzcA(), paramPublisherInterstitialAd);
  }
  
  public zzz(Context paramContext, zzg paramZzg, PublisherInterstitialAd paramPublisherInterstitialAd)
  {
    mContext = paramContext;
    zznK = paramZzg;
    zzts = paramPublisherInterstitialAd;
  }
  
  private void zzM(String paramString)
    throws RemoteException
  {
    if (zzoZ == null) {
      zzN(paramString);
    }
    zztm = zzk.zzcF().zzb(mContext, new AdSizeParcel(), zzoZ, zztk);
    if (zzso != null) {
      zztm.zza(new zzc(zzso));
    }
    if (zzsn != null) {
      zztm.zza(new zzb(zzsn));
    }
    if (zzsK != null) {
      zztm.zza(new zzi(zzsK));
    }
    if (zztp != null) {
      zztm.zza(new zzfr(zztp));
    }
    if (zztq != null) {
      zztm.zza(new zzfv(zztq), zztn);
    }
    if (zztr != null) {
      zztm.zza(new zzci(zztr));
    }
  }
  
  private void zzN(String paramString)
  {
    if (zztm == null) {
      throw new IllegalStateException("The ad unit ID must be set on InterstitialAd before " + paramString + " is called.");
    }
  }
  
  public AdListener getAdListener()
  {
    return zzso;
  }
  
  public String getAdUnitId()
  {
    return zzoZ;
  }
  
  public AppEventListener getAppEventListener()
  {
    return zzsK;
  }
  
  public InAppPurchaseListener getInAppPurchaseListener()
  {
    return zztp;
  }
  
  public String getMediationAdapterClassName()
  {
    try
    {
      if (zztm != null)
      {
        String str = zztm.getMediationAdapterClassName();
        return str;
      }
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to get the mediation adapter class name.", localRemoteException);
    }
    return null;
  }
  
  public OnCustomRenderedAdLoadedListener getOnCustomRenderedAdLoadedListener()
  {
    return zztr;
  }
  
  public boolean isLoaded()
  {
    try
    {
      if (zztm == null) {
        return false;
      }
      boolean bool = zztm.isReady();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to check if ad is ready.", localRemoteException);
    }
    return false;
  }
  
  public boolean isLoading()
  {
    try
    {
      if (zztm == null) {
        return false;
      }
      boolean bool = zztm.isLoading();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to check if ad is loading.", localRemoteException);
    }
    return false;
  }
  
  public void setAdListener(AdListener paramAdListener)
  {
    try
    {
      zzso = paramAdListener;
      zzr localZzr;
      if (zztm != null)
      {
        localZzr = zztm;
        if (paramAdListener == null) {
          break label38;
        }
      }
      label38:
      for (paramAdListener = new zzc(paramAdListener);; paramAdListener = null)
      {
        localZzr.zza(paramAdListener);
        return;
      }
      return;
    }
    catch (RemoteException paramAdListener)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to set the AdListener.", paramAdListener);
    }
  }
  
  public void setAdUnitId(String paramString)
  {
    if (zzoZ != null) {
      throw new IllegalStateException("The ad unit ID can only be set once on InterstitialAd.");
    }
    zzoZ = paramString;
  }
  
  public void setAppEventListener(AppEventListener paramAppEventListener)
  {
    try
    {
      zzsK = paramAppEventListener;
      zzr localZzr;
      if (zztm != null)
      {
        localZzr = zztm;
        if (paramAppEventListener == null) {
          break label38;
        }
      }
      label38:
      for (paramAppEventListener = new zzi(paramAppEventListener);; paramAppEventListener = null)
      {
        localZzr.zza(paramAppEventListener);
        return;
      }
      return;
    }
    catch (RemoteException paramAppEventListener)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to set the AppEventListener.", paramAppEventListener);
    }
  }
  
  public void setInAppPurchaseListener(InAppPurchaseListener paramInAppPurchaseListener)
  {
    if (zztq != null) {
      throw new IllegalStateException("Play store purchase parameter has already been set.");
    }
    try
    {
      zztp = paramInAppPurchaseListener;
      zzr localZzr;
      if (zztm != null)
      {
        localZzr = zztm;
        if (paramInAppPurchaseListener == null) {
          break label55;
        }
      }
      label55:
      for (paramInAppPurchaseListener = new zzfr(paramInAppPurchaseListener);; paramInAppPurchaseListener = null)
      {
        localZzr.zza(paramInAppPurchaseListener);
        return;
      }
      return;
    }
    catch (RemoteException paramInAppPurchaseListener)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to set the InAppPurchaseListener.", paramInAppPurchaseListener);
    }
  }
  
  public void setOnCustomRenderedAdLoadedListener(OnCustomRenderedAdLoadedListener paramOnCustomRenderedAdLoadedListener)
  {
    try
    {
      zztr = paramOnCustomRenderedAdLoadedListener;
      zzr localZzr;
      if (zztm != null)
      {
        localZzr = zztm;
        if (paramOnCustomRenderedAdLoadedListener == null) {
          break label38;
        }
      }
      label38:
      for (paramOnCustomRenderedAdLoadedListener = new zzci(paramOnCustomRenderedAdLoadedListener);; paramOnCustomRenderedAdLoadedListener = null)
      {
        localZzr.zza(paramOnCustomRenderedAdLoadedListener);
        return;
      }
      return;
    }
    catch (RemoteException paramOnCustomRenderedAdLoadedListener)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to set the OnCustomRenderedAdLoadedListener.", paramOnCustomRenderedAdLoadedListener);
    }
  }
  
  public void setPlayStorePurchaseParams(PlayStorePurchaseListener paramPlayStorePurchaseListener, String paramString)
  {
    if (zztp != null) {
      throw new IllegalStateException("In app purchase parameter has already been set.");
    }
    try
    {
      zztq = paramPlayStorePurchaseListener;
      zztn = paramString;
      zzr localZzr;
      if (zztm != null)
      {
        localZzr = zztm;
        if (paramPlayStorePurchaseListener == null) {
          break label61;
        }
      }
      label61:
      for (paramPlayStorePurchaseListener = new zzfv(paramPlayStorePurchaseListener);; paramPlayStorePurchaseListener = null)
      {
        localZzr.zza(paramPlayStorePurchaseListener, paramString);
        return;
      }
      return;
    }
    catch (RemoteException paramPlayStorePurchaseListener)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to set the play store purchase parameter.", paramPlayStorePurchaseListener);
    }
  }
  
  public void show()
  {
    try
    {
      zzN("show");
      zztm.showInterstitial();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to show interstitial.", localRemoteException);
    }
  }
  
  public void zza(zza paramZza)
  {
    try
    {
      zzsn = paramZza;
      zzr localZzr;
      if (zztm != null)
      {
        localZzr = zztm;
        if (paramZza == null) {
          break label38;
        }
      }
      label38:
      for (paramZza = new zzb(paramZza);; paramZza = null)
      {
        localZzr.zza(paramZza);
        return;
      }
      return;
    }
    catch (RemoteException paramZza)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to set the AdClickListener.", paramZza);
    }
  }
  
  public void zza(zzx paramZzx)
  {
    try
    {
      if (zztm == null) {
        zzM("loadAd");
      }
      if (zztm.zza(zznK.zza(mContext, paramZzx))) {
        zztk.zze(paramZzx.zzcN());
      }
      return;
    }
    catch (RemoteException paramZzx)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to load ad.", paramZzx);
    }
  }
}
