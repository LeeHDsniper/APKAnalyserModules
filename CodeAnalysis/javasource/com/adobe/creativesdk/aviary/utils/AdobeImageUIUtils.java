package com.adobe.creativesdk.aviary.utils;

import android.content.Context;
import android.widget.TextView;
import com.adobe.android.ui.widget.AdobeCustomToast;
import com.aviary.android.feather.sdk.R.layout;
import com.nineoldandroids.animation.ArgbEvaluator;
import com.nineoldandroids.animation.ValueAnimator;
import com.nineoldandroids.animation.ValueAnimator.AnimatorUpdateListener;

public final class AdobeImageUIUtils
{
  public static void animateTextColor(TextView paramTextView, int paramInt, long paramLong)
  {
    ValueAnimator localValueAnimator = ValueAnimator.ofObject(new ArgbEvaluator(), new Object[] { Integer.valueOf(paramTextView.getCurrentTextColor()), Integer.valueOf(paramInt) });
    localValueAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener()
    {
      public void onAnimationUpdate(ValueAnimator paramAnonymousValueAnimator)
      {
        val$textView.setTextColor(((Integer)paramAnonymousValueAnimator.getAnimatedValue()).intValue());
      }
    });
    localValueAnimator.setDuration(paramLong);
    localValueAnimator.start();
  }
  
  public static AdobeCustomToast createModalLoaderToast(Context paramContext)
  {
    return AdobeCustomToast.make(paramContext, R.layout.com_adobe_image_modal_progress_view, -1);
  }
}
