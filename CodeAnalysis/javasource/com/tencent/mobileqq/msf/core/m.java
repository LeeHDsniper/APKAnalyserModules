package com.tencent.mobileqq.msf.core;

import android.os.Handler;
import android.os.HandlerThread;
import com.tencent.mobileqq.msf.core.net.h;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

public class m
{
  static final String b = "MSF.C.NetConnTag";
  MsfCore a;
  private volatile Handler c;
  
  public m(MsfCore paramMsfCore)
  {
    a = paramMsfCore;
  }
  
  public Runnable a(int paramInt, long paramLong)
  {
    a localA = new a(paramInt);
    c.postDelayed(localA, paramLong);
    return localA;
  }
  
  public Runnable a(h paramH, long paramLong)
  {
    if (paramH != null)
    {
      paramH = new d(paramH);
      c.postDelayed(paramH, paramLong);
      return paramH;
    }
    return null;
  }
  
  public Runnable a(ToServiceMsg paramToServiceMsg, long paramLong)
  {
    c localC = new c(paramToServiceMsg);
    if (paramToServiceMsg != null) {
      c.postDelayed(localC, paramLong);
    }
    return localC;
  }
  
  public void a()
  {
    HandlerThread localHandlerThread = new HandlerThread("MsfCoreTimeoutChecker", 5);
    localHandlerThread.start();
    c = new Handler(localHandlerThread.getLooper());
  }
  
  public void a(Runnable paramRunnable)
  {
    c.removeCallbacks(paramRunnable);
  }
  
  public Handler b()
  {
    return c;
  }
  
  public Runnable b(int paramInt, long paramLong)
  {
    b localB = new b(paramInt);
    c.postDelayed(localB, paramLong);
    return localB;
  }
  
  public void b(Runnable paramRunnable)
  {
    c.removeCallbacks(paramRunnable);
  }
  
  class a
    implements Runnable
  {
    private int b = 0;
    
    public a(int paramInt)
    {
      b = paramInt;
    }
    
    public void run()
    {
      ArrayList localArrayList = (ArrayList)a.sender.d.remove(Integer.valueOf(b));
      if (localArrayList != null) {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.NetConnTag", 2, "remove merged ssoseq list: " + localArrayList.toString() + " from SSO LoginMerge " + b);
        }
      }
      while (!QLog.isColorLevel()) {
        return;
      }
      QLog.d("MSF.C.NetConnTag", 2, "SSO LoginMerge's ssoseq " + b + "list has been removed by error code.");
    }
  }
  
  class b
    implements Runnable
  {
    private int b;
    
    public b(int paramInt)
    {
      b = paramInt;
    }
    
    public void run()
    {
      a.sender.b(b);
    }
  }
  
  class c
    implements Runnable
  {
    private ToServiceMsg b;
    
    public c(ToServiceMsg paramToServiceMsg)
    {
      b = paramToServiceMsg;
    }
    
    public void run()
    {
      if (b == null) {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.NetConnTag", 2, "req null, return.");
        }
      }
      for (;;)
      {
        return;
        try
        {
          ToServiceMsg localToServiceMsg = (ToServiceMsg)a.sender.c.get(Integer.valueOf(b.getRequestSsoSeq()));
          if ((localToServiceMsg != null) && (localToServiceMsg.isNeedCallback()))
          {
            localToServiceMsg = (ToServiceMsg)a.sender.c.remove(Integer.valueOf(b.getRequestSsoSeq()));
            if (localToServiceMsg == null)
            {
              if (!QLog.isColorLevel()) {
                continue;
              }
              QLog.d("MSF.C.NetConnTag", 2, "timeout msg " + localToServiceMsg + " also received resp, return.");
            }
          }
        }
        catch (Exception localException1)
        {
          QLog.d("MSF.C.NetConnTag", 1, "got fail msg. " + localException1, localException1);
          return;
        }
      }
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.NetConnTag", 1, "netRecv ssoSeq:" + localException1.getRequestSsoSeq() + " uin:" + MsfSdkUtils.getShortUin(localException1.getUin()) + " cmd:" + localException1.getServiceCmd() + " len:" + 0 + " costTime:" + localException1.getTimeout() + NetConnInfoCenter.getSignalStrengthsLog() + " code:" + 1002 + " failMsg:" + "wait serverResp timeout");
      }
      for (;;)
      {
        FromServiceMsg localFromServiceMsg = n.a(localException1);
        localFromServiceMsg.setBusinessFail(1002, "wait serverResp timeout");
        boolean bool = a.sender.a(localException1, localFromServiceMsg);
        if (!bool) {
          break;
        }
        try
        {
          a.getSsoRespHandler().c(localException1, localFromServiceMsg);
          return;
        }
        catch (Exception localException2)
        {
          localException2.printStackTrace();
          return;
        }
        QLog.d("MSF.C.NetConnTag", 1, "netRecv ssoSeq:" + localException2.getRequestSsoSeq() + " uin:" + MsfSdkUtils.getShortUin(localException2.getUin()) + " cmd:" + localException2.getServiceCmd().hashCode() + " len:" + 0 + " costTime:" + localException2.getTimeout() + NetConnInfoCenter.getSignalStrengthsLog() + " code:" + 1002 + " failMsg:" + "wait serverResp timeout");
      }
    }
  }
  
  class d
    implements Runnable
  {
    private h b;
    
    public d(h paramH)
    {
      b = paramH;
    }
    
    public void run()
    {
      if (b != null) {}
      try
      {
        b.e();
        return;
      }
      catch (Exception localException)
      {
        QLog.d("MSF.C.NetConnTag", 1, "call loginConnectTimeOut error " + localException);
      }
    }
  }
}
