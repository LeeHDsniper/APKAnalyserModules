package com.tencent.mobileqq.activity.recent;

import android.content.res.Resources;
import android.view.MotionEvent;
import android.widget.FrameLayout;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView.LayoutParams;

public class BannerFrameLayout
  extends FrameLayout
{
  private BaseActivity jdField_a_of_type_ComTencentMobileqqAppBaseActivity;
  private boolean jdField_a_of_type_Boolean;
  
  public BannerFrameLayout(BaseActivity paramBaseActivity)
  {
    super(paramBaseActivity);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity = paramBaseActivity;
    a();
  }
  
  public void a()
  {
    setLayoutParams(new AbsListView.LayoutParams(-1, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getResources().getDimensionPixelSize(2131493111)));
  }
  
  public boolean a()
  {
    return jdField_a_of_type_Boolean;
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    if (!jdField_a_of_type_Boolean) {
      return true;
    }
    return super.onInterceptTouchEvent(paramMotionEvent);
  }
  
  public void setAnimEnd(boolean paramBoolean)
  {
    jdField_a_of_type_Boolean = paramBoolean;
  }
}
