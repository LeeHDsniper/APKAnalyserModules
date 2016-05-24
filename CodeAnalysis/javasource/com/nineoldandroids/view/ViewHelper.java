package com.nineoldandroids.view;

import android.view.View;
import com.nineoldandroids.view.animation.AnimatorProxy;

public final class ViewHelper
{
  public static float getAlpha(View paramView)
  {
    if (AnimatorProxy.NEEDS_PROXY) {
      return AnimatorProxy.wrap(paramView).getAlpha();
    }
    return Honeycomb.getAlpha(paramView);
  }
  
  public static void setTranslationX(View paramView, float paramFloat)
  {
    if (AnimatorProxy.NEEDS_PROXY)
    {
      AnimatorProxy.wrap(paramView).setTranslationX(paramFloat);
      return;
    }
    Honeycomb.setTranslationX(paramView, paramFloat);
  }
  
  public static void setTranslationY(View paramView, float paramFloat)
  {
    if (AnimatorProxy.NEEDS_PROXY)
    {
      AnimatorProxy.wrap(paramView).setTranslationY(paramFloat);
      return;
    }
    Honeycomb.setTranslationY(paramView, paramFloat);
  }
  
  private static final class Honeycomb
  {
    static float getAlpha(View paramView)
    {
      return paramView.getAlpha();
    }
    
    static void setTranslationX(View paramView, float paramFloat)
    {
      paramView.setTranslationX(paramFloat);
    }
    
    static void setTranslationY(View paramView, float paramFloat)
    {
      paramView.setTranslationY(paramFloat);
    }
  }
}
