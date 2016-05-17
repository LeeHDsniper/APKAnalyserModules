package com.tencent.mobileqq.startup.step;

import com.tencent.mobileqq.app.ThreadManager;

public class ManageThread
  extends Step
{
  public ManageThread() {}
  
  protected boolean a()
  {
    ThreadManager.a();
    return true;
  }
}
