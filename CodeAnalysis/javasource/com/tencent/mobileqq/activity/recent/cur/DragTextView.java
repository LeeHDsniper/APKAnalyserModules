package com.tencent.mobileqq.activity.recent.cur;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import mia;

public class DragTextView
  extends TextView
  implements IDragView
{
  private static int f = 0;
  private static int g;
  private static int h;
  private Rect jdField_a_of_type_AndroidGraphicsRect = null;
  private View jdField_a_of_type_AndroidViewView = null;
  private IDragView.OnChangeModeListener jdField_a_of_type_ComTencentMobileqqActivityRecentCurIDragView$OnChangeModeListener;
  private boolean jdField_a_of_type_Boolean;
  private int i = -1;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public DragTextView(Context paramContext)
  {
    super(paramContext);
    a(paramContext);
  }
  
  public DragTextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    a(paramContext);
  }
  
  public DragTextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    a(paramContext);
  }
  
  private static void a(Context paramContext)
  {
    if (f == 0)
    {
      float f1 = 16.0F * getResourcesgetDisplayMetricsdensity;
      f = (int)f1;
      g = (int)(1.5F * f1);
      h = (int)(f1 * 0.5F);
    }
  }
  
  private void a(View paramView, Rect paramRect)
  {
    Rect localRect = new Rect();
    paramView.getGlobalVisibleRect(localRect);
    super.getGlobalVisibleRect(paramRect);
    if (i == 2)
    {
      top = (top - top - f);
      left = (left - left - h);
      bottom = (bottom - top + h);
      right = (right - left + f);
      return;
    }
    top = (top - top - g);
    left = (left - left - g);
    bottom = (bottom - top + f);
    right = (right - left + f);
  }
  
  public int a()
  {
    return i;
  }
  
  public IDragView.OnChangeModeListener a()
  {
    return jdField_a_of_type_ComTencentMobileqqActivityRecentCurIDragView$OnChangeModeListener;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    if ((jdField_a_of_type_AndroidGraphicsRect != null) && (paramBoolean)) {
      a(jdField_a_of_type_AndroidViewView, jdField_a_of_type_AndroidGraphicsRect);
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if ((i != -1) && (!jdField_a_of_type_Boolean) && (paramMotionEvent.getAction() == 0))
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentCurIDragView$OnChangeModeListener != null)
      {
        jdField_a_of_type_Boolean = true;
        jdField_a_of_type_ComTencentMobileqqActivityRecentCurIDragView$OnChangeModeListener.a(this, i);
        return true;
      }
      return super.onTouchEvent(paramMotionEvent);
    }
    return super.onTouchEvent(paramMotionEvent);
  }
  
  public void setDragViewType(int paramInt)
  {
    setDragViewType(paramInt, null);
  }
  
  public void setDragViewType(int paramInt, View paramView)
  {
    i = paramInt;
    jdField_a_of_type_AndroidViewView = paramView;
    if (jdField_a_of_type_AndroidViewView == null) {
      jdField_a_of_type_AndroidViewView = ((ViewGroup)getParent());
    }
    if ((jdField_a_of_type_ComTencentMobileqqActivityRecentCurIDragView$OnChangeModeListener != null) && (jdField_a_of_type_AndroidViewView != null) && (jdField_a_of_type_AndroidGraphicsRect == null))
    {
      jdField_a_of_type_AndroidGraphicsRect = new Rect();
      jdField_a_of_type_AndroidViewView.setTouchDelegate(new mia(this, jdField_a_of_type_AndroidGraphicsRect, this));
    }
  }
  
  public void setOnModeChangeListener(IDragView.OnChangeModeListener paramOnChangeModeListener)
  {
    jdField_a_of_type_ComTencentMobileqqActivityRecentCurIDragView$OnChangeModeListener = paramOnChangeModeListener;
    if (QLog.isColorLevel()) {
      QLog.d("Drag", 2, "setOnModeChangeListener:" + paramOnChangeModeListener);
    }
    if ((jdField_a_of_type_ComTencentMobileqqActivityRecentCurIDragView$OnChangeModeListener != null) && (jdField_a_of_type_AndroidViewView != null) && (jdField_a_of_type_AndroidGraphicsRect == null))
    {
      jdField_a_of_type_AndroidGraphicsRect = new Rect();
      jdField_a_of_type_AndroidViewView.setTouchDelegate(new mia(this, jdField_a_of_type_AndroidGraphicsRect, this));
    }
  }
  
  public void setVisibility(int paramInt)
  {
    super.setVisibility(paramInt);
    if ((jdField_a_of_type_Boolean) && (paramInt == 0)) {
      jdField_a_of_type_Boolean = false;
    }
  }
}
