package com.adobe.creativesdk.foundation.internal.storage.controllers.multipage;

import android.content.Context;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.MotionEvent;

public class AdobeHackyViewPager
  extends ViewPager
{
  public AdobeHackyViewPager(Context paramContext)
  {
    super(paramContext);
  }
  
  public AdobeHackyViewPager(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    try
    {
      boolean bool = super.onInterceptTouchEvent(paramMotionEvent);
      return bool;
    }
    catch (IllegalArgumentException paramMotionEvent)
    {
      return false;
    }
    catch (ArrayIndexOutOfBoundsException paramMotionEvent)
    {
      for (;;) {}
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    try
    {
      boolean bool = super.onTouchEvent(paramMotionEvent);
      return bool;
    }
    catch (IllegalArgumentException paramMotionEvent)
    {
      return false;
    }
    catch (ArrayIndexOutOfBoundsException paramMotionEvent)
    {
      for (;;) {}
    }
  }
}
