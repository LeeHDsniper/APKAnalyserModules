package com.tencent.mobileqq.startup.step;

import com.tencent.mobileqq.app.ThreadManager;

public class PreInitValues
  extends Step
{
  public PreInitValues() {}
  
  protected boolean a()
  {
    ThreadManager.a(new NewRuntime(), null, false);
    ThreadManager.a(new InitDPC(), null, false);
    return true;
  }
}
