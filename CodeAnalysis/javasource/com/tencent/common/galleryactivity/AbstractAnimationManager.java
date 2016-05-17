package com.tencent.common.galleryactivity;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;

public abstract class AbstractAnimationManager
  implements AnimationLister
{
  public static final long b = 350L;
  protected long a;
  protected ArrayList a;
  protected boolean a;
  public boolean b;
  public boolean c;
  
  public AbstractAnimationManager()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_Long = 350L;
    b = true;
  }
  
  public long a()
  {
    return jdField_a_of_type_Long;
  }
  
  public void a()
  {
    jdField_a_of_type_Long = 350L;
  }
  
  public void a(long paramLong)
  {
    jdField_a_of_type_Long = paramLong;
  }
  
  public void a(AnimationLister paramAnimationLister)
  {
    if (!jdField_a_of_type_JavaUtilArrayList.contains(paramAnimationLister)) {
      jdField_a_of_type_JavaUtilArrayList.add(paramAnimationLister);
    }
  }
  
  public boolean a()
  {
    return jdField_a_of_type_Boolean;
  }
  
  public abstract boolean b();
  
  public abstract boolean c();
  
  public boolean d()
  {
    return b;
  }
}
