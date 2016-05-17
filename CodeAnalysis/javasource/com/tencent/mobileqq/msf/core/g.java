package com.tencent.mobileqq.msf.core;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import com.tencent.mobileqq.msf.core.a.a;
import com.tencent.qphone.base.util.QLog;

final class g
  extends Handler
{
  g(Looper paramLooper)
  {
    super(paramLooper);
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    do
    {
      return;
    } while ((f.c() > 0L) && (SystemClock.elapsedRealtime() - f.c() < a.p()));
    f.a(SystemClock.elapsedRealtime());
    QLog.d(f.a, 1, "clean and compress log");
    f.d();
  }
}
