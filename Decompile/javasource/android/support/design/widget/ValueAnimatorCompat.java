package android.support.design.widget;

import android.view.animation.Interpolator;

class ValueAnimatorCompat
{
  private final Impl mImpl;
  
  ValueAnimatorCompat(Impl paramImpl)
  {
    mImpl = paramImpl;
  }
  
  public void cancel()
  {
    mImpl.cancel();
  }
  
  public int getAnimatedIntValue()
  {
    return mImpl.getAnimatedIntValue();
  }
  
  public void setIntValues(int paramInt1, int paramInt2)
  {
    mImpl.setIntValues(paramInt1, paramInt2);
  }
  
  public void setInterpolator(Interpolator paramInterpolator)
  {
    mImpl.setInterpolator(paramInterpolator);
  }
  
  public void setUpdateListener(final AnimatorUpdateListener paramAnimatorUpdateListener)
  {
    if (paramAnimatorUpdateListener != null)
    {
      mImpl.setUpdateListener(new ValueAnimatorCompat.Impl.AnimatorUpdateListenerProxy()
      {
        public void onAnimationUpdate()
        {
          paramAnimatorUpdateListener.onAnimationUpdate(ValueAnimatorCompat.this);
        }
      });
      return;
    }
    mImpl.setUpdateListener(null);
  }
  
  public void start()
  {
    mImpl.start();
  }
  
  static abstract interface AnimatorUpdateListener
  {
    public abstract void onAnimationUpdate(ValueAnimatorCompat paramValueAnimatorCompat);
  }
  
  static abstract interface Creator
  {
    public abstract ValueAnimatorCompat createAnimator();
  }
  
  static abstract class Impl
  {
    Impl() {}
    
    abstract void cancel();
    
    abstract int getAnimatedIntValue();
    
    abstract void setIntValues(int paramInt1, int paramInt2);
    
    abstract void setInterpolator(Interpolator paramInterpolator);
    
    abstract void setUpdateListener(AnimatorUpdateListenerProxy paramAnimatorUpdateListenerProxy);
    
    abstract void start();
    
    static abstract interface AnimatorListenerProxy
    {
      public abstract void onAnimationCancel();
      
      public abstract void onAnimationEnd();
      
      public abstract void onAnimationStart();
    }
    
    static abstract interface AnimatorUpdateListenerProxy
    {
      public abstract void onAnimationUpdate();
    }
  }
}
