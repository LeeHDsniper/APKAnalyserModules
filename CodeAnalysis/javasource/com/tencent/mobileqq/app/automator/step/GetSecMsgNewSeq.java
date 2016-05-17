package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SecMsgManager;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class GetSecMsgNewSeq
  extends AsyncStep
{
  public GetSecMsgNewSeq()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, "GetSecMsgNewSeq start in QQInitHandler...");
    }
    SecMsgManager localSecMsgManager = (SecMsgManager)a.b.getManager(56);
    if (localSecMsgManager != null) {
      localSecMsgManager.a();
    }
    return 7;
  }
}
