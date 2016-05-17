package com.tencent.mobileqq.msf.sdk;

import com.tencent.mobileqq.msf.core.b.r;
import com.tencent.mobileqq.msf.core.b.r.a;
import com.tencent.mobileqq.msf.sdk.handler.IErrorHandler;
import com.tencent.qphone.base.remote.FromServiceMsg;
import java.util.concurrent.LinkedBlockingQueue;

class j
{
  private String _bootBroadcastName;
  protected int appid;
  IErrorHandler errorHandler;
  protected String msfServiceName;
  protected String processName;
  protected final LinkedBlockingQueue serviceRespMessagePairs = new LinkedBlockingQueue();
  private Object syncQueueLock = new Object();
  
  j() {}
  
  public boolean addServicePushMsg(FromServiceMsg arg1)
  {
    boolean bool = serviceRespMessagePairs.add(new MsfMessagePair(null, ???));
    if ((??? != null) && (???.getServiceCmd() != null) && (???.getServiceCmd().equals("SharpSvr.s2c"))) {
      r.a().a(r.a.e, ???.getWupBuffer(), 0);
    }
    synchronized (syncQueueLock)
    {
      syncQueueLock.notify();
      return bool;
    }
  }
  
  public boolean addServiceRespMsg(MsfMessagePair arg1)
  {
    boolean bool = serviceRespMessagePairs.add(???);
    synchronized (syncQueueLock)
    {
      syncQueueLock.notify();
      return bool;
    }
  }
  
  public String getBootBroadcastName()
  {
    return _bootBroadcastName;
  }
  
  public IErrorHandler getErrorHandler()
  {
    return errorHandler;
  }
  
  public int getQueueSize()
  {
    return serviceRespMessagePairs.size();
  }
  
  public LinkedBlockingQueue getRespMsgQueue()
  {
    return serviceRespMessagePairs;
  }
  
  public MsfMessagePair getServiceRespMsg()
  {
    return (MsfMessagePair)serviceRespMessagePairs.poll();
  }
  
  public void initSub(String paramString1, int paramInt, String paramString2, IErrorHandler paramIErrorHandler)
  {
    appid = paramInt;
    setBootBroadcastName(paramString2);
    processName = paramString1;
    errorHandler = paramIErrorHandler;
  }
  
  public void queueWait()
  {
    try
    {
      synchronized (syncQueueLock)
      {
        if (serviceRespMessagePairs.size() == 0) {
          syncQueueLock.wait();
        }
        return;
      }
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;) {}
    }
  }
  
  public void setBootBroadcastName(String paramString)
  {
    _bootBroadcastName = paramString;
  }
}
