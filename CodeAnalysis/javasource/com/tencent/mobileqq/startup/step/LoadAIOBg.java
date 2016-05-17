package com.tencent.mobileqq.startup.step;

import android.content.res.Resources;
import com.tencent.common.app.BaseApplicationImpl;

public class LoadAIOBg
  extends Step
{
  public LoadAIOBg() {}
  
  protected boolean a()
  {
    try
    {
      com.tencent.mobileqq.app.BaseActivity.sAIOBgCache = BaseApplicationImpl.a.getResources().getDrawable(2130838046);
      return true;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
}
