package com.tencent.common.app;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.FrameLayout;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class InnerFrame
  extends FrameLayout
{
  private static final String jdField_a_of_type_JavaLangString = "InnerFrame";
  private Activity jdField_a_of_type_AndroidAppActivity;
  private InnerFrameManager jdField_a_of_type_ComTencentCommonAppInnerFrameManager;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  
  public InnerFrame(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidAppActivity = null;
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager = null;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
  }
  
  public InnerFrame(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_AndroidAppActivity = null;
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager = null;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
  }
  
  public InnerFrame(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_AndroidAppActivity = null;
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager = null;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
  }
  
  public Activity a()
  {
    return jdField_a_of_type_AndroidAppActivity;
  }
  
  public InnerFrameManager a()
  {
    return jdField_a_of_type_ComTencentCommonAppInnerFrameManager;
  }
  
  public QQAppInterface a()
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  }
  
  public void a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("InnerFrame", 2, "onResume");
    }
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent) {}
  
  public void a(Intent paramIntent)
  {
    a(paramIntent, 0);
  }
  
  public void a(Intent paramIntent, int paramInt)
  {
    jdField_a_of_type_AndroidAppActivity.startActivityForResult(paramIntent, paramInt);
  }
  
  public void a(Bundle paramBundle)
  {
    if (QLog.isColorLevel()) {
      QLog.d("InnerFrame", 2, "onCreate");
    }
  }
  
  public void b()
  {
    if (QLog.isColorLevel()) {
      QLog.d("InnerFrame", 2, "onPause");
    }
  }
  
  public void b(Bundle paramBundle)
  {
    if (QLog.isColorLevel()) {
      QLog.d("InnerFrame", 2, "onStart");
    }
  }
  
  public void c()
  {
    if (QLog.isColorLevel()) {
      QLog.d("InnerFrame", 2, "onStop");
    }
  }
  
  public void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d("InnerFrame", 2, "onDestroy");
    }
  }
  
  protected void e() {}
  
  public void setActivity(Activity paramActivity)
  {
    if (QLog.isColorLevel()) {
      QLog.d("InnerFrame", 2, "setActivity");
    }
    jdField_a_of_type_AndroidAppActivity = paramActivity;
  }
  
  public void setAppIntf(QQAppInterface paramQQAppInterface)
  {
    if (QLog.isColorLevel()) {
      QLog.d("InnerFrame", 2, "setAppIntf");
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    e();
  }
  
  public void setContentView(int paramInt)
  {
    setContentView(LayoutInflater.from(jdField_a_of_type_AndroidAppActivity).inflate(paramInt, this, false));
  }
  
  public void setContentView(View paramView)
  {
    if (getChildCount() > 0) {
      removeAllViews();
    }
    addView(paramView);
  }
  
  public void setInnerFrameManager(InnerFrameManager paramInnerFrameManager)
  {
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager = paramInnerFrameManager;
  }
}
