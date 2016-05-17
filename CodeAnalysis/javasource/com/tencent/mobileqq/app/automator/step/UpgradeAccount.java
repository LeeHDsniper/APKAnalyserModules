package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class UpgradeAccount
  extends AsyncStep
{
  public UpgradeAccount(Automator paramAutomator, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramAutomator;
    h = paramInt;
  }
  
  protected int a()
  {
    return super.a();
  }
}
