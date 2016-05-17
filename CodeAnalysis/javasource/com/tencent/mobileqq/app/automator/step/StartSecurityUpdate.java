package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qqprotect.singleupdate.QPSingleUpdTimerTask;
import java.util.Timer;

public class StartSecurityUpdate
  extends AsyncStep
{
  public StartSecurityUpdate()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    a.a = new Timer();
    a.a.schedule(new QPSingleUpdTimerTask(a.b.a()), 300000L, 86400000L);
    return 7;
  }
}
