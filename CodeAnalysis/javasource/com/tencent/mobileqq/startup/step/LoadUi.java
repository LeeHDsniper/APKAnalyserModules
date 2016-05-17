package com.tencent.mobileqq.startup.step;

import com.tencent.mobileqq.startup.director.StartupDirector;
import mqq.app.AppActivity;

public class LoadUi
  extends Step
{
  public LoadUi() {}
  
  protected boolean a()
  {
    AppActivity localAppActivity = a.a;
    if (localAppActivity != null) {
      localAppActivity.preloadUi();
    }
    return true;
  }
}
