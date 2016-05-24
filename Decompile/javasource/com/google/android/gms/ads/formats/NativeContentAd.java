package com.google.android.gms.ads.formats;

import android.os.Bundle;
import java.util.List;

public abstract class NativeContentAd
  extends NativeAd
{
  public NativeContentAd() {}
  
  public abstract CharSequence getAdvertiser();
  
  public abstract CharSequence getBody();
  
  public abstract CharSequence getCallToAction();
  
  public abstract Bundle getExtras();
  
  public abstract CharSequence getHeadline();
  
  public abstract List<NativeAd.Image> getImages();
  
  public abstract NativeAd.Image getLogo();
  
  public static abstract interface OnContentAdLoadedListener
  {
    public abstract void onContentAdLoaded(NativeContentAd paramNativeContentAd);
  }
}
