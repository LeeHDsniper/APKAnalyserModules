package com.tencent.mobileqq.activity.aio.anim;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class PathDemo
  implements AnimationPath
{
  double jdField_a_of_type_Double;
  private float jdField_a_of_type_Float;
  private int jdField_a_of_type_Int;
  private int b;
  private int c;
  private int d;
  private int e;
  private int f;
  
  public PathDemo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a(long paramLong, AnimationPath.Values paramValues)
  {
    jdField_c_of_type_Int = ((int)(jdField_a_of_type_Int + jdField_a_of_type_Float * (float)paramLong));
    d = ((int)(b + 0.8D * paramLong));
    f = ((float)((Math.sin((float)paramLong / 500.0F) + 1.0D) / 2.0D));
    float f1 = (float)paramLong / 2.0F;
    b = ((float)(f1 * Math.sin(jdField_a_of_type_Double)));
    jdField_c_of_type_Float = ((float)(f1 * Math.cos(jdField_a_of_type_Double)));
    if ((jdField_c_of_type_Int < -jdField_c_of_type_Int) || (d < -d) || (jdField_c_of_type_Int > e + jdField_c_of_type_Int) || (d > f + d)) {
      return -1;
    }
    return 16;
  }
  
  public int a(AnimationPath.Values paramValues, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    jdField_a_of_type_Int = (paramInt3 / 2);
    b = 0;
    jdField_a_of_type_Float = ((float)(Math.random() - 0.5D));
    jdField_c_of_type_Int = (paramInt1 / 2);
    d = (paramInt2 / 2);
    e = paramInt3;
    f = paramInt4;
    jdField_c_of_type_Int = jdField_a_of_type_Int;
    d = b;
    jdField_a_of_type_Double = (Math.random() * 2.0D * 3.141592653589793D);
    return 1;
  }
  
  public PathDemo a()
  {
    return new PathDemo();
  }
  
  public boolean a(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    return false;
  }
}
