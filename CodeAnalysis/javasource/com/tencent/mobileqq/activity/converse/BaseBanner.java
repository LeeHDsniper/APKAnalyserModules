package com.tencent.mobileqq.activity.converse;

import android.content.Context;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class BaseBanner
{
  int jdField_a_of_type_Int;
  View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  View jdField_a_of_type_AndroidViewView;
  boolean jdField_a_of_type_Boolean;
  int b;
  int c;
  int d;
  
  public BaseBanner()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
    jdField_a_of_type_AndroidViewView = null;
    b = 0;
    c = 0;
    d = 0;
    jdField_a_of_type_Boolean = true;
  }
  
  public View a(Context paramContext)
  {
    return jdField_a_of_type_AndroidViewView;
  }
  
  protected void a(int paramInt)
  {
    d = paramInt;
  }
  
  public boolean a(int paramInt)
  {
    if (d == paramInt) {
      return false;
    }
    a(paramInt);
    return true;
  }
}
