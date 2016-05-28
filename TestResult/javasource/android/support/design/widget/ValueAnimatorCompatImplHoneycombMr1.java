package android.support.design.widget;

import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.view.animation.Interpolator;

class ValueAnimatorCompatImplHoneycombMr1
  extends ValueAnimatorCompat.Impl
{
  final ValueAnimator mValueAnimator = new ValueAnimator();
  
  ValueAnimatorCompatImplHoneycombMr1() {}
  
  public void cancel()
  {
    mValueAnimator.cancel();
  }
  
  public int getAnimatedIntValue()
  {
    return ((Integer)mValueAnimator.getAnimatedValue()).intValue();
  }
  
  public void setIntValues(int paramInt1, int paramInt2)
  {
    mValueAnimator.setIntValues(new int[] { paramInt1, paramInt2 });
  }
  
  public void setInterpolator(Interpolator paramInterpolator)
  {
    mValueAnimator.setInterpolator(paramInterpolator);
  }
  
  public void setUpdateListener(final ValueAnimatorCompat.Impl.AnimatorUpdateListenerProxy paramAnimatorUpdateListenerProxy)
  {
    mValueAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener()
    {
      public void onAnimationUpdate(ValueAnimator paramAnonymousValueAnimator)
      {
        paramAnimatorUpdateListenerProxy.onAnimationUpdate();
      }
    });
  }
  
  public void start()
  {
    mValueAnimator.start();
  }
}
