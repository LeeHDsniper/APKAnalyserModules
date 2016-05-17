package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import nim;

public class TimerCheckMsgCount
  extends AsyncStep
{
  static final String c = "RWDBNum";
  
  public TimerCheckMsgCount()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    ThreadManager.d(new nim(this));
    return 7;
  }
}
