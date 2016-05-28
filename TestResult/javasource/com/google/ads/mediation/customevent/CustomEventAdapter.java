package com.google.ads.mediation.customevent;

import android.app.Activity;
import android.view.View;
import com.google.ads.AdRequest.ErrorCode;
import com.google.ads.AdSize;
import com.google.ads.mediation.MediationAdRequest;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationBannerListener;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationInterstitialListener;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.mediation.customevent.CustomEventExtras;

public final class CustomEventAdapter
  implements MediationBannerAdapter<CustomEventExtras, CustomEventServerParameters>, MediationInterstitialAdapter<CustomEventExtras, CustomEventServerParameters>
{
  private View zzaY;
  CustomEventBanner zzaZ;
  CustomEventInterstitial zzba;
  
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
      zzb.zzaE("Could not instantiate custom event adapter: " + paramString + ". " + localThrowable.getMessage());
    }
    return null;
  }
  
  public void destroy()
  {
    if (zzaZ != null) {
      zzaZ.destroy();
    }
    if (zzba != null) {
      zzba.destroy();
    }
  }
  
  public Class<CustomEventExtras> getAdditionalParametersType()
  {
    return CustomEventExtras.class;
  }
  
  public View getBannerView()
  {
    return zzaY;
  }
  
  public Class<CustomEventServerParameters> getServerParametersType()
  {
    return CustomEventServerParameters.class;
  }
  
  public void requestBannerAd(MediationBannerListener paramMediationBannerListener, Activity paramActivity, CustomEventServerParameters paramCustomEventServerParameters, AdSize paramAdSize, MediationAdRequest paramMediationAdRequest, CustomEventExtras paramCustomEventExtras)
  {
    zzaZ = ((CustomEventBanner)zzj(className));
    if (zzaZ == null)
    {
      paramMediationBannerListener.onFailedToReceiveAd(this, AdRequest.ErrorCode.INTERNAL_ERROR);
      return;
    }
    if (paramCustomEventExtras == null) {}
    for (paramCustomEventExtras = null;; paramCustomEventExtras = paramCustomEventExtras.getExtra(label))
    {
      zzaZ.requestBannerAd(new zza(this, paramMediationBannerListener), paramActivity, label, parameter, paramAdSize, paramMediationAdRequest, paramCustomEventExtras);
      return;
    }
  }
  
  public void requestInterstitialAd(MediationInterstitialListener paramMediationInterstitialListener, Activity paramActivity, CustomEventServerParameters paramCustomEventServerParameters, MediationAdRequest paramMediationAdRequest, CustomEventExtras paramCustomEventExtras)
  {
    zzba = ((CustomEventInterstitial)zzj(className));
    if (zzba == null)
    {
      paramMediationInterstitialListener.onFailedToReceiveAd(this, AdRequest.ErrorCode.INTERNAL_ERROR);
      return;
    }
    if (paramCustomEventExtras == null) {}
    for (paramCustomEventExtras = null;; paramCustomEventExtras = paramCustomEventExtras.getExtra(label))
    {
      zzba.requestInterstitialAd(zza(paramMediationInterstitialListener), paramActivity, label, parameter, paramMediationAdRequest, paramCustomEventExtras);
      return;
    }
  }
  
  public void showInterstitial()
  {
    zzba.showInterstitial();
  }
  
  zzb zza(MediationInterstitialListener paramMediationInterstitialListener)
  {
    return new zzb(this, paramMediationInterstitialListener);
  }
  
  static final class zza
    implements CustomEventBannerListener
  {
    private final CustomEventAdapter zzbb;
    private final MediationBannerListener zzbc;
    
    public zza(CustomEventAdapter paramCustomEventAdapter, MediationBannerListener paramMediationBannerListener)
    {
      zzbb = paramCustomEventAdapter;
      zzbc = paramMediationBannerListener;
    }
    
    public void onClick()
    {
      zzb.zzaC("Custom event adapter called onFailedToReceiveAd.");
      zzbc.onClick(zzbb);
    }
    
    public void onDismissScreen()
    {
      zzb.zzaC("Custom event adapter called onFailedToReceiveAd.");
      zzbc.onDismissScreen(zzbb);
    }
    
    public void onFailedToReceiveAd()
    {
      zzb.zzaC("Custom event adapter called onFailedToReceiveAd.");
      zzbc.onFailedToReceiveAd(zzbb, AdRequest.ErrorCode.NO_FILL);
    }
    
    public void onLeaveApplication()
    {
      zzb.zzaC("Custom event adapter called onFailedToReceiveAd.");
      zzbc.onLeaveApplication(zzbb);
    }
    
    public void onPresentScreen()
    {
      zzb.zzaC("Custom event adapter called onFailedToReceiveAd.");
      zzbc.onPresentScreen(zzbb);
    }
    
    public void onReceivedAd(View paramView)
    {
      zzb.zzaC("Custom event adapter called onReceivedAd.");
      CustomEventAdapter.zza(zzbb, paramView);
      zzbc.onReceivedAd(zzbb);
    }
  }
  
  class zzb
    implements CustomEventInterstitialListener
  {
    private final CustomEventAdapter zzbb;
    private final MediationInterstitialListener zzbd;
    
    public zzb(CustomEventAdapter paramCustomEventAdapter, MediationInterstitialListener paramMediationInterstitialListener)
    {
      zzbb = paramCustomEventAdapter;
      zzbd = paramMediationInterstitialListener;
    }
    
    public void onDismissScreen()
    {
      zzb.zzaC("Custom event adapter called onDismissScreen.");
      zzbd.onDismissScreen(zzbb);
    }
    
    public void onFailedToReceiveAd()
    {
      zzb.zzaC("Custom event adapter called onFailedToReceiveAd.");
      zzbd.onFailedToReceiveAd(zzbb, AdRequest.ErrorCode.NO_FILL);
    }
    
    public void onLeaveApplication()
    {
      zzb.zzaC("Custom event adapter called onLeaveApplication.");
      zzbd.onLeaveApplication(zzbb);
    }
    
    public void onPresentScreen()
    {
      zzb.zzaC("Custom event adapter called onPresentScreen.");
      zzbd.onPresentScreen(zzbb);
    }
    
    public void onReceivedAd()
    {
      zzb.zzaC("Custom event adapter called onReceivedAd.");
      zzbd.onReceivedAd(CustomEventAdapter.this);
    }
  }
}
