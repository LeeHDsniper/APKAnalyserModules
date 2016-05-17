package com.tencent.mobileqq.msf.core.wtlogin;

class a
  extends Thread
{
  a(MsfWtloginHelper paramMsfWtloginHelper) {}
  
  public void run()
  {
    a.bindWtLoginService("com.tencent.mobileqq.msf.core.wtlogin.WtLoginService");
  }
}
