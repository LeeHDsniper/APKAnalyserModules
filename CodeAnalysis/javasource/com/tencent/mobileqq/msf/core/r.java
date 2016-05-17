package com.tencent.mobileqq.msf.core;

import android.content.Context;
import android.net.wifi.WifiManager;
import com.tencent.qphone.base.util.QLog;

class r
  extends Thread
{
  r(o paramO) {}
  
  public void run()
  {
    o.b(a, true);
    int i = 0;
    for (;;)
    {
      if (i < ba).h)
      {
        i += 1;
        if (o.c(a))
        {
          ((WifiManager)o.d(a).getSystemService("wifi")).startScan();
          if (QLog.isColorLevel()) {
            QLog.d("QQWiFiScanManager", 2, "accScan, launch count=" + i);
          }
        }
      }
      try
      {
        Thread.sleep(ba).i);
      }
      catch (InterruptedException localInterruptedException)
      {
        localInterruptedException.printStackTrace();
      }
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "accScan, count=" + i + ", stopped");
      }
      o.b(a, false);
      return;
    }
  }
}
