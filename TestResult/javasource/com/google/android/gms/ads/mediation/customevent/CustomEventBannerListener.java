package com.google.android.gms.ads.mediation.customevent;

import android.view.View;

public abstract interface CustomEventBannerListener
  extends CustomEventListener
{
  public abstract void onAdLoaded(View paramView);
}
