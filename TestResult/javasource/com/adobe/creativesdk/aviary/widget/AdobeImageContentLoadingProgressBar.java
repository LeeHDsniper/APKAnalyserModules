package com.adobe.creativesdk.aviary.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ProgressBar;

public class AdobeImageContentLoadingProgressBar
  extends ProgressBar
{
  private final Runnable mDelayedHide = new Runnable()
  {
    public void run()
    {
      AdobeImageContentLoadingProgressBar.access$002(AdobeImageContentLoadingProgressBar.this, -1L);
      setVisibility(8);
    }
  };
  private final Runnable mDelayedShow = new Runnable()
  {
    public void run()
    {
      if (!mDismissed)
      {
        AdobeImageContentLoadingProgressBar.access$002(AdobeImageContentLoadingProgressBar.this, System.currentTimeMillis());
        setVisibility(0);
      }
    }
  };
  private boolean mDismissed = false;
  private long mStartTime = -1L;
  
  public AdobeImageContentLoadingProgressBar(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public AdobeImageContentLoadingProgressBar(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet, 0);
  }
  
  private void removeCallbacks()
  {
    removeCallbacks(mDelayedHide);
    removeCallbacks(mDelayedShow);
  }
  
  public void hide()
  {
    mDismissed = true;
    removeCallbacks(mDelayedShow);
    long l = System.currentTimeMillis() - mStartTime;
    if ((l >= 500L) || (mStartTime == -1L))
    {
      setVisibility(8);
      return;
    }
    postDelayed(mDelayedHide, 500L - l);
  }
  
  public void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    removeCallbacks();
  }
  
  public void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    removeCallbacks();
  }
  
  public void show()
  {
    mStartTime = -1L;
    mDismissed = false;
    removeCallbacks(mDelayedHide);
    postDelayed(mDelayedShow, 500L);
  }
}
