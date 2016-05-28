package com.adobe.creativesdk.aviary.widget;

import android.content.Context;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.MotionEvent;

public class NonSwipeableViewPager
  extends ViewPager
{
  public NonSwipeableViewPager(Context paramContext)
  {
    super(paramContext);
  }
  
  public NonSwipeableViewPager(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    return false;
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    return false;
  }
  
  public boolean shouldDelayChildPressedState()
  {
    return false;
  }
}
