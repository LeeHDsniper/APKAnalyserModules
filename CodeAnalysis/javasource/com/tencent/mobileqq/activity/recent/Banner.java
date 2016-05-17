package com.tencent.mobileqq.activity.recent;

import android.view.View;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class Banner
{
  public static final int a = -1;
  public static final int b = 0;
  public static final int c = 2;
  public View a;
  public boolean a;
  public int d;
  public int e;
  
  public Banner(int paramInt1, int paramInt2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    d = paramInt1;
    e = paramInt2;
  }
  
  public static boolean a(int paramInt)
  {
    return paramInt >= 2;
  }
  
  public boolean a()
  {
    return e >= 2;
  }
  
  public String toString()
  {
    StringBuffer localStringBuffer = new StringBuffer(20);
    localStringBuffer.append("[").append(d).append(",").append(e).append(",").append(jdField_a_of_type_Boolean).append(",").append(jdField_a_of_type_AndroidViewView).append("]");
    return localStringBuffer.toString();
  }
}
