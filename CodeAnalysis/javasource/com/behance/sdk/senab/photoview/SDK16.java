package com.behance.sdk.senab.photoview;

import android.annotation.TargetApi;
import android.view.View;

@TargetApi(16)
public class SDK16
{
  public static void postOnAnimation(View paramView, Runnable paramRunnable)
  {
    paramView.postOnAnimation(paramRunnable);
  }
}
