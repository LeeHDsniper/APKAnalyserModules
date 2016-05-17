package com.tencent.mobileqq.app.automator;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ParallGroup
  extends StepGroup
  implements IResultListener
{
  private int k;
  
  public ParallGroup()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    k = jdField_a_of_type_ArrayOfJavaLangString.length;
    for (;;)
    {
      AsyncStep localAsyncStep = a();
      if ((localAsyncStep == null) || (g == 8)) {
        break;
      }
      a = this;
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b(localAsyncStep);
    }
    return 2;
  }
  
  public void a(AsyncStep paramAsyncStep, int paramInt)
  {
    try
    {
      paramInt = k - 1;
      k = paramInt;
      if (paramInt == 0)
      {
        a(7);
        jdField_a_of_type_ArrayOfComTencentMobileqqAppAutomatorAsyncStep = null;
      }
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(jdField_a_of_type_ArrayOfComTencentMobileqqAppAutomatorAsyncStep);
      return;
    }
    finally {}
  }
}
