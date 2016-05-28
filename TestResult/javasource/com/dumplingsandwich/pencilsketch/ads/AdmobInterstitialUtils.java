package com.dumplingsandwich.pencilsketch.ads;

import android.app.Activity;
import com.google.android.gms.ads.AdRequest.Builder;
import com.google.android.gms.ads.InterstitialAd;

public class AdmobInterstitialUtils
{
  private static InterstitialAd interstitialAd;
  
  public static void displayAdmobInterstitial()
  {
    interstitialAd.show();
  }
  
  public static void initializeAdmobInterstitial(Activity paramActivity)
  {
    interstitialAd = new InterstitialAd(paramActivity);
    interstitialAd.setAdUnitId("ca-app-pub-5680507560819481/1233814459");
    paramActivity = new AdRequest.Builder().build();
    interstitialAd.loadAd(paramActivity);
  }
  
  public static boolean isAdmobInterstitialReady()
  {
    return (interstitialAd != null) && (interstitialAd.isLoaded());
  }
}
