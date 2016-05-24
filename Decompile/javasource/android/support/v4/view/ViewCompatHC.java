package android.support.v4.view;

import android.animation.ValueAnimator;
import android.graphics.Paint;
import android.view.View;

class ViewCompatHC
{
  public static int combineMeasuredStates(int paramInt1, int paramInt2)
  {
    return View.combineMeasuredStates(paramInt1, paramInt2);
  }
  
  public static float getAlpha(View paramView)
  {
    return paramView.getAlpha();
  }
  
  static long getFrameTime()
  {
    return ValueAnimator.getFrameDelay();
  }
  
  public static int getLayerType(View paramView)
  {
    return paramView.getLayerType();
  }
  
  public static int getMeasuredState(View paramView)
  {
    return paramView.getMeasuredState();
  }
  
  public static float getScaleX(View paramView)
  {
    return paramView.getScaleX();
  }
  
  public static float getTranslationX(View paramView)
  {
    return paramView.getTranslationX();
  }
  
  public static float getTranslationY(View paramView)
  {
    return paramView.getTranslationY();
  }
  
  public static void jumpDrawablesToCurrentState(View paramView)
  {
    paramView.jumpDrawablesToCurrentState();
  }
  
  public static int resolveSizeAndState(int paramInt1, int paramInt2, int paramInt3)
  {
    return View.resolveSizeAndState(paramInt1, paramInt2, paramInt3);
  }
  
  public static void setActivated(View paramView, boolean paramBoolean)
  {
    paramView.setActivated(paramBoolean);
  }
  
  public static void setAlpha(View paramView, float paramFloat)
  {
    paramView.setAlpha(paramFloat);
  }
  
  public static void setLayerType(View paramView, int paramInt, Paint paramPaint)
  {
    paramView.setLayerType(paramInt, paramPaint);
  }
  
  public static void setSaveFromParentEnabled(View paramView, boolean paramBoolean)
  {
    paramView.setSaveFromParentEnabled(paramBoolean);
  }
  
  public static void setScaleX(View paramView, float paramFloat)
  {
    paramView.setScaleX(paramFloat);
  }
  
  public static void setScaleY(View paramView, float paramFloat)
  {
    paramView.setScaleY(paramFloat);
  }
  
  public static void setTranslationX(View paramView, float paramFloat)
  {
    paramView.setTranslationX(paramFloat);
  }
  
  public static void setTranslationY(View paramView, float paramFloat)
  {
    paramView.setTranslationY(paramFloat);
  }
}
