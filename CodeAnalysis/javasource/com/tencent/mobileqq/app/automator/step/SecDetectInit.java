package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mqp.app.sec.d;

public class SecDetectInit
  extends AsyncStep
{
  public SecDetectInit()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    try
    {
      d.e(1, d.x(), null);
      return 7;
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        localThrowable.printStackTrace();
      }
    }
  }
}
