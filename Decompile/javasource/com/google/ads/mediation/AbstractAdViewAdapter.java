package com.google.ads.mediation;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import android.view.View;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.AdLoader;
import com.google.android.gms.ads.AdLoader.Builder;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdRequest.Builder;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.InterstitialAd;
import com.google.android.gms.ads.formats.NativeAdOptions;
import com.google.android.gms.ads.formats.NativeAdView;
import com.google.android.gms.ads.formats.NativeAppInstallAd;
import com.google.android.gms.ads.formats.NativeAppInstallAd.OnAppInstallAdLoadedListener;
import com.google.android.gms.ads.formats.NativeContentAd;
import com.google.android.gms.ads.formats.NativeContentAd.OnContentAdLoadedListener;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.mediation.MediationAdRequest;
import com.google.android.gms.ads.mediation.MediationBannerAdapter;
import com.google.android.gms.ads.mediation.MediationBannerListener;
import com.google.android.gms.ads.mediation.MediationInterstitialAdapter;
import com.google.android.gms.ads.mediation.MediationInterstitialListener;
import com.google.android.gms.ads.mediation.NativeAppInstallAdMapper;
import com.google.android.gms.ads.mediation.NativeContentAdMapper;
import com.google.android.gms.ads.mediation.NativeMediationAdRequest;
import com.google.android.gms.ads.mediation.zzb;
import com.google.android.gms.internal.zzgk;
import java.util.Date;
import java.util.Iterator;
import java.util.Set;

@zzgk
public abstract class AbstractAdViewAdapter
  implements MediationBannerAdapter, MediationInterstitialAdapter, com.google.android.gms.ads.mediation.zza
{
  public static final String AD_UNIT_ID_PARAMETER = "pubid";
  protected AdView zzaK;
  protected InterstitialAd zzaL;
  private AdLoader zzaM;
  
  public AbstractAdViewAdapter() {}
  
  public String getAdUnitId(Bundle paramBundle)
  {
    return paramBundle.getString("pubid");
  }
  
  public View getBannerView()
  {
    return zzaK;
  }
  
  public void onDestroy()
  {
    if (zzaK != null)
    {
      zzaK.destroy();
      zzaK = null;
    }
    if (zzaL != null) {
      zzaL = null;
    }
    if (zzaM != null) {
      zzaM = null;
    }
  }
  
  public void onPause()
  {
    if (zzaK != null) {
      zzaK.pause();
    }
  }
  
  public void onResume()
  {
    if (zzaK != null) {
      zzaK.resume();
    }
  }
  
  public void requestBannerAd(Context paramContext, MediationBannerListener paramMediationBannerListener, Bundle paramBundle1, AdSize paramAdSize, MediationAdRequest paramMediationAdRequest, Bundle paramBundle2)
  {
    zzaK = new AdView(paramContext);
    zzaK.setAdSize(new AdSize(paramAdSize.getWidth(), paramAdSize.getHeight()));
    zzaK.setAdUnitId(getAdUnitId(paramBundle1));
    zzaK.setAdListener(new zzc(this, paramMediationBannerListener));
    zzaK.loadAd(zza(paramContext, paramMediationAdRequest, paramBundle2, paramBundle1));
  }
  
  public void requestInterstitialAd(Context paramContext, MediationInterstitialListener paramMediationInterstitialListener, Bundle paramBundle1, MediationAdRequest paramMediationAdRequest, Bundle paramBundle2)
  {
    zzaL = new InterstitialAd(paramContext);
    zzaL.setAdUnitId(getAdUnitId(paramBundle1));
    zzaL.setAdListener(new zzd(this, paramMediationInterstitialListener));
    zzaL.loadAd(zza(paramContext, paramMediationAdRequest, paramBundle2, paramBundle1));
  }
  
  public void requestNativeAd(Context paramContext, zzb paramZzb, Bundle paramBundle1, NativeMediationAdRequest paramNativeMediationAdRequest, Bundle paramBundle2)
  {
    paramZzb = new zze(this, paramZzb);
    AdLoader.Builder localBuilder = zza(paramContext, paramBundle1.getString("pubid")).withAdListener(paramZzb);
    NativeAdOptions localNativeAdOptions = paramNativeMediationAdRequest.getNativeAdOptions();
    if (localNativeAdOptions != null) {
      localBuilder.withNativeAdOptions(localNativeAdOptions);
    }
    if (paramNativeMediationAdRequest.isAppInstallAdRequested()) {
      localBuilder.forAppInstallAd(paramZzb);
    }
    if (paramNativeMediationAdRequest.isContentAdRequested()) {
      localBuilder.forContentAd(paramZzb);
    }
    zzaM = localBuilder.build();
    zzaM.loadAd(zza(paramContext, paramNativeMediationAdRequest, paramBundle2, paramBundle1));
  }
  
  public void showInterstitial()
  {
    zzaL.show();
  }
  
  protected abstract Bundle zza(Bundle paramBundle1, Bundle paramBundle2);
  
  AdLoader.Builder zza(Context paramContext, String paramString)
  {
    return new AdLoader.Builder(paramContext, paramString);
  }
  
  AdRequest zza(Context paramContext, MediationAdRequest paramMediationAdRequest, Bundle paramBundle1, Bundle paramBundle2)
  {
    AdRequest.Builder localBuilder = new AdRequest.Builder();
    Object localObject = paramMediationAdRequest.getBirthday();
    if (localObject != null) {
      localBuilder.setBirthday((Date)localObject);
    }
    int i = paramMediationAdRequest.getGender();
    if (i != 0) {
      localBuilder.setGender(i);
    }
    localObject = paramMediationAdRequest.getKeywords();
    if (localObject != null)
    {
      localObject = ((Set)localObject).iterator();
      while (((Iterator)localObject).hasNext()) {
        localBuilder.addKeyword((String)((Iterator)localObject).next());
      }
    }
    localObject = paramMediationAdRequest.getLocation();
    if (localObject != null) {
      localBuilder.setLocation((Location)localObject);
    }
    if (paramMediationAdRequest.isTesting()) {
      localBuilder.addTestDevice(zzk.zzcE().zzQ(paramContext));
    }
    if (paramMediationAdRequest.taggedForChildDirectedTreatment() != -1) {
      if (paramMediationAdRequest.taggedForChildDirectedTreatment() != 1) {
        break label198;
      }
    }
    label198:
    for (boolean bool = true;; bool = false)
    {
      localBuilder.tagForChildDirectedTreatment(bool);
      localBuilder.addNetworkExtrasBundle(AdMobAdapter.class, zza(paramBundle1, paramBundle2));
      return localBuilder.build();
    }
  }
  
  static class zza
    extends NativeAppInstallAdMapper
  {
    private final NativeAppInstallAd zzaN;
    
    public zza(NativeAppInstallAd paramNativeAppInstallAd)
    {
      zzaN = paramNativeAppInstallAd;
      setHeadline(paramNativeAppInstallAd.getHeadline().toString());
      setImages(paramNativeAppInstallAd.getImages());
      setBody(paramNativeAppInstallAd.getBody().toString());
      setIcon(paramNativeAppInstallAd.getIcon());
      setCallToAction(paramNativeAppInstallAd.getCallToAction().toString());
      setStarRating(paramNativeAppInstallAd.getStarRating().doubleValue());
      setStore(paramNativeAppInstallAd.getStore().toString());
      setPrice(paramNativeAppInstallAd.getPrice().toString());
      setOverrideImpressionRecording(true);
      setOverrideClickHandling(true);
    }
    
    public void trackView(View paramView)
    {
      if ((paramView instanceof NativeAdView)) {
        ((NativeAdView)paramView).setNativeAd(zzaN);
      }
    }
  }
  
  static class zzb
    extends NativeContentAdMapper
  {
    private final NativeContentAd zzaO;
    
    public zzb(NativeContentAd paramNativeContentAd)
    {
      zzaO = paramNativeContentAd;
      setHeadline(paramNativeContentAd.getHeadline().toString());
      setImages(paramNativeContentAd.getImages());
      setBody(paramNativeContentAd.getBody().toString());
      setLogo(paramNativeContentAd.getLogo());
      setCallToAction(paramNativeContentAd.getCallToAction().toString());
      setAdvertiser(paramNativeContentAd.getAdvertiser().toString());
      setOverrideImpressionRecording(true);
      setOverrideClickHandling(true);
    }
    
    public void trackView(View paramView)
    {
      if ((paramView instanceof NativeAdView)) {
        ((NativeAdView)paramView).setNativeAd(zzaO);
      }
    }
  }
  
  static final class zzc
    extends AdListener
    implements com.google.android.gms.ads.internal.client.zza
  {
    final AbstractAdViewAdapter zzaP;
    final MediationBannerListener zzaQ;
    
    public zzc(AbstractAdViewAdapter paramAbstractAdViewAdapter, MediationBannerListener paramMediationBannerListener)
    {
      zzaP = paramAbstractAdViewAdapter;
      zzaQ = paramMediationBannerListener;
    }
    
    public void onAdClicked()
    {
      zzaQ.onAdClicked(zzaP);
    }
    
    public void onAdClosed()
    {
      zzaQ.onAdClosed(zzaP);
    }
    
    public void onAdFailedToLoad(int paramInt)
    {
      zzaQ.onAdFailedToLoad(zzaP, paramInt);
    }
    
    public void onAdLeftApplication()
    {
      zzaQ.onAdLeftApplication(zzaP);
    }
    
    public void onAdLoaded()
    {
      zzaQ.onAdLoaded(zzaP);
    }
    
    public void onAdOpened()
    {
      zzaQ.onAdOpened(zzaP);
    }
  }
  
  static final class zzd
    extends AdListener
    implements com.google.android.gms.ads.internal.client.zza
  {
    final AbstractAdViewAdapter zzaP;
    final MediationInterstitialListener zzaR;
    
    public zzd(AbstractAdViewAdapter paramAbstractAdViewAdapter, MediationInterstitialListener paramMediationInterstitialListener)
    {
      zzaP = paramAbstractAdViewAdapter;
      zzaR = paramMediationInterstitialListener;
    }
    
    public void onAdClicked()
    {
      zzaR.onAdClicked(zzaP);
    }
    
    public void onAdClosed()
    {
      zzaR.onAdClosed(zzaP);
    }
    
    public void onAdFailedToLoad(int paramInt)
    {
      zzaR.onAdFailedToLoad(zzaP, paramInt);
    }
    
    public void onAdLeftApplication()
    {
      zzaR.onAdLeftApplication(zzaP);
    }
    
    public void onAdLoaded()
    {
      zzaR.onAdLoaded(zzaP);
    }
    
    public void onAdOpened()
    {
      zzaR.onAdOpened(zzaP);
    }
  }
  
  static final class zze
    extends AdListener
    implements NativeAppInstallAd.OnAppInstallAdLoadedListener, NativeContentAd.OnContentAdLoadedListener, com.google.android.gms.ads.internal.client.zza
  {
    final AbstractAdViewAdapter zzaP;
    final zzb zzaS;
    
    public zze(AbstractAdViewAdapter paramAbstractAdViewAdapter, zzb paramZzb)
    {
      zzaP = paramAbstractAdViewAdapter;
      zzaS = paramZzb;
    }
    
    public void onAdClicked()
    {
      zzaS.zzd(zzaP);
    }
    
    public void onAdClosed()
    {
      zzaS.zzb(zzaP);
    }
    
    public void onAdFailedToLoad(int paramInt)
    {
      zzaS.zza(zzaP, paramInt);
    }
    
    public void onAdLeftApplication()
    {
      zzaS.zzc(zzaP);
    }
    
    public void onAdLoaded() {}
    
    public void onAdOpened()
    {
      zzaS.zza(zzaP);
    }
    
    public void onAppInstallAdLoaded(NativeAppInstallAd paramNativeAppInstallAd)
    {
      zzaS.zza(zzaP, new AbstractAdViewAdapter.zza(paramNativeAppInstallAd));
    }
    
    public void onContentAdLoaded(NativeContentAd paramNativeContentAd)
    {
      zzaS.zza(zzaP, new AbstractAdViewAdapter.zzb(paramNativeContentAd));
    }
  }
}
