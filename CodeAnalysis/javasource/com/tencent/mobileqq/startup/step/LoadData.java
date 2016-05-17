package com.tencent.mobileqq.startup.step;

import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.startup.director.StartupDirector;
import mqq.app.AppActivity;
import mqq.app.AppRuntime;

public class LoadData
  extends Step
{
  public LoadData() {}
  
  protected boolean a()
  {
    AppActivity localAppActivity = a.a;
    long l = System.currentTimeMillis();
    if (localAppActivity != null)
    {
      AppRuntime localAppRuntime = BaseApplicationImpl.a.waitAppRuntime(null);
      if (L == 17) {}
      for (boolean bool = true; (localAppActivity.preloadData(localAppRuntime, bool)) && (System.currentTimeMillis() - l < 550L); bool = false) {
        return true;
      }
      return false;
    }
    return false;
  }
}
