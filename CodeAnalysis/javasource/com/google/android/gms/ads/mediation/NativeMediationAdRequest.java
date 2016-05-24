package com.google.android.gms.ads.mediation;

import com.google.android.gms.ads.formats.NativeAdOptions;

public abstract interface NativeMediationAdRequest
  extends MediationAdRequest
{
  public abstract NativeAdOptions getNativeAdOptions();
  
  public abstract boolean isAppInstallAdRequested();
  
  public abstract boolean isContentAdRequested();
}
