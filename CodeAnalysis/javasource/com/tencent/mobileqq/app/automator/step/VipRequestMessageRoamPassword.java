package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class VipRequestMessageRoamPassword
  extends AsyncStep
{
  private static final String c = VipRequestMessageRoamPassword.class.getSimpleName();
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public VipRequestMessageRoamPassword() {}
  
  protected int a()
  {
    a.b.a().j();
    return 7;
  }
}
