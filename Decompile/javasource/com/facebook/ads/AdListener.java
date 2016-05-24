package com.facebook.ads;

public abstract interface AdListener
{
  public abstract void onAdClicked(Ad paramAd);
  
  public abstract void onAdLoaded(Ad paramAd);
  
  public abstract void onError(Ad paramAd, AdError paramAdError);
}
