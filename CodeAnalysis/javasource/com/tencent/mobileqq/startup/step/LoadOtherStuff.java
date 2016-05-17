package com.tencent.mobileqq.startup.step;

import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.statistics.StatisticCollector;

public class LoadOtherStuff
  extends Step
{
  public LoadOtherStuff() {}
  
  protected boolean a()
  {
    StatisticCollector.a(BaseApplicationImpl.getContext());
    BaseApplicationImpl.a().getSharedPreferences("UserGuide", 0);
    return true;
  }
}
