package com.tencent.mobileqq.pluginsdk.exception;

import com.tencent.qphone.base.util.QLog;

final class a
  implements Runnable
{
  a(String paramString, Exception paramException) {}
  
  public void run()
  {
    if (QLog.isColorLevel()) {
      QLog.e(a, 2, "ExceptinTracker", b);
    }
    throw new IllegalArgumentException(b);
  }
}
