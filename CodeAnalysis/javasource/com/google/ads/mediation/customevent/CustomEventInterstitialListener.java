package com.google.ads.mediation.customevent;

@Deprecated
public abstract interface CustomEventInterstitialListener
  extends CustomEventListener
{
  public abstract void onReceivedAd();
}
