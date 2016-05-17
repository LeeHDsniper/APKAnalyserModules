package com.tencent.mobileqq.msf.core.push;

import android.os.Handler;
import android.os.Message;
import com.tencent.qphone.base.util.QLog;

class c
  extends Handler
{
  c(b paramB) {}
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    do
    {
      return;
    } while ("0".equals(b.a(a)));
    QLog.d("PCActiveEchoManager", 1, "autoEcho");
    b.b(a);
  }
}
