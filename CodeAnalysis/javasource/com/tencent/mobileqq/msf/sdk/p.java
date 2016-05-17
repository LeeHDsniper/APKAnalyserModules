package com.tencent.mobileqq.msf.sdk;

import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import java.util.concurrent.ConcurrentLinkedQueue;

class p
  extends Thread
{
  p(n paramN) {}
  
  public void run()
  {
    while (!n.f.isEmpty())
    {
      ToServiceMsg localToServiceMsg = (ToServiceMsg)n.f.poll();
      if (localToServiceMsg != null) {
        try
        {
          a.a(localToServiceMsg);
        }
        catch (Exception localException)
        {
          FromServiceMsg localFromServiceMsg = a.a(localToServiceMsg, localToServiceMsg.getServiceName() + "sendMsgToServiceFailed，" + localException.toString());
          a.c(localToServiceMsg, localFromServiceMsg);
        }
      }
    }
  }
}
