package com.tencent.mobileqq.msf.sdk.utils;

import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.qphone.base.util.BaseApplication;

class c
  extends Thread
{
  c(MonitorSocketStat paramMonitorSocketStat, String paramString)
  {
    super(paramString);
  }
  
  public void run()
  {
    if (MsfSdkUtils.isTopActivity(BaseApplication.getContext()))
    {
      if (MonitorSocketStat.isScreenOff)
      {
        MonitorSocketStat.STATUS = 4;
        return;
      }
      MonitorSocketStat.STATUS = 1;
      return;
    }
    if (MonitorSocketStat.isScreenOff)
    {
      MonitorSocketStat.STATUS = 2;
      return;
    }
    if ((!MsfSdkUtils.isTopActivity(BaseApplication.getContext())) && (!MonitorSocketStat.isScreenOff))
    {
      MonitorSocketStat.STATUS = 3;
      return;
    }
    MonitorSocketStat.STATUS = 0;
  }
}
