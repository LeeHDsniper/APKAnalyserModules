package com.tencent.mobileqq.app.automator.step;

import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ZebraBlacklistUtils;

public class StartSecurityScan
  extends AsyncStep
{
  public StartSecurityScan()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    if (a.b.r()) {
      a.b.A();
    }
    ZebraBlacklistUtils.a(BaseApplicationImpl.a()).a();
    return 7;
  }
}
