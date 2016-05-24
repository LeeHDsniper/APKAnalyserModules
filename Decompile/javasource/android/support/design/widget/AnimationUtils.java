package android.support.design.widget;

import android.support.v4.view.animation.FastOutSlowInInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;

class AnimationUtils
{
  static final Interpolator DECELERATE_INTERPOLATOR = new DecelerateInterpolator();
  static final Interpolator FAST_OUT_SLOW_IN_INTERPOLATOR;
  static final Interpolator LINEAR_INTERPOLATOR = new LinearInterpolator();
  
  static
  {
    FAST_OUT_SLOW_IN_INTERPOLATOR = new FastOutSlowInInterpolator();
  }
  
  static int lerp(int paramInt1, int paramInt2, float paramFloat)
  {
    return Math.round((paramInt2 - paramInt1) * paramFloat) + paramInt1;
  }
}
