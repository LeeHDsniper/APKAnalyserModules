package android.support.v4.view;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import android.view.ViewPropertyAnimator;

class ViewPropertyAnimatorCompatJB
{
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
}
