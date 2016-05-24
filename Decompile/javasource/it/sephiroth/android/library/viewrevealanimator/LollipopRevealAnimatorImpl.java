package it.sephiroth.android.library.viewrevealanimator;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.annotation.TargetApi;
import android.graphics.Point;
import android.view.View;
import android.view.ViewAnimationUtils;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnPreDrawListener;

class LollipopRevealAnimatorImpl
  extends RevealAnimatorImpl
{
  private Animator mAnimator;
  private boolean mAnimatorAnimating;
  
  LollipopRevealAnimatorImpl(ViewRevealAnimator paramViewRevealAnimator)
  {
    super(paramViewRevealAnimator);
  }
  
  @TargetApi(21)
  private void circularHide(final int paramInt1, final int paramInt2, final Point paramPoint)
  {
    mAnimatorAnimating = true;
    View localView = parent.getChildAt(paramInt1);
    int j = parent.getViewRadius(localView);
    Point localPoint = parent.getViewCenter(localView);
    int i = j;
    Object localObject = localPoint;
    if (paramPoint != null)
    {
      double d = ViewRevealAnimator.distance(paramPoint, localPoint);
      i = (int)(j + d);
      localObject = new Point(x - localView.getLeft(), y - localView.getTop());
    }
    localObject = ViewAnimationUtils.createCircularReveal(localView, x, y, i, 0.0F);
    ((Animator)localObject).addListener(new AnimatorListenerAdapter()
    {
      boolean isCancelled;
      
      public void onAnimationCancel(Animator paramAnonymousAnimator)
      {
        isCancelled = true;
        LollipopRevealAnimatorImpl.access$002(LollipopRevealAnimatorImpl.this, false);
      }
      
      public void onAnimationEnd(Animator paramAnonymousAnimator)
      {
        if (!isCancelled)
        {
          super.onAnimationEnd(paramAnonymousAnimator);
          LollipopRevealAnimatorImpl.this.circularReveal(paramInt1, paramInt2, true, paramPoint);
        }
      }
      
      public void onAnimationStart(Animator paramAnonymousAnimator)
      {
        super.onAnimationStart(paramAnonymousAnimator);
        parent.onAnimationStarted(paramInt1, paramInt2);
      }
    });
    mAnimator = ((Animator)localObject);
    ((Animator)localObject).setDuration(parent.getAnimationDuration());
    ((Animator)localObject).setInterpolator(parent.getInterpolator());
    ((Animator)localObject).start();
  }
  
  @TargetApi(21)
  private void circularReveal(final int paramInt1, final int paramInt2, final boolean paramBoolean, final Point paramPoint)
  {
    mAnimatorAnimating = true;
    int i;
    final View localView;
    Object localObject1;
    if (!paramBoolean) {
      if (paramInt2 > paramInt1)
      {
        i = 1;
        localObject2 = parent.getChildAt(paramInt2);
        localView = parent.getChildAt(paramInt1);
        if (i == 0) {
          break label108;
        }
        localObject1 = localObject2;
        label46:
        if (!paramBoolean) {
          break label115;
        }
        showOnlyNoAnimation(paramInt1, paramInt2);
      }
    }
    for (;;)
    {
      if ((((View)localObject1).getWidth() != 0) && (((View)localObject1).getHeight() != 0)) {
        break label124;
      }
      ((View)localObject1).getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener()
      {
        public boolean onPreDraw()
        {
          val$targetView.getViewTreeObserver().removeOnPreDrawListener(this);
          if ((val$targetView.getWidth() == 0) || (val$targetView.getHeight() == 0))
          {
            LollipopRevealAnimatorImpl.access$002(LollipopRevealAnimatorImpl.this, false);
            showOnlyNoAnimation(paramInt1, paramInt2);
            parent.onViewChanged(paramInt1, paramInt2);
          }
          for (;;)
          {
            return true;
            LollipopRevealAnimatorImpl.this.circularReveal(paramInt1, paramInt2, paramBoolean, paramPoint);
          }
        }
      });
      return;
      i = 0;
      break;
      i = 1;
      break;
      label108:
      localObject1 = localView;
      break label46;
      label115:
      ((View)localObject2).setVisibility(0);
    }
    label124:
    int k = parent.getViewRadius((View)localObject1);
    Point localPoint = parent.getViewCenter((View)localObject1);
    int j = k;
    Object localObject2 = localPoint;
    if (paramPoint != null)
    {
      double d = ViewRevealAnimator.distance(paramPoint, localPoint);
      j = (int)(k + d);
      localObject2 = new Point(x - ((View)localObject1).getLeft(), y - ((View)localObject1).getTop());
    }
    k = x;
    int m = y;
    float f1;
    if (i != 0)
    {
      f1 = 0.0F;
      if (i == 0) {
        break label319;
      }
    }
    label319:
    for (float f2 = j;; f2 = 0.0F)
    {
      paramPoint = ViewAnimationUtils.createCircularReveal((View)localObject1, k, m, f1, f2);
      paramPoint.addListener(new AnimatorListenerAdapter()
      {
        boolean isCancelled;
        
        public void onAnimationCancel(Animator paramAnonymousAnimator)
        {
          isCancelled = true;
          LollipopRevealAnimatorImpl.access$002(LollipopRevealAnimatorImpl.this, false);
          super.onAnimationCancel(paramAnonymousAnimator);
        }
        
        public void onAnimationEnd(Animator paramAnonymousAnimator)
        {
          super.onAnimationEnd(paramAnonymousAnimator);
          LollipopRevealAnimatorImpl.access$002(LollipopRevealAnimatorImpl.this, false);
          if (!paramBoolean) {
            localView.setVisibility(8);
          }
          if (!isCancelled)
          {
            parent.onAnimationCompleted(paramInt1, paramInt2);
            parent.onViewChanged(paramInt1, paramInt2);
          }
        }
        
        public void onAnimationStart(Animator paramAnonymousAnimator)
        {
          if (!paramBoolean) {
            parent.onAnimationStarted(paramInt1, paramInt2);
          }
        }
      });
      mAnimator = paramPoint;
      paramPoint.setDuration(parent.mAnimationDuration);
      paramPoint.setInterpolator(parent.mInterpolator);
      paramPoint.start();
      return;
      f1 = j;
      break;
    }
  }
  
  public boolean shouldAnimate()
  {
    if (mAnimatorAnimating) {}
    while ((!parent.mAnimateFirstTime) && (parent.mFirstTime)) {
      return false;
    }
    return true;
  }
  
  public void showOnly(int paramInt1, int paramInt2, Point paramPoint)
  {
    if (!parent.getHideBeforeReveal())
    {
      circularReveal(paramInt1, paramInt2, parent.getHideBeforeReveal(), paramPoint);
      return;
    }
    circularHide(paramInt1, paramInt2, paramPoint);
  }
  
  public void showOnlyNoAnimation(int paramInt1, int paramInt2)
  {
    paramInt1 = 0;
    if (paramInt1 < parent.getChildCount())
    {
      View localView = parent.getChildAt(paramInt1);
      if (paramInt1 == paramInt2) {}
      for (int i = 0;; i = 8)
      {
        localView.setVisibility(i);
        paramInt1 += 1;
        break;
      }
    }
    if (mAnimator != null) {
      mAnimator.cancel();
    }
  }
}
