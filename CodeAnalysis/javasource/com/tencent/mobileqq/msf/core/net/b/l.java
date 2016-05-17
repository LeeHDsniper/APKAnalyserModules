package com.tencent.mobileqq.msf.core.net.b;

import com.tencent.qphone.base.util.QLog;

class l
  implements a.a
{
  l(j paramJ) {}
  
  public void a(int paramInt1, int paramInt2, String paramString, Object paramObject)
  {
    String str = paramString;
    if (paramString != null)
    {
      str = paramString;
      if (paramString.length() > 10) {
        str = paramString.substring(0, 10);
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("WifiDetector", 2, "WIFI detect onEchoResult, taskId: " + paramInt1 + " result: " + paramInt2 + " actualContent: " + str);
    }
    paramInt2 = j.a(a, paramInt2);
    j.a(a, paramInt2, (String)paramObject);
    j.b(a, 1 << paramInt1);
    if (j.a(a) == 0) {
      a.d();
    }
  }
}
