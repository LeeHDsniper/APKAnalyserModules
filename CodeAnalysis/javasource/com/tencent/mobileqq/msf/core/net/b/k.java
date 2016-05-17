package com.tencent.mobileqq.msf.core.net.b;

import android.os.Handler;
import android.os.Message;
import com.tencent.qphone.base.util.QLog;

class k
  extends Handler
{
  k(j paramJ) {}
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      return;
    }
    paramMessage = (String)obj;
    QLog.d("WifiDetector", 1, "WIFI detect delayed try!");
    j.a(a, paramMessage);
  }
}
