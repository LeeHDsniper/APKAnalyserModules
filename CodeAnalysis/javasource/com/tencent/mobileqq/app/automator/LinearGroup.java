package com.tencent.mobileqq.app.automator;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class LinearGroup
  extends StepGroup
{
  public LinearGroup()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    while (g != 8)
    {
      AsyncStep localAsyncStep = a();
      if (localAsyncStep == null) {
        break;
      }
      localAsyncStep.run();
    }
    return 7;
  }
}
