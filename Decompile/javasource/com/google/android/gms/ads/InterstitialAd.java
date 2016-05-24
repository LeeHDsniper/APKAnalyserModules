package com.google.android.gms.ads;

import android.content.Context;
import com.google.android.gms.ads.internal.client.zza;
import com.google.android.gms.ads.internal.client.zzz;
import com.google.android.gms.ads.purchase.InAppPurchaseListener;
import com.google.android.gms.ads.purchase.PlayStorePurchaseListener;

public final class InterstitialAd
{
  private final zzz zznT;
  
  public InterstitialAd(Context paramContext)
  {
    zznT = new zzz(paramContext);
  }
  
  public AdListener getAdListener()
  {
    return zznT.getAdListener();
  }
  
  public String getAdUnitId()
  {
    return zznT.getAdUnitId();
  }
  
  public InAppPurchaseListener getInAppPurchaseListener()
  {
    return zznT.getInAppPurchaseListener();
  }
  
  public String getMediationAdapterClassName()
  {
    return zznT.getMediationAdapterClassName();
  }
  
  public boolean isLoaded()
  {
    return zznT.isLoaded();
  }
  
  public boolean isLoading()
  {
    return zznT.isLoading();
  }
  
  public void loadAd(AdRequest paramAdRequest)
  {
    zznT.zza(paramAdRequest.zzaF());
  }
  
  public void setAdListener(AdListener paramAdListener)
  {
    zznT.setAdListener(paramAdListener);
    if ((paramAdListener != null) && ((paramAdListener instanceof zza))) {
      zznT.zza((zza)paramAdListener);
    }
    while (paramAdListener != null) {
      return;
    }
    zznT.zza(null);
  }
  
  public void setAdUnitId(String paramString)
  {
    zznT.setAdUnitId(paramString);
  }
  
  public void setInAppPurchaseListener(InAppPurchaseListener paramInAppPurchaseListener)
  {
    zznT.setInAppPurchaseListener(paramInAppPurchaseListener);
  }
  
  public void setPlayStorePurchaseParams(PlayStorePurchaseListener paramPlayStorePurchaseListener, String paramString)
  {
    zznT.setPlayStorePurchaseParams(paramPlayStorePurchaseListener, paramString);
  }
  
  public void show()
  {
    zznT.show();
  }
}
