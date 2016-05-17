package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import nho;

public class GetBigEmoticonStep
  extends AsyncStep
{
  public GetBigEmoticonStep()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("GetBigEmoticonStep", 2, "doStep begins");
    }
    ThreadManager.a(new nho(this), 5, null, false);
    return 7;
  }
}
