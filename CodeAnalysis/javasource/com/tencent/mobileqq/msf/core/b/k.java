package com.tencent.mobileqq.msf.core.b;

import com.tencent.qphone.base.util.QLog;

class k
  extends Thread
{
  long a = 0L;
  
  public k(long paramLong, boolean paramBoolean)
  {
    a = paramLong;
  }
  
  public void run()
  {
    
    try
    {
      i.a(0, a);
      i.a(1, a);
      i.b(b);
      i.c(b);
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        QLog.d("MSF.C.NetworkTraffic", 1, "makeReportRDMData error " + localException, localException);
      }
    }
  }
}
