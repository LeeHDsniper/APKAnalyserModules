package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import nib;

public class GetTbsSwitchInfo
  extends AsyncStep
{
  public GetTbsSwitchInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    ThreadManager.a(new nib(this), 8, null, false);
    return 7;
  }
}
