package com.tencent.mobileqq.msf.sdk;

import android.content.Intent;
import android.net.NetworkInfo;
import android.os.Handler;
import com.tencent.qphone.base.util.QLog;

class c
  extends Thread
{
  c(b paramB, String paramString, Intent paramIntent)
  {
    super(paramString);
  }
  
  public void run()
  {
    try
    {
      if (a.e == null)
      {
        QLog.d(a.j(), 1, "AppNetInfoImpl handler is null");
        a.d = new a.a("netchangehandler3");
        a.d.start();
        a.e = new Handler(a.d.getLooper(), a.d);
      }
      NetworkInfo localNetworkInfo = (NetworkInfo)a.getParcelableExtra("networkInfo");
      a.f = localNetworkInfo;
      a.a(localNetworkInfo);
      a.e.sendEmptyMessage(3);
      return;
    }
    catch (Exception localException)
    {
      while (!QLog.isColorLevel()) {}
      QLog.d(a.j(), 2, localException.toString(), localException);
    }
  }
}
