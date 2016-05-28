package com.behance.sdk.senab.photoview;

import android.os.Build.VERSION;
import android.view.View;

public class Compat
{
  public static void postOnAnimation(View paramView, Runnable paramRunnable)
  {
    if (Build.VERSION.SDK_INT >= 16)
    {
      SDK16.postOnAnimation(paramView, paramRunnable);
      return;
    }
    paramView.postDelayed(paramRunnable, 16L);
  }
}
