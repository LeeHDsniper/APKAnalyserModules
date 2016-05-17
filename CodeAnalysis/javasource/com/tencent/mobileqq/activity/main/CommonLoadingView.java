package com.tencent.mobileqq.activity.main;

import android.content.Context;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class CommonLoadingView
  extends FrameLayout
{
  private CommonLoadingView.OnFirstDrawListener jdField_a_of_type_ComTencentMobileqqActivityMainCommonLoadingView$OnFirstDrawListener;
  private boolean jdField_a_of_type_Boolean;
  
  public CommonLoadingView(Context paramContext)
  {
    super(paramContext);
    jdField_a_of_type_Boolean = true;
  }
  
  public CommonLoadingView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_Boolean = true;
  }
  
  public CommonLoadingView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = true;
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    if (jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_Boolean = false;
      if (jdField_a_of_type_ComTencentMobileqqActivityMainCommonLoadingView$OnFirstDrawListener != null) {
        jdField_a_of_type_ComTencentMobileqqActivityMainCommonLoadingView$OnFirstDrawListener.a();
      }
    }
  }
  
  public void setOnFirstDrawListener(CommonLoadingView.OnFirstDrawListener paramOnFirstDrawListener)
  {
    jdField_a_of_type_ComTencentMobileqqActivityMainCommonLoadingView$OnFirstDrawListener = paramOnFirstDrawListener;
  }
}
