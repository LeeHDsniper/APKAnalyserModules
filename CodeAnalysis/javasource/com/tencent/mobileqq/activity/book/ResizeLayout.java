package com.tencent.mobileqq.activity.book;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.ScrollView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import lot;

public class ResizeLayout
  extends ScrollView
{
  private ResizeLayout.OnResizeListener jdField_a_of_type_ComTencentMobileqqActivityBookResizeLayout$OnResizeListener;
  private boolean jdField_a_of_type_Boolean;
  
  public ResizeLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = true;
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    if (!jdField_a_of_type_Boolean) {
      return false;
    }
    return super.onInterceptTouchEvent(paramMotionEvent);
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (isInEditMode()) {}
    for (;;)
    {
      return;
      super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
      if (paramInt2 > paramInt4) {}
      for (jdField_a_of_type_Boolean = false; jdField_a_of_type_ComTencentMobileqqActivityBookResizeLayout$OnResizeListener != null; jdField_a_of_type_Boolean = true)
      {
        new Handler(Looper.getMainLooper()).postDelayed(new lot(this, paramInt1, paramInt2, paramInt3, paramInt4), 50L);
        return;
      }
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (!jdField_a_of_type_Boolean) {
      return false;
    }
    return super.onTouchEvent(paramMotionEvent);
  }
  
  public void setOnResizeListener(ResizeLayout.OnResizeListener paramOnResizeListener)
  {
    jdField_a_of_type_ComTencentMobileqqActivityBookResizeLayout$OnResizeListener = paramOnResizeListener;
  }
}
