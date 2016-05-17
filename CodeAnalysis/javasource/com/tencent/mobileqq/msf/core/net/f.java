package com.tencent.mobileqq.msf.core.net;

import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.NetConnInfoCenterImpl;
import com.tencent.mobileqq.msf.core.a.a;
import com.tencent.mobileqq.msf.sdk.MsfCommand;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.msf.sdk.k;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.util.QLog;

public class f
{
  public static final String a = "MSF.C.NetExceptionStat";
  private static k b = new k(100);
  private static long c = System.currentTimeMillis() - 180000L;
  
  public f() {}
  
  public static void a(b paramB)
  {
    if (!NetConnInfoCenterImpl.isNetSupport()) {}
    long l;
    do
    {
      return;
      if (b.size() >= 100)
      {
        QLog.d("MSF.C.NetExceptionStat", 2, "addNetException NetExceptionEvent count = " + b.size() + "too much drop");
        return;
      }
      a localA = new a();
      a = paramB;
      l = System.currentTimeMillis();
      b = l;
      try
      {
        b.b(localA);
        QLog.d("MSF.C.NetExceptionStat", 2, "addNetException NetExceptionEvent count = " + b.size() + "");
        try
        {
          for (;;)
          {
            paramB = (a)b.peek();
            if ((paramB == null) || (l - b < a.O())) {
              break;
            }
            b.a();
          }
        }
        catch (Exception paramB)
        {
          paramB.printStackTrace();
        }
        QLog.d("MSF.C.NetExceptionStat", 2, "addNetException after remove expire event NetExceptionEvent count = " + b.size());
      }
      catch (Exception paramB)
      {
        paramB.printStackTrace();
        return;
      }
    } while ((l - c <= a.O()) || (b.size() < a.Q()));
    QLog.d("MSF.C.NetExceptionStat", 2, "NetExceptionEvent count = " + b.size() + " report to ui now");
    paramB = new FromServiceMsg(NetConnInfoCenterImpl.msfCore.getMsfAppid(), MsfCore.getNextSeq(), "0", "cmd_connWeakNet");
    paramB.setMsgSuccess();
    paramB.setMsfCommand(MsfCommand.onConnWeakNet);
    MsfSdkUtils.addFromMsgProcessName("*", paramB);
    NetConnInfoCenterImpl.msfCore.addRespToQuque(null, paramB);
    c = l;
  }
  
  public static class a
  {
    f.b a;
    long b;
    
    public a() {}
  }
  
  public static enum b
  {
    public static b a(String paramString)
    {
      return (b)Enum.valueOf(b.class, paramString);
    }
    
    public static b[] a()
    {
      return (b[])b.clone();
    }
  }
}
