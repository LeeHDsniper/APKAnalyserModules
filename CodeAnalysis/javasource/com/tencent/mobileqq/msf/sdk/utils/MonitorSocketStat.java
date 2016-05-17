package com.tencent.mobileqq.msf.sdk.utils;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.msf.sdk.MsfServiceSdk;
import com.tencent.mobileqq.msf.sdk.k;
import com.tencent.mobileqq.msf.service.MsfService;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;

public class MonitorSocketStat
  extends Thread
{
  public static byte STATUS = 0;
  public static k dataFlow = new k();
  public static boolean isScreenOff = false;
  private long lastgotStatusTime;
  private BroadcastReceiver mReceiver;
  private MsfServiceSdk msfSdk;
  private String processName;
  private boolean running = true;
  
  public MonitorSocketStat()
  {
    setName("MonitorSocketStat");
    mReceiver = new a(null);
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("android.intent.action.SCREEN_ON");
    localIntentFilter.addAction("android.intent.action.SCREEN_OFF");
    BaseApplication.getContext().registerReceiver(mReceiver, localIntentFilter);
  }
  
  private void getnetFlowStatus()
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.D.MonitorSocket", 2, "start to get status of Process");
    }
    new c(this, "checkNetFlowStatus").start();
  }
  
  public void run()
  {
    if (processName == null) {
      processName = MsfSdkUtils.getProcessName(BaseApplication.getContext());
    }
    boolean bool;
    try
    {
      if ((BaseApplication.getContext().getPackageName() + ":MSF").equals(processName))
      {
        for (;;)
        {
          bool = running;
          if (!bool) {
            break;
          }
          try
          {
            if (dataFlow == null) {
              dataFlow = new k();
            }
            a localA = (a)dataFlow.k();
            a = processName;
            if (localA != null) {
              MsfService.getCore().getNetFlowStore().a(localA);
            }
            if ((dataFlow.size() <= 1) && (System.currentTimeMillis() - lastgotStatusTime >= 60000L))
            {
              getnetFlowStatus();
              lastgotStatusTime = System.currentTimeMillis();
            }
          }
          catch (Exception localException1)
          {
            QLog.d("MSF.D.MonitorSocket", 1, "" + localException1, localException1);
          }
        }
        return;
      }
    }
    catch (Exception localException2)
    {
      if (dataFlow != null) {
        dataFlow.clear();
      }
      QLog.d("MSF.D.MonitorSocket", 1, "" + localException2, localException2);
    }
    do
    {
      bool = running;
    } while (!bool);
    for (;;)
    {
      try
      {
        if (dataFlow == null) {
          dataFlow = new k();
        }
        Object localObject = (a)dataFlow.k();
        if (localObject != null)
        {
          if (msfSdk == null) {
            msfSdk = MsfServiceSdk.get();
          }
          if (msfSdk == null) {
            break label368;
          }
          localObject = msfSdk.getDataFlowMsg(processName, (a)localObject);
          msfSdk.sendMsg((ToServiceMsg)localObject);
        }
        if ((dataFlow.size() > 1) || (System.currentTimeMillis() - lastgotStatusTime < 60000L)) {
          break;
        }
        getnetFlowStatus();
        lastgotStatusTime = System.currentTimeMillis();
      }
      catch (Exception localException3)
      {
        QLog.d("MSF.D.MonitorSocket", 1, "" + localException3, localException3);
      }
      break;
      label368:
      dataFlow.i(localException3);
    }
  }
  
  public void setProcessName(String paramString)
  {
    processName = paramString;
  }
  
  private class a
    extends BroadcastReceiver
  {
    private String b = null;
    
    private a() {}
    
    public void onReceive(Context paramContext, Intent paramIntent)
    {
      b = paramIntent.getAction();
      if ("android.intent.action.SCREEN_ON".equals(b))
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.D.MonitorSocket", 2, "screenOn");
        }
        MonitorSocketStat.isScreenOff = false;
        MonitorSocketStat.this.getnetFlowStatus();
      }
      while (!"android.intent.action.SCREEN_OFF".equals(b)) {
        return;
      }
      if (QLog.isColorLevel()) {
        QLog.d("MSF.D.MonitorSocket", 2, "screenOff");
      }
      MonitorSocketStat.isScreenOff = true;
      MonitorSocketStat.this.getnetFlowStatus();
    }
  }
}
