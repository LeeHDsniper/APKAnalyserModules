package com.tencent.mobileqq.msf.sdk;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.tencent.qphone.base.remote.IBaseService.Stub;
import com.tencent.qphone.base.util.QLog;

class o
  implements ServiceConnection
{
  o(n paramN) {}
  
  public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.D.RemoteServiceProxy", 2, "threadID:" + Thread.currentThread().getId() + " onServiceConnected service:" + paramComponentName);
    }
    a.d = IBaseService.Stub.asInterface(paramIBinder);
    a.d();
    n.a(a);
  }
  
  public void onServiceDisconnected(ComponentName paramComponentName)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.D.RemoteServiceProxy", 2, " onServiceDisconnected " + paramComponentName);
    }
    a.d = null;
    n.a(a);
  }
}
