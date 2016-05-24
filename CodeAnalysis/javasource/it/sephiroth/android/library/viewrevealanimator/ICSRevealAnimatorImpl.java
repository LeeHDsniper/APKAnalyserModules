package it.sephiroth.android.library.viewrevealanimator;

import android.graphics.Point;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;

public class ICSRevealAnimatorImpl
  extends RevealAnimatorImpl
{
  ICSRevealAnimatorImpl(ViewRevealAnimator paramViewRevealAnimator)
  {
    super(paramViewRevealAnimator);
  }
  
  public boolean isAnimating()
  {
    return ((parent.mInAnimation != null) && (parent.mInAnimation.hasStarted()) && (!parent.mInAnimation.hasEnded())) || ((parent.mOutAnimation != null) && (parent.mOutAnimation.hasStarted()) && (!parent.mOutAnimation.hasEnded()));
  }
  
  public boolean shouldAnimate()
  {
    return ((!parent.mFirstTime) || (parent.mAnimateFirstTime)) && (!isAnimating()) && (parent.mInAnimation != null) && (parent.mOutAnimation != null);
  }
  
  public void showOnly(int paramInt1, int paramInt2, Point paramPoint)
  {
    parent.mInAnimation.setAnimationListener(new MyAnimationListener(paramInt1, paramInt2));
    int i = parent.getChildCount();
    paramInt1 = 0;
    while (paramInt1 < i)
    {
      paramPoint = parent.getChildAt(paramInt1);
      if (paramInt1 == paramInt2)
      {
        if (parent.mInAnimation != null) {
          paramPoint.startAnimation(parent.mInAnimation);
        }
        paramPoint.setVisibility(0);
        parent.mFirstTime = false;
        paramInt1 += 1;
      }
      else
      {
        if ((parent.mOutAnimation != null) && (paramPoint.getVisibility() == 0)) {
          paramPoint.startAnimation(parent.mOutAnimation);
        }
        for (;;)
        {
          paramPoint.setVisibility(8);
          break;
          if (paramPoint.getAnimation() == parent.mInAnimation)
          {
            parent.mInAnimation.setAnimationListener(null);
            paramPoint.clearAnimation();
          }
        }
      }
    }
  }
  
  public void showOnlyNoAnimation(int paramInt1, int paramInt2)
  {
    paramInt1 = 0;
    if (paramInt1 < parent.getChildCount())
    {
      View localView = parent.getChildAt(paramInt1);
      int i;
      if (paramInt1 == paramInt2)
      {
        i = 0;
        label30:
        localView.setVisibility(i);
        if (localView.getAnimation() != parent.mInAnimation) {
          break label80;
        }
        parent.mInAnimation.setAnimationListener(null);
        localView.clearAnimation();
      }
      for (;;)
      {
        paramInt1 += 1;
        break;
        i = 8;
        break label30;
        label80:
        if (localView.getAnimation() == parent.mOutAnimation) {
          localView.clearAnimation();
        }
      }
    }
  }
  
  class MyAnimationListener
    implements Animation.AnimationListener
  {
    final int childIndex;
    final int prevIndex;
    
    public MyAnimationListener(int paramInt1, int paramInt2)
    {
      prevIndex = paramInt1;
      childIndex = paramInt2;
    }
    
    public void onAnimationEnd(Animation paramAnimation)
    {
      parent.onAnimationCompleted(prevIndex, childIndex);
      parent.onViewChanged(prevIndex, childIndex);
    }
    
    public void onAnimationRepeat(Animation paramAnimation) {}
    
    public void onAnimationStart(Animation paramAnimation)
    {
      parent.onAnimationStarted(prevIndex, childIndex);
    }
  }
}
