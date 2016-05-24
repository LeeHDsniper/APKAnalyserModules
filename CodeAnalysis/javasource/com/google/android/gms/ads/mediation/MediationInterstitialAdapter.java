package com.google.android.gms.ads.mediation;

import android.content.Context;
import android.os.Bundle;

public abstract interface MediationInterstitialAdapter
  extends MediationAdapter
{
  public abstract void requestInterstitialAd(Context paramContext, MediationInterstitialListener paramMediationInterstitialListener, Bundle paramBundle1, MediationAdRequest paramMediationAdRequest, Bundle paramBundle2);
  
  public abstract void showInterstitial();
}
