package com.facebook.ads;

public abstract interface InterstitialAdListener
  extends AdListener
{
  public abstract void onInterstitialDismissed(Ad paramAd);
  
  public abstract void onInterstitialDisplayed(Ad paramAd);
}
