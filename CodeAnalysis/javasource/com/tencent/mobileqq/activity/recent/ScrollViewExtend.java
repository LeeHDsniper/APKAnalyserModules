package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ScrollView;

public class ScrollViewExtend
  extends ScrollView
{
  private float a;
  private float c;
  private float d;
  private float e;
  
  public ScrollViewExtend(Context paramContext)
  {
    this(paramContext, null);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ScrollViewExtend(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public ScrollViewExtend(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    try
    {
      setFillViewport(true);
      setFadingEdgeLength(0);
      setHorizontalFadingEdgeEnabled(false);
      setVerticalFadingEdgeEnabled(false);
      setHorizontalScrollBarEnabled(false);
      setVerticalScrollBarEnabled(false);
      return;
    }
    catch (Exception paramContext)
    {
      paramContext.printStackTrace();
    }
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    switch (paramMotionEvent.getAction())
    {
    }
    do
    {
      for (;;)
      {
        return super.onInterceptTouchEvent(paramMotionEvent);
        c = 0.0F;
        a = 0.0F;
        d = paramMotionEvent.getX();
        e = paramMotionEvent.getY();
      }
      float f1 = paramMotionEvent.getX();
      float f2 = paramMotionEvent.getY();
      a += Math.abs(f1 - d);
      c += Math.abs(f2 - e);
      d = f1;
      e = f2;
    } while (a <= c);
    return false;
  }
}
