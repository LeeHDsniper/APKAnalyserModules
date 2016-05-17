package com.tencent.mobileqq.startup.step;

import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.InjectUtils;

public class LoadDex
  extends Step
{
  public LoadDex() {}
  
  protected boolean a()
  {
    if ((BaseApplicationImpl.i == 4) || ("Success".equals(BaseApplicationImpl.sInjectResult))) {}
    for (;;)
    {
      return true;
      boolean bool1;
      if (L == 1)
      {
        bool1 = true;
        BaseApplicationImpl.sInjectResult = InjectUtils.b(BaseApplicationImpl.a, bool1);
        if (bool1) {
          if (BaseApplicationImpl.sInjectResult != null) {
            break label78;
          }
        }
      }
      label78:
      for (boolean bool2 = true;; bool2 = false)
      {
        BaseApplicationImpl.c = bool2;
        if ((bool1) || ("Success".equals(BaseApplicationImpl.sInjectResult))) {
          break label83;
        }
        return false;
        bool1 = false;
        break;
      }
      label83:
      if ("Success".equals(BaseApplicationImpl.sInjectResult)) {
        try
        {
          Step.AmStepFactory.a();
          if (1 == BaseApplicationImpl.i)
          {
            Step.AmStepFactory.b(14, a, null).c();
            return true;
          }
        }
        catch (Exception localException) {}
      }
    }
    return true;
  }
}
