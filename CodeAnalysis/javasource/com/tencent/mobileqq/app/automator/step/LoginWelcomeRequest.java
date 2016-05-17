package com.tencent.mobileqq.app.automator.step;

import android.os.SystemClock;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import nie;

public class LoginWelcomeRequest
  extends AsyncStep
{
  public LoginWelcomeRequest()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    long l = SystemClock.uptimeMillis();
    ThreadManager.a(new nie(this), null, false);
    if (QLog.isDevelopLevel()) {
      QLog.d("LoginWelcome", 4, "LoginWelcomeRequest doStep cost " + (SystemClock.uptimeMillis() - l));
    }
    return 7;
  }
}
