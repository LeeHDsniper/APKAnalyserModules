package android.support.v4.view;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import android.view.ViewPropertyAnimator;
import android.view.animation.Interpolator;

class ViewPropertyAnimatorCompatICS
{
  public static void alpha(View paramView, float paramFloat)
  {
    paramView.animate().alpha(paramFloat);
  }
  
  public static void cancel(View paramView)
  {
    paramView.animate().cancel();
  }
  
  public static void scaleY(View paramView, float paramFloat)
  {
    paramView.animate().scaleY(paramFloat);
  }
  
  public static void setDuration(View paramView, long paramLong)
  {
    paramView.animate().setDuration(paramLong);
  }
  
  public static void setInterpolator(View paramView, Interpolator paramInterpolator)
  {
    paramView.animate().setInterpolator(paramInterpolator);
  }
  
  public static void setListener(final View paramView, ViewPropertyAnimatorListener paramViewPropertyAnimatorListener)
  {
    if (paramViewPropertyAnimatorListener != null)
    {
      paramView.animate().setListener(new AnimatorListenerAdapter()
      {
        public void onAnimationCancel(Animator paramAnonymousAnimator)
        {
          val$listener.onAnimationCancel(paramView);
        }
        
        public void onAnimationEnd(Animator paramAnonymousAnimator)
        {
          val$listener.onAnimationEnd(paramView);
        }
        
        public void onAnimationStart(Animator paramAnonymousAnimator)
        {
          val$listener.onAnimationStart(paramView);
        }
      });
      return;
    }
    paramView.animate().setListener(null);
  }
  
  public static void setStartDelay(View paramView, long paramLong)
  {
    paramView.animate().setStartDelay(paramLong);
  }
  
  public static void start(View paramView)
  {
    paramView.animate().start();
  }
  
  public static void translationX(View paramView, float paramFloat)
  {
    paramView.animate().translationX(paramFloat);
  }
  
  public static void translationY(View paramView, float paramFloat)
  {
    paramView.animate().translationY(paramFloat);
  }
}
