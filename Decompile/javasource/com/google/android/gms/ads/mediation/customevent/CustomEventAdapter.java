package com.google.android.gms.ads.mediation.customevent;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.mediation.MediationAdRequest;
import com.google.android.gms.ads.mediation.MediationBannerAdapter;
import com.google.android.gms.ads.mediation.MediationBannerListener;
import com.google.android.gms.ads.mediation.MediationInterstitialAdapter;
import com.google.android.gms.ads.mediation.MediationInterstitialListener;
import com.google.android.gms.ads.mediation.NativeAdMapper;
import com.google.android.gms.ads.mediation.NativeMediationAdRequest;
import com.google.android.gms.ads.mediation.zza;

public final class CustomEventAdapter
  implements MediationBannerAdapter, MediationInterstitialAdapter, zza
{
  CustomEventBanner zzJG;
  CustomEventInterstitial zzJH;
  CustomEventNative zzJI;
  private View zzaY;
  
  public CustomEventAdapter() {}
  
  private void zza(View paramView)
  {
    zzaY = paramView;
  }
  
  private static <T> T zzj(String paramString)
  {
    try
    {
      Object localObject = Class.forName(paramString).newInstance();
      return localObject;
    }
    catch (Throwable localThrowable)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("Could not instantiate custom event adapter: " + paramString + ". " + localThrowable.getMessage());
    }
    return null;
  }
  
  public View getBannerView()
  {
    return zzaY;
  }
  
  public void onDestroy()
  {
    if (zzJG != null) {
      zzJG.onDestroy();
    }
    if (zzJH != null) {
      zzJH.onDestroy();
    }
    if (zzJI != null) {
      zzJI.onDestroy();
    }
  }
  
  public void onPause()
  {
    if (zzJG != null) {
      zzJG.onPause();
    }
    if (zzJH != null) {
      zzJH.onPause();
    }
    if (zzJI != null) {
      zzJI.onPause();
    }
  }
  
  public void onResume()
  {
    if (zzJG != null) {
      zzJG.onResume();
    }
    if (zzJH != null) {
      zzJH.onResume();
    }
    if (zzJI != null) {
      zzJI.onResume();
    }
  }
  
  public void requestBannerAd(Context paramContext, MediationBannerListener paramMediationBannerListener, Bundle paramBundle1, AdSize paramAdSize, MediationAdRequest paramMediationAdRequest, Bundle paramBundle2)
  {
    zzJG = ((CustomEventBanner)zzj(paramBundle1.getString("class_name")));
    if (zzJG == null)
    {
      paramMediationBannerListener.onAdFailedToLoad(this, 0);
      return;
    }
    if (paramBundle2 == null) {}
    for (paramBundle2 = null;; paramBundle2 = paramBundle2.getBundle(paramBundle1.getString("class_name")))
    {
      zzJG.requestBannerAd(paramContext, new zza(this, paramMediationBannerListener), paramBundle1.getString("parameter"), paramAdSize, paramMediationAdRequest, paramBundle2);
      return;
    }
  }
  
  public void requestInterstitialAd(Context paramContext, MediationInterstitialListener paramMediationInterstitialListener, Bundle paramBundle1, MediationAdRequest paramMediationAdRequest, Bundle paramBundle2)
  {
    zzJH = ((CustomEventInterstitial)zzj(paramBundle1.getString("class_name")));
    if (zzJH == null)
    {
      paramMediationInterstitialListener.onAdFailedToLoad(this, 0);
      return;
    }
    if (paramBundle2 == null) {}
    for (paramBundle2 = null;; paramBundle2 = paramBundle2.getBundle(paramBundle1.getString("class_name")))
    {
      zzJH.requestInterstitialAd(paramContext, zza(paramMediationInterstitialListener), paramBundle1.getString("parameter"), paramMediationAdRequest, paramBundle2);
      return;
    }
  }
  
  public void requestNativeAd(Context paramContext, com.google.android.gms.ads.mediation.zzb paramZzb, Bundle paramBundle1, NativeMediationAdRequest paramNativeMediationAdRequest, Bundle paramBundle2)
  {
    zzJI = ((CustomEventNative)zzj(paramBundle1.getString("class_name")));
    if (zzJI == null)
    {
      paramZzb.zza(this, 0);
      return;
    }
    if (paramBundle2 == null) {}
    for (paramBundle2 = null;; paramBundle2 = paramBundle2.getBundle(paramBundle1.getString("class_name")))
    {
      zzJI.requestNativeAd(paramContext, new zzc(this, paramZzb), paramBundle1.getString("parameter"), paramNativeMediationAdRequest, paramBundle2);
      return;
    }
  }
  
  public void showInterstitial()
  {
    zzJH.showInterstitial();
  }
  
  zzb zza(MediationInterstitialListener paramMediationInterstitialListener)
  {
    return new zzb(this, paramMediationInterstitialListener);
  }
  
  static final class zza
    implements CustomEventBannerListener
  {
    private final CustomEventAdapter zzJJ;
    private final MediationBannerListener zzaQ;
    
    public zza(CustomEventAdapter paramCustomEventAdapter, MediationBannerListener paramMediationBannerListener)
    {
      zzJJ = paramCustomEventAdapter;
      zzaQ = paramMediationBannerListener;
    }
    
    public void onAdClicked()
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdClicked.");
      zzaQ.onAdClicked(zzJJ);
    }
    
    public void onAdClosed()
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdClosed.");
      zzaQ.onAdClosed(zzJJ);
    }
    
    public void onAdFailedToLoad(int paramInt)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdFailedToLoad.");
      zzaQ.onAdFailedToLoad(zzJJ, paramInt);
    }
    
    public void onAdLeftApplication()
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdLeftApplication.");
      zzaQ.onAdLeftApplication(zzJJ);
    }
    
    public void onAdLoaded(View paramView)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdLoaded.");
      CustomEventAdapter.zza(zzJJ, paramView);
      zzaQ.onAdLoaded(zzJJ);
    }
    
    public void onAdOpened()
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdOpened.");
      zzaQ.onAdOpened(zzJJ);
    }
  }
  
  class zzb
    implements CustomEventInterstitialListener
  {
    private final CustomEventAdapter zzJJ;
    private final MediationInterstitialListener zzaR;
    
    public zzb(CustomEventAdapter paramCustomEventAdapter, MediationInterstitialListener paramMediationInterstitialListener)
    {
      zzJJ = paramCustomEventAdapter;
      zzaR = paramMediationInterstitialListener;
    }
    
    public void onAdClicked()
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdClicked.");
      zzaR.onAdClicked(zzJJ);
    }
    
    public void onAdClosed()
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdClosed.");
      zzaR.onAdClosed(zzJJ);
    }
    
    public void onAdFailedToLoad(int paramInt)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onFailedToReceiveAd.");
      zzaR.onAdFailedToLoad(zzJJ, paramInt);
    }
    
    public void onAdLeftApplication()
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdLeftApplication.");
      zzaR.onAdLeftApplication(zzJJ);
    }
    
    public void onAdLoaded()
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onReceivedAd.");
      zzaR.onAdLoaded(CustomEventAdapter.this);
    }
    
    public void onAdOpened()
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdOpened.");
      zzaR.onAdOpened(zzJJ);
    }
  }
  
  static class zzc
    implements CustomEventNativeListener
  {
    private final CustomEventAdapter zzJJ;
    private final com.google.android.gms.ads.mediation.zzb zzaS;
    
    public zzc(CustomEventAdapter paramCustomEventAdapter, com.google.android.gms.ads.mediation.zzb paramZzb)
    {
      zzJJ = paramCustomEventAdapter;
      zzaS = paramZzb;
    }
    
    public void onAdClicked()
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdClicked.");
      zzaS.zzd(zzJJ);
    }
    
    public void onAdClosed()
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdClosed.");
      zzaS.zzb(zzJJ);
    }
    
    public void onAdFailedToLoad(int paramInt)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdFailedToLoad.");
      zzaS.zza(zzJJ, paramInt);
    }
    
    public void onAdLeftApplication()
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdLeftApplication.");
      zzaS.zzc(zzJJ);
    }
    
    public void onAdLoaded(NativeAdMapper paramNativeAdMapper)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdLoaded.");
      zzaS.zza(zzJJ, paramNativeAdMapper);
    }
    
    public void onAdOpened()
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Custom event adapter called onAdOpened.");
      zzaS.zza(zzJJ);
    }
  }
}
