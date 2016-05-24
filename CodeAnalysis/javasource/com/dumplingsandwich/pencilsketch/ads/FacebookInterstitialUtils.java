package com.dumplingsandwich.pencilsketch.ads;

import android.app.Activity;
import com.facebook.ads.InterstitialAd;

public class FacebookInterstitialUtils
{
  private static InterstitialAd facebookInterstitialAd;
  
  public static void displayFacebookInterstitialAd()
  {
    facebookInterstitialAd.show();
  }
  
  public static void initializeFacebookInterstitialAd(Activity paramActivity)
  {
    facebookInterstitialAd = new InterstitialAd(paramActivity, "1170205383008749_1178244322204855");
    facebookInterstitialAd.loadAd();
  }
  
  public static boolean isFacebookInterstitialReady()
  {
    return (facebookInterstitialAd != null) && (facebookInterstitialAd.isAdLoaded());
  }
}
