package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.activity.qwallet.PasswdRedBagManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class LoadPasswdRedBagStep
  extends AsyncStep
{
  public LoadPasswdRedBagStep()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    ((PasswdRedBagManager)a.b.getManager(124)).c();
    return 7;
  }
}
