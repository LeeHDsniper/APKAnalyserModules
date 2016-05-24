package com.google.android.gms.internal;

import com.google.android.gms.ads.purchase.PlayStorePurchaseListener;

@zzgk
public final class zzfv
  extends zzfq.zza
{
  private final PlayStorePurchaseListener zztq;
  
  public zzfv(PlayStorePurchaseListener paramPlayStorePurchaseListener)
  {
    zztq = paramPlayStorePurchaseListener;
  }
  
  public boolean isValidPurchase(String paramString)
  {
    return zztq.isValidPurchase(paramString);
  }
  
  public void zza(zzfp paramZzfp)
  {
    zztq.onInAppPurchaseFinished(new zzft(paramZzfp));
  }
}
