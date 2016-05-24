package com.google.android.gms.ads.mediation.customevent;

public abstract interface CustomEventListener
{
  public abstract void onAdClicked();
  
  public abstract void onAdClosed();
  
  public abstract void onAdFailedToLoad(int paramInt);
  
  public abstract void onAdLeftApplication();
  
  public abstract void onAdOpened();
}
