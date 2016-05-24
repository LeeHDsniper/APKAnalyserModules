package com.google.android.gms.ads.mediation.customevent;

import com.google.android.gms.ads.mediation.NativeAdMapper;

public abstract interface CustomEventNativeListener
  extends CustomEventListener
{
  public abstract void onAdLoaded(NativeAdMapper paramNativeAdMapper);
}
