package com.google.android.gms.internal;

import com.google.android.gms.ads.purchase.InAppPurchaseListener;

@zzgk
public final class zzfr
  extends zzfm.zza
{
  private final InAppPurchaseListener zztp;
  
  public zzfr(InAppPurchaseListener paramInAppPurchaseListener)
  {
    zztp = paramInAppPurchaseListener;
  }
  
  public void zza(zzfl paramZzfl)
  {
    zztp.onInAppPurchaseRequested(new zzfu(paramZzfl));
  }
}
