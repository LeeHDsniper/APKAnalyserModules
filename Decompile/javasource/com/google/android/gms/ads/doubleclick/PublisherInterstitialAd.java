package com.google.android.gms.ads.doubleclick;

import android.content.Context;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.internal.client.zzz;

public final class PublisherInterstitialAd
{
  private final zzz zznT = new zzz(paramContext, this);
  
  public PublisherInterstitialAd(Context paramContext) {}
  
  public AdListener getAdListener()
  {
    return zznT.getAdListener();
  }
  
  public String getAdUnitId()
  {
    return zznT.getAdUnitId();
  }
  
  public AppEventListener getAppEventListener()
  {
    return zznT.getAppEventListener();
  }
  
  public String getMediationAdapterClassName()
  {
    return zznT.getMediationAdapterClassName();
  }
  
  public OnCustomRenderedAdLoadedListener getOnCustomRenderedAdLoadedListener()
  {
    return zznT.getOnCustomRenderedAdLoadedListener();
  }
  
  public boolean isLoaded()
  {
    return zznT.isLoaded();
  }
  
  public void loadAd(PublisherAdRequest paramPublisherAdRequest)
  {
    zznT.zza(paramPublisherAdRequest.zzaF());
  }
  
  public void setAdListener(AdListener paramAdListener)
  {
    zznT.setAdListener(paramAdListener);
  }
  
  public void setAdUnitId(String paramString)
  {
    zznT.setAdUnitId(paramString);
  }
  
  public void setAppEventListener(AppEventListener paramAppEventListener)
  {
    zznT.setAppEventListener(paramAppEventListener);
  }
  
  public void setOnCustomRenderedAdLoadedListener(OnCustomRenderedAdLoadedListener paramOnCustomRenderedAdLoadedListener)
  {
    zznT.setOnCustomRenderedAdLoadedListener(paramOnCustomRenderedAdLoadedListener);
  }
  
  public void show()
  {
    zznT.show();
  }
}
