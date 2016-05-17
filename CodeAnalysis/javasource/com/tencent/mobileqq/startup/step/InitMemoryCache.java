package com.tencent.mobileqq.startup.step;

import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.MemoryManager;
import com.tencent.qphone.base.util.QLog;
import rdv;

public class InitMemoryCache
  extends Step
{
  public InitMemoryCache() {}
  
  protected boolean a()
  {
    long l;
    if (BaseApplicationImpl.i == 1)
    {
      l = MemoryManager.a() * 3L / 16L;
      BaseApplicationImpl.jdField_a_of_type_AndroidSupportV4UtilMQLruCache = new rdv(Integer.valueOf((int)l));
      BaseApplicationImpl.jdField_a_of_type_Int = (int)l;
    }
    int j;
    do
    {
      do
      {
        return true;
        if (BaseApplicationImpl.i == 5)
        {
          l = MemoryManager.a() * 3L / 16L;
          BaseApplicationImpl.jdField_a_of_type_AndroidSupportV4UtilMQLruCache = new rdv(Integer.valueOf((int)l));
          BaseApplicationImpl.jdField_a_of_type_Int = (int)l;
          return true;
        }
      } while ((!BaseApplicationImpl.processName.endsWith(":peak")) && (!BaseApplicationImpl.processName.endsWith(":dataline")) && (!BaseApplicationImpl.processName.endsWith(":huangye")) && (!BaseApplicationImpl.processName.endsWith(":secmsg")) && (!BaseApplicationImpl.processName.endsWith(":dingdong")));
      j = (int)(MemoryManager.a() * 3L / 16L);
      int i = 4194304;
      if (j > 4194304) {
        i = j;
      }
      BaseApplicationImpl.jdField_a_of_type_AndroidSupportV4UtilMQLruCache = new rdv(Integer.valueOf(i));
      BaseApplicationImpl.jdField_a_of_type_Int = j;
    } while (!QLog.isColorLevel());
    QLog.d("MemoryCache", 2, "memory size:" + j);
    return true;
  }
}
