package android.support.v4.view;

import android.view.View;
import android.view.ViewParent;

class ViewCompatJB
{
  public static boolean getFitsSystemWindows(View paramView)
  {
    return paramView.getFitsSystemWindows();
  }
  
  public static int getImportantForAccessibility(View paramView)
  {
    return paramView.getImportantForAccessibility();
  }
  
  public static int getMinimumHeight(View paramView)
  {
    return paramView.getMinimumHeight();
  }
  
  public static int getMinimumWidth(View paramView)
  {
    return paramView.getMinimumWidth();
  }
  
  public static ViewParent getParentForAccessibility(View paramView)
  {
    return paramView.getParentForAccessibility();
  }
  
  public static boolean hasTransientState(View paramView)
  {
    return paramView.hasTransientState();
  }
  
  public static void postInvalidateOnAnimation(View paramView)
  {
    paramView.postInvalidateOnAnimation();
  }
  
  public static void postInvalidateOnAnimation(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    paramView.postInvalidate(paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public static void postOnAnimation(View paramView, Runnable paramRunnable)
  {
    paramView.postOnAnimation(paramRunnable);
  }
  
  public static void postOnAnimationDelayed(View paramView, Runnable paramRunnable, long paramLong)
  {
    paramView.postOnAnimationDelayed(paramRunnable, paramLong);
  }
  
  public static void requestApplyInsets(View paramView)
  {
    paramView.requestFitSystemWindows();
  }
  
  public static void setImportantForAccessibility(View paramView, int paramInt)
  {
    paramView.setImportantForAccessibility(paramInt);
  }
}
