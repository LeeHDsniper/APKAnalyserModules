package com.tencent.mobileqq.msf.core.a;

import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.f;
import com.tencent.mobileqq.msf.core.w;
import com.tencent.msf.service.protocol.serverconfig.a;
import com.tencent.qphone.base.util.QLog;
import java.io.File;

class e
  extends Thread
{
  e(d paramD, String paramString)
  {
    super(paramString);
  }
  
  public void run()
  {
    for (;;)
    {
      a localA;
      Object localObject;
      try
      {
        localA = (a)d.a(a).k();
        if (QLog.isColorLevel()) {
          QLog.i("MSF.C.SsoListManager", 2, "zip file start");
        }
        localObject = f.a(b.a, b.b, b.c, b.d, c.a, c.b, c.c, c.d);
        if (QLog.isColorLevel()) {
          QLog.i("MSF.C.SsoListManager", 2, "zip file finish");
        }
        if (localObject == null) {
          continue;
        }
        localObject = new File((String)localObject);
        boolean bool = ((File)localObject).exists();
        if (!bool) {
          break label252;
        }
      }
      catch (Exception localException1) {}
      try
      {
        if (QLog.isColorLevel()) {
          QLog.i("MSF.C.SsoListManager", 2, "report file start");
        }
        f.a(a.j.sender.f(), (File)localObject, f);
        if (QLog.isColorLevel()) {
          QLog.i("MSF.C.SsoListManager", 2, "report file finish");
        }
      }
      catch (Exception localException2)
      {
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.w("MSF.C.SsoListManager", 2, "report log error " + localException2, localException2);
        continue;
      }
      ((File)localObject).deleteOnExit();
      continue;
      if (QLog.isColorLevel())
      {
        QLog.w("MSF.C.SsoListManager", 2, "handle report log error " + localException1, localException1);
        continue;
        label252:
        if (QLog.isColorLevel()) {
          QLog.w("MSF.C.SsoListManager", 2, "zip file not existed.");
        }
      }
    }
  }
}
