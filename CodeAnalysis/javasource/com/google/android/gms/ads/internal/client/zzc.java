package com.google.android.gms.ads.internal.client;

import com.google.android.gms.ads.AdListener;
import com.google.android.gms.internal.zzgk;

@zzgk
public final class zzc
  extends zzn.zza
{
  private final AdListener zzso;
  
  public zzc(AdListener paramAdListener)
  {
    zzso = paramAdListener;
  }
  
  public void onAdClosed()
  {
    zzso.onAdClosed();
  }
  
  public void onAdFailedToLoad(int paramInt)
  {
    zzso.onAdFailedToLoad(paramInt);
  }
  
  public void onAdLeftApplication()
  {
    zzso.onAdLeftApplication();
  }
  
  public void onAdLoaded()
  {
    zzso.onAdLoaded();
  }
  
  public void onAdOpened()
  {
    zzso.onAdOpened();
  }
}
