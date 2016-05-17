package com.tencent.mobileqq.startup.step;

import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.GuardManager;
import com.tencent.mobileqq.dalvik.DalvikReplacer;
import com.tencent.qphone.base.util.QLog;

public class NewRuntime
  extends Step
{
  private static final int jdField_a_of_type_Int = 16777216;
  public static long a = -1L;
  private static final boolean jdField_a_of_type_Boolean = true;
  
  public NewRuntime() {}
  
  protected boolean a()
  {
    b();
    BaseApplicationImpl.a.doInit(false);
    if ((GuardManager.a == null) && ("com.tencent.mobileqq".equals(BaseApplicationImpl.processName))) {
      GuardManager.a = new GuardManager(BaseApplicationImpl.a, 0);
    }
    return true;
  }
  
  public boolean b()
  {
    if (DalvikReplacer.a(16777216))
    {
      a = 0L;
      try
      {
        long l = DalvikReplacer.a(BaseApplicationImpl.a, 16777216);
        if (QLog.isColorLevel()) {
          QLog.d("replaceDalvikMem", 2, "result=" + l);
        }
        a = l;
      }
      catch (Throwable localThrowable)
      {
        for (;;)
        {
          if (QLog.isColorLevel()) {
            QLog.d("replaceDalvikMem", 2, "exception:", localThrowable);
          }
        }
      }
      return false;
    }
    return true;
  }
}
