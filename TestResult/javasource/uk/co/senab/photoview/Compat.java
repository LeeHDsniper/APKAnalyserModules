package uk.co.senab.photoview;

import android.annotation.TargetApi;
import android.os.Build.VERSION;
import android.view.View;

public class Compat
{
  public static int getPointerIndex(int paramInt)
  {
    if (Build.VERSION.SDK_INT >= 11) {
      return getPointerIndexHoneyComb(paramInt);
    }
    return getPointerIndexEclair(paramInt);
  }
  
  @TargetApi(5)
  private static int getPointerIndexEclair(int paramInt)
  {
    return (0xFF00 & paramInt) >> 8;
  }
  
  @TargetApi(11)
  private static int getPointerIndexHoneyComb(int paramInt)
  {
    return (0xFF00 & paramInt) >> 8;
  }
  
  public static void postOnAnimation(View paramView, Runnable paramRunnable)
  {
    if (Build.VERSION.SDK_INT >= 16)
    {
      postOnAnimationJellyBean(paramView, paramRunnable);
      return;
    }
    paramView.postDelayed(paramRunnable, 16L);
  }
  
  @TargetApi(16)
  private static void postOnAnimationJellyBean(View paramView, Runnable paramRunnable)
  {
    paramView.postOnAnimation(paramRunnable);
  }
}
