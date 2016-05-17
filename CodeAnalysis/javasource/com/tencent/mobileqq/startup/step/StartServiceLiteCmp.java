package com.tencent.mobileqq.startup.step;

import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.automator.StepFactory;

public class StartServiceLiteCmp
  extends Step
{
  public StartServiceLiteCmp() {}
  
  protected boolean a()
  {
    Object localObject = BaseApplicationImpl.a.a();
    if ((localObject instanceof QQAppInterface))
    {
      localObject = (QQAppInterface)localObject;
      if (((QQAppInterface)localObject).e()) {
        a.a(StepFactory.a(a, "{{4,3,5,6},41,42,[79,76,62,25,10,26,27,28,29,30,31,32,34,35,37,38,39,40,44,45,47,52,66,67,68,69,48,50,51,58,60,73,78,64,77,70,74,75,80,82],54}"));
      }
    }
    return true;
  }
}
