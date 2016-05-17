package com.tencent.mobileqq.msf.core;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.tencent.qphone.base.util.QLog;

class p
  extends BroadcastReceiver
{
  p(o paramO) {}
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    paramContext = paramIntent.getAction();
    if (QLog.isColorLevel()) {
      QLog.d("QQWiFiScanManager", 2, "onReceive broadcast action = " + paramContext);
    }
    if (paramContext.equals("android.intent.action.SCREEN_ON")) {
      o.a(a, true);
    }
    do
    {
      do
      {
        return;
        if (paramContext.equals("android.intent.action.SCREEN_OFF"))
        {
          o.a(a, false);
          return;
        }
      } while (!paramContext.equals("android.net.wifi.SCAN_RESULTS"));
      try
      {
        o.a(a);
        return;
      }
      catch (Throwable paramContext) {}
    } while (!QLog.isColorLevel());
    QLog.e("QQWiFiScanManager", 2, "onReceive, SCAN_RESULTS_AVAILABLE_ACTION", paramContext);
  }
}
