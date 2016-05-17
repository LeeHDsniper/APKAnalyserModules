package com.tencent.mobileqq.app.automator.step;

import com.tencent.biz.TroopRedpoint.TroopRedTouchHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class GetTroopRedPointInfoStep
  extends AsyncStep
{
  public GetTroopRedPointInfoStep()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    ((TroopRedTouchHandler)a.b.a(43)).a();
    return 7;
  }
}
