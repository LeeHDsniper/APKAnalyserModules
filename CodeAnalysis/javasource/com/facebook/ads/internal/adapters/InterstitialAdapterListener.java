package com.facebook.ads.internal.adapters;

import com.facebook.ads.AdError;

public abstract interface InterstitialAdapterListener
{
  public abstract void onInterstitialAdClicked(InterstitialAdapter paramInterstitialAdapter, String paramString, boolean paramBoolean);
  
  public abstract void onInterstitialAdDismissed(InterstitialAdapter paramInterstitialAdapter);
  
  public abstract void onInterstitialAdDisplayed(InterstitialAdapter paramInterstitialAdapter);
  
  public abstract void onInterstitialAdLoaded(InterstitialAdapter paramInterstitialAdapter);
  
  public abstract void onInterstitialError(InterstitialAdapter paramInterstitialAdapter, AdError paramAdError);
  
  public abstract void onInterstitialLoggingImpression(InterstitialAdapter paramInterstitialAdapter);
}
