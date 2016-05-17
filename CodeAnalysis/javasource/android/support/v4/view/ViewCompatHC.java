package android.support.v4.view;

import android.animation.ValueAnimator;
import android.graphics.Paint;
import android.view.View;

class ViewCompatHC
{
  ViewCompatHC() {}
  
  static long getFrameTime()
  {
    return ValueAnimator.getFrameDelay();
  }
  
  public static int getLayerType(View paramView)
  {
    return paramView.getLayerType();
  }
  
  public static void setLayerType(View paramView, int paramInt, Paint paramPaint)
  {
    paramView.setLayerType(paramInt, paramPaint);
  }
}
