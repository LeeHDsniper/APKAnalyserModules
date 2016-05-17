package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SecMsgHandler;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.SecMsgUtil;
import com.tencent.qphone.base.util.QLog;

public class GetSecMsgConfigs
  extends AsyncStep
{
  public GetSecMsgConfigs()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, "get SecMsgBaseInfo start in QQInitHandler...");
    }
    ((SecMsgHandler)a.b.a(40)).a(-1L, SecMsgUtil.a());
    return 7;
  }
}
