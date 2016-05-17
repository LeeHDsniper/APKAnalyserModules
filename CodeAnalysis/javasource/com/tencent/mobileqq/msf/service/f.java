package com.tencent.mobileqq.msf.service;

import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.sdk.MsfMessagePair;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;
import java.util.concurrent.LinkedBlockingQueue;

public class f
  extends Thread
{
  private static String c = "MSF.S.RespHandler";
  public volatile boolean a = true;
  MsfCore b;
  
  public f(MsfCore paramMsfCore)
  {
    b = paramMsfCore;
  }
  
  public void run()
  {
    while (a)
    {
      String str;
      for (;;)
      {
        try
        {
          MsfMessagePair localMsfMessagePair = (MsfMessagePair)b.getMsfMessagePairs().take();
          if (localMsfMessagePair == null) {
            break;
          }
          if (toServiceMsg == null) {
            break label200;
          }
          str = g.b(toServiceMsg);
          if ((!"LongConn.OffPicUp".equals(toServiceMsg.getServiceCmd())) && (!"ImgStore.GroupPicUp".equals(toServiceMsg.getServiceCmd()))) {
            break label149;
          }
          QLog.d(c, 1, "recv " + str + " req:" + toServiceMsg.getStringForLog() + "resp:" + fromServiceMsg.getStringForLog());
          c.a(str, toServiceMsg, fromServiceMsg);
        }
        catch (InterruptedException localInterruptedException)
        {
          localInterruptedException.printStackTrace();
        }
        break;
        label149:
        QLog.d(c, 2, str + " add resp to queue:" + toServiceMsg.getRequestSsoSeq() + " from:" + fromServiceMsg);
      }
      label200:
      if (fromServiceMsg != null)
      {
        str = g.a(fromServiceMsg);
        if (QLog.isColorLevel()) {
          QLog.d(c, 2, str + " add push to queue: from:" + fromServiceMsg);
        }
        c.a(str, toServiceMsg, fromServiceMsg);
      }
    }
  }
}
