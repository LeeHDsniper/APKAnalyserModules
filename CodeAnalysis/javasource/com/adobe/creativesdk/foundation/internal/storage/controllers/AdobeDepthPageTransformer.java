package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPager.PageTransformer;
import android.view.View;

public class AdobeDepthPageTransformer
  implements ViewPager.PageTransformer
{
  public AdobeDepthPageTransformer() {}
  
  public void transformPage(View paramView, float paramFloat)
  {
    int i = paramView.getWidth();
    if (paramFloat < -1.0F)
    {
      ViewCompat.setAlpha(paramView, 0.0F);
      return;
    }
    if (paramFloat <= 0.0F)
    {
      ViewCompat.setAlpha(paramView, 1.0F);
      ViewCompat.setTranslationX(paramView, 0.0F);
      ViewCompat.setScaleX(paramView, 1.0F);
      ViewCompat.setScaleY(paramView, 1.0F);
      return;
    }
    if (paramFloat <= 1.0F)
    {
      ViewCompat.setAlpha(paramView, 1.0F - paramFloat);
      ViewCompat.setTranslationX(paramView, i * -paramFloat);
      paramFloat = 0.75F + 0.25F * (1.0F - Math.abs(paramFloat));
      ViewCompat.setScaleX(paramView, paramFloat);
      ViewCompat.setScaleY(paramView, paramFloat);
      return;
    }
    ViewCompat.setAlpha(paramView, 0.0F);
  }
}
