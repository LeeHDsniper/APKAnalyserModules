package com.tencent.mobileqq.msf.core.wtlogin;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.tencent.qphone.base.remote.IWtloginService.Stub;
import com.tencent.qphone.base.util.QLog;

class b
  implements ServiceConnection
{
  b(MsfWtloginHelper paramMsfWtloginHelper) {}
  
  public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
  {
    QLog.d("MsfWtloginHelper", 2, " onServiceConnected service:" + paramComponentName);
    a._baseService = IWtloginService.Stub.asInterface(paramIBinder);
    MsfWtloginHelper.access$000(a);
  }
  
  public void onServiceDisconnected(ComponentName paramComponentName)
  {
    QLog.d("MsfWtloginHelper", 2, " onServiceDisconnected " + paramComponentName);
    a._baseService = null;
  }
}
