package com.tencent.mobileqq.msf.core;

import android.content.Context;
import android.os.Build.VERSION;
import android.os.SystemClock;
import com.tencent.mobileqq.msf.core.a.a;
import com.tencent.mobileqq.msf.core.b.m;
import com.tencent.mobileqq.msf.core.quicksend.QuickSendStrategy;
import com.tencent.mobileqq.msf.core.quicksend.f;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.CodecWarpper;
import com.tencent.qphone.base.util.QLog;
import com.tencent.qphone.base.util.h;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class e
{
  public static final String a = "send_mode";
  public static final int b = 0;
  public static final int c = 1;
  public static final String d = "unknown";
  public static final String e = "pcactive";
  public static final String f = "quicksend";
  public static final int g = 0;
  public static final int h = -1;
  public static final int i = 1;
  public static final int j = 2;
  public static final int k = 3;
  public static final int l = 4;
  public static final int m = 5;
  public static final int n = 6;
  public static final String o = "light_sender_type";
  public static final int p = 0;
  public static final int q = 1;
  private static final String r = "LightSender";
  private MsfCore s;
  private LinkedBlockingQueue t = new LinkedBlockingQueue();
  private LinkedList u = new LinkedList();
  private long v = 0L;
  private ThreadPoolExecutor w;
  private int x = a.W();
  private int y = a.W();
  private int z = 60;
  
  public e(MsfCore paramMsfCore, Context paramContext)
  {
    s = paramMsfCore;
    CodecWarpper.setKsid(paramMsfCore.getAccountCenter().f());
    if (Build.VERSION.SDK_INT >= 9)
    {
      w = new ThreadPoolExecutor(x, y, z, TimeUnit.SECONDS, t, new a("LightSender"));
      w.allowCoreThreadTimeOut(true);
      return;
    }
    w = new ThreadPoolExecutor(1, 1, z, TimeUnit.SECONDS, t, new a("LightSender"));
  }
  
  private FromServiceMsg a(FromServiceMsg paramFromServiceMsg)
  {
    byte[] arrayOfByte1;
    int i1;
    if ((paramFromServiceMsg.getFlag() & 0x1) != 0)
    {
      arrayOfByte1 = paramFromServiceMsg.getWupBuffer();
      if (arrayOfByte1.length > 4) {
        i1 = (arrayOfByte1[0] & 0xFF) << 24 | 0x0 | (arrayOfByte1[1] & 0xFF) << 16 | (arrayOfByte1[2] & 0xFF) << 8 | arrayOfByte1[3] & 0xFF;
      }
    }
    else
    {
      try
      {
        byte[] arrayOfByte2 = new byte[i1];
        System.arraycopy(arrayOfByte1, 4, arrayOfByte2, 0, i1 - 4);
        arrayOfByte1 = h.b(arrayOfByte2);
        arrayOfByte2 = new byte[arrayOfByte1.length + 4];
        arrayOfByte2[0] = ((byte)(arrayOfByte1.length + 4 >> 24 & 0xFF));
        arrayOfByte2[1] = ((byte)(arrayOfByte1.length + 4 >> 16 & 0xFF));
        arrayOfByte2[2] = ((byte)(arrayOfByte1.length + 4 >> 8 & 0xFF));
        arrayOfByte2[3] = ((byte)(arrayOfByte1.length + 4 & 0xFF));
        System.arraycopy(arrayOfByte1, 0, arrayOfByte2, 4, arrayOfByte1.length);
        paramFromServiceMsg.putWupBuffer(arrayOfByte2);
        return paramFromServiceMsg;
      }
      catch (Throwable paramFromServiceMsg)
      {
        QLog.d("LightSender", 1, "LightSender uncompress data failed", paramFromServiceMsg);
        return null;
      }
    }
    return null;
  }
  
  private void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, int paramInt, String paramString, f paramF)
  {
    f = paramInt;
    if (paramFromServiceMsg == null)
    {
      paramFromServiceMsg = n.a(paramToServiceMsg);
      if (paramFromServiceMsg != null)
      {
        paramFromServiceMsg.setBusinessFail(paramInt, paramString);
        s.getSsoRespHandler().b(paramToServiceMsg, paramFromServiceMsg);
      }
      return;
    }
    s.getSsoRespHandler().b(paramToServiceMsg, paramFromServiceMsg);
  }
  
  private boolean a(com.tencent.mobileqq.msf.core.net.d paramD, String paramString, int paramInt, f paramF)
  {
    Object localObject;
    if (NetConnInfoCenterImpl.isWifiConn()) {
      localObject = s.getSsoListManager().j();
    }
    while (localObject != null)
    {
      localObject = ((CopyOnWriteArrayList)localObject).iterator();
      for (;;)
      {
        if (((Iterator)localObject).hasNext())
        {
          d localD = (d)((Iterator)localObject).next();
          paramD.a(localD.e());
          boolean bool = paramD.a(localD.c(), localD.d(), paramString, paramF);
          k += 1;
          if (bool)
          {
            return true;
            localObject = s.getSsoListManager().k();
            break;
          }
        }
      }
      QLog.d("LightSender", 1, "LightSender connect all fail ssoseq:" + paramInt);
      return false;
    }
    QLog.d("LightSender", 1, "LightSender ssolist is empty ssoseq:" + paramInt);
    return false;
  }
  
  private boolean c()
  {
    return t.size() + w.getActiveCount() >= y;
  }
  
  private byte d()
  {
    int i2 = 254;
    if (NetConnInfoCenterImpl.isWifiConn()) {
      return 1;
    }
    int i1;
    if (NetConnInfoCenterImpl.isMobileConn())
    {
      i1 = NetConnInfoCenterImpl.getMobileNetworkType() + 100;
      if (i1 <= 254) {
        break label144;
      }
      i1 = i2;
      if (QLog.isColorLevel())
      {
        QLog.d("LightSender", 2, "error,netWorkType is " + 254);
        i1 = i2;
      }
    }
    label144:
    for (;;)
    {
      return (byte)i1;
      long l1 = System.currentTimeMillis();
      if ((v == 0L) || (l1 - v > 60000L))
      {
        v = l1;
        try
        {
          NetConnInfoCenter.checkConnInfo(BaseApplication.getContext(), true);
          return 0;
        }
        catch (Throwable localThrowable)
        {
          QLog.d("LightSender", 1, "checkConnInfo " + localThrowable);
        }
      }
      return 0;
    }
  }
  
  private void d(ToServiceMsg paramToServiceMsg)
  {
    try
    {
      if (QLog.isColorLevel()) {
        QLog.d("LightSender", 2, "LightSender, addSendQueue cmd:" + paramToServiceMsg.getServiceCmd() + " ssoSeq:" + paramToServiceMsg.getRequestSsoSeq());
      }
      b localB = new b(paramToServiceMsg);
      w.submit(localB);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      QLog.d("LightSender", 1, "submit task failed, cmd:" + paramToServiceMsg.getServiceCmd() + " ssoSeq:" + paramToServiceMsg.getRequestSsoSeq(), localException);
    }
  }
  
  private String e(ToServiceMsg paramToServiceMsg)
  {
    if ((paramToServiceMsg != null) && (paramToServiceMsg.getServiceCmd().equals("MessageSvc.QueryPullUp"))) {
      return "pcactive";
    }
    if ((paramToServiceMsg != null) && (paramToServiceMsg.isQuickSendEnable()) && (QuickSendStrategy.getStragegyArgs(paramToServiceMsg.getQuickSendStrategy()) != null)) {
      return "quicksend";
    }
    return "unknown";
  }
  
  private byte[] f(ToServiceMsg paramToServiceMsg)
  {
    if (paramToServiceMsg == null) {
      return null;
    }
    String str;
    byte b1;
    try
    {
      str = paramToServiceMsg.getServiceCmd();
      Object localObject = null;
      if (paramToServiceMsg.getWupBuffer() == null) {
        break label330;
      }
      b1 = d();
      int i1 = 0;
      if (paramToServiceMsg.getAttributes().containsKey("send_mode")) {
        i1 = ((Integer)paramToServiceMsg.getAttributes().get("send_mode")).intValue();
      }
      try
      {
        byte[] arrayOfByte = w.f(paramToServiceMsg);
        localObject = arrayOfByte;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          QLog.d("LightSender", 1, "", localException);
        }
      }
      if (i1 != 1) {
        break label229;
      }
      if (591 == CodecWarpper.getSharedObjectVersion()) {
        return CodecWarpper.encodeRequest(paramToServiceMsg.getRequestSsoSeq(), n.d(), n.f(), n.g(), "", str, null, paramToServiceMsg.getAppId(), s.getMsfAppid(), paramToServiceMsg.getUin(), (byte)0, b1, paramToServiceMsg.getWupBuffer(), true);
      }
    }
    catch (Throwable localThrowable)
    {
      localThrowable.printStackTrace();
      QLog.d("LightSender", 1, "LightSender get packet fail ssoseq: " + paramToServiceMsg.getRequestSsoSeq(), localThrowable);
      return null;
    }
    return CodecWarpper.encodeRequest(paramToServiceMsg.getRequestSsoSeq(), n.d(), n.f(), n.g(), "", str, null, paramToServiceMsg.getAppId(), s.getMsfAppid(), paramToServiceMsg.getUin(), (byte)0, b1, localThrowable, paramToServiceMsg.getWupBuffer(), true);
    label229:
    if (591 == CodecWarpper.getSharedObjectVersion()) {
      return CodecWarpper.encodeRequest(paramToServiceMsg.getRequestSsoSeq(), n.d(), n.f(), n.g(), "", str, null, paramToServiceMsg.getAppId(), s.getMsfAppid(), paramToServiceMsg.getUin(), (byte)0, b1, paramToServiceMsg.getWupBuffer(), true);
    }
    return CodecWarpper.encodeRequest(paramToServiceMsg.getRequestSsoSeq(), n.d(), n.f(), n.g(), "", str, null, paramToServiceMsg.getAppId(), s.getMsfAppid(), paramToServiceMsg.getUin(), (byte)0, b1, localThrowable, paramToServiceMsg.getWupBuffer(), true);
    label330:
    return new byte[0];
  }
  
  public void a()
  {
    if (!t.isEmpty())
    {
      Iterator localIterator = t.iterator();
      while (localIterator.hasNext())
      {
        b localB = (b)localIterator.next();
        if ((localB != null) && (a != null) && (a.getServiceName().equals("MessageSvc.QueryPullUp"))) {
          localIterator.remove();
        }
      }
    }
  }
  
  public boolean a(ToServiceMsg paramToServiceMsg)
  {
    if (paramToServiceMsg == null) {}
    label123:
    for (boolean bool = false;; bool = false)
    {
      return bool;
      for (;;)
      {
        try
        {
          if (paramToServiceMsg.getAttributes().containsKey("light_sender_type"))
          {
            i1 = ((Integer)paramToServiceMsg.getAttributes().get("light_sender_type")).intValue();
            if ((i1 == 1) && (c()))
            {
              if (!QLog.isColorLevel()) {
                break label123;
              }
              QLog.d("LightSender", 2, "LightSender busy returns, cmd:" + paramToServiceMsg.getServiceCmd() + " ssoSeq:" + paramToServiceMsg.getRequestSsoSeq());
              break label123;
            }
            d(paramToServiceMsg);
            bool = true;
            break;
          }
        }
        finally {}
        int i1 = 0;
      }
    }
  }
  
  public void b()
  {
    if (!u.isEmpty())
    {
      Iterator localIterator = u.iterator();
      while (localIterator.hasNext())
      {
        ToServiceMsg localToServiceMsg = (ToServiceMsg)localIterator.next();
        if (localToServiceMsg.getServiceCmd().equals("MessageSvc.QueryPullUp")) {
          localToServiceMsg.getAttributes().put("RequestEcho", Boolean.valueOf(false));
        }
      }
    }
  }
  
  public void b(ToServiceMsg paramToServiceMsg)
  {
    Iterator localIterator = u.iterator();
    while (localIterator.hasNext())
    {
      ToServiceMsg localToServiceMsg = (ToServiceMsg)localIterator.next();
      if (paramToServiceMsg.getRequestSsoSeq() == localToServiceMsg.getRequestSsoSeq()) {
        localIterator.remove();
      }
    }
  }
  
  public boolean c(ToServiceMsg paramToServiceMsg)
  {
    int i2;
    int i1;
    int i4;
    int i3;
    if (paramToServiceMsg != null)
    {
      i2 = paramToServiceMsg.getRequestSsoSeq();
      if (paramToServiceMsg.getAttributes().containsKey("attr_quick_send_resend_time"))
      {
        i1 = ((Integer)paramToServiceMsg.getAttributes().get("attr_quick_send_resend_time")).intValue();
        if (paramToServiceMsg.getAttributes().containsKey("retryIndex"))
        {
          i4 = ((Integer)paramToServiceMsg.getAttributes().get("retryIndex")).intValue();
          i3 = i1;
          i1 = i4;
        }
      }
    }
    for (;;)
    {
      f localF = new f();
      b = SystemClock.elapsedRealtime();
      a = false;
      com.tencent.mobileqq.msf.core.net.d localD = new com.tencent.mobileqq.msf.core.net.d(i2);
      if ((QLog.isColorLevel()) || (QLog.isDevelopLevel())) {
        QLog.d("LightSender", 1, "trySendMsg cmd:" + paramToServiceMsg.getServiceCmd() + " ssoSeq:" + paramToServiceMsg.getRequestSsoSeq() + " resendIndex: " + i3);
      }
      try
      {
        Object localObject1 = f(paramToServiceMsg);
        if (localObject1 == null)
        {
          a(paramToServiceMsg, null, 1, "sendData ssoseq:" + i2 + ", send buffer is empty", localF);
          return false;
          localObject3 = new StringBuilder().append("trySendMsg cmd:");
          if (paramToServiceMsg.getServiceCmd() != null) {}
          for (localObject1 = Integer.valueOf(paramToServiceMsg.getServiceCmd().hashCode());; localObject1 = "null")
          {
            QLog.d("LightSender", 1, localObject1 + " ssoSeq:" + paramToServiceMsg.getRequestSsoSeq() + " resendIndex: " + i3);
            break;
          }
        }
        Object localObject3 = e(paramToServiceMsg);
        c = paramToServiceMsg.getUin();
        d = paramToServiceMsg.getServiceCmd();
        e = localObject1.length;
        g = SystemClock.elapsedRealtime();
        j = g;
        boolean bool = a(localD, (String)localObject3, i2, localF);
        j = (SystemClock.elapsedRealtime() - j);
        i = bool;
        if (!bool)
        {
          g = (SystemClock.elapsedRealtime() - g);
          a(paramToServiceMsg, null, 2, "sendData ssoseq:" + i2 + ", connect failed", localF);
          return false;
        }
        localObject1 = localD.a((byte[])localObject1, localF);
        g = (SystemClock.elapsedRealtime() - g);
        if (localObject1 == null)
        {
          a(paramToServiceMsg, null, 3, "sendData ssoseq:" + i2 + ", recv data failed", localF);
          return false;
        }
        localObject1 = s.sender.A.parseData((byte[])localObject1);
        if (localObject1 != null)
        {
          localObject1 = a((FromServiceMsg)localObject1);
          if (localObject1 == null)
          {
            a(paramToServiceMsg, null, 5, "sendData ssoseq:" + i2 + ", recv data failed", localF);
            return false;
          }
          ((FromServiceMsg)localObject1).setRequestSsoSeq(((FromServiceMsg)localObject1).getAppSeq());
          if (paramToServiceMsg != null)
          {
            ((FromServiceMsg)localObject1).setAppSeq(paramToServiceMsg.getAppSeq());
            ((FromServiceMsg)localObject1).setMsfCommand(paramToServiceMsg.getMsfCommand());
            ((FromServiceMsg)localObject1).setAppId(paramToServiceMsg.getAppId());
            ((FromServiceMsg)localObject1).setRequestSsoSeq(paramToServiceMsg.getRequestSsoSeq());
          }
          if (!s.getSsoRespHandler().a(paramToServiceMsg, (FromServiceMsg)localObject1)) {
            a(paramToServiceMsg, null, 6, "sendData ssoseq:" + i2 + ", recv new ssolist", localF);
          }
          a = true;
          return true;
        }
        a(paramToServiceMsg, null, 4, "sendData ssoseq:" + i2 + ", parse data failed", localF);
        return false;
      }
      catch (Throwable localThrowable)
      {
        a(paramToServiceMsg, null, -1, "sendData ssoseq:" + i2 + ", exception", localF);
        localThrowable.printStackTrace();
        QLog.d("LightSender", 1, "LightSender doSendData ssoseq:" + i2 + " exception, ", localThrowable);
        return false;
      }
      finally
      {
        localD.a();
        localD.b();
        b = (SystemClock.elapsedRealtime() - b);
        if ((s.statReporter != null) && (s.quicksender != null) && (paramToServiceMsg != null) && (s.quicksender.b(paramToServiceMsg)))
        {
          paramToServiceMsg = new HashMap();
          paramToServiceMsg.put("isSucc", Boolean.toString(a));
          paramToServiceMsg.put("costtime", Long.toString(b));
          paramToServiceMsg.put("account", c);
          paramToServiceMsg.put("cmd", d);
          paramToServiceMsg.put("datalen", Integer.toString(e));
          paramToServiceMsg.put("sendFailReason", Integer.toString(f));
          paramToServiceMsg.put("sendCosttime", Long.toString(g));
          paramToServiceMsg.put("isConnSucc", Boolean.toString(i));
          paramToServiceMsg.put("connCosttime", Long.toString(j));
          paramToServiceMsg.put("connCount", Integer.toString(k));
          paramToServiceMsg.put("connFailReason", l);
          paramToServiceMsg.put("sendExcpt", h);
          paramToServiceMsg.put("reIndex", "" + i3);
          paramToServiceMsg.put("msgReIndex", "" + i1);
          s.statReporter.a("dim.Msf.QuickSend", a, g + j, 0L, paramToServiceMsg, false, false);
        }
      }
      i4 = -1;
      i3 = i1;
      i1 = i4;
      continue;
      i1 = 0;
      break;
      i1 = -1;
      i3 = 0;
      i2 = 0;
    }
  }
  
  static class a
    implements ThreadFactory
  {
    private static final AtomicInteger a = new AtomicInteger(1);
    private final ThreadGroup b;
    private final AtomicInteger c = new AtomicInteger(1);
    private final String d;
    
    a(String paramString)
    {
      Object localObject = System.getSecurityManager();
      if (localObject != null) {}
      for (localObject = ((SecurityManager)localObject).getThreadGroup();; localObject = Thread.currentThread().getThreadGroup())
      {
        b = ((ThreadGroup)localObject);
        d = (paramString + "-pool-" + a.getAndIncrement() + "-thread-");
        return;
      }
    }
    
    public Thread newThread(Runnable paramRunnable)
    {
      paramRunnable = new Thread(b, paramRunnable, d + c.getAndIncrement(), 0L);
      if (paramRunnable.isDaemon()) {
        paramRunnable.setDaemon(false);
      }
      if (paramRunnable.getPriority() != 5) {
        paramRunnable.setPriority(5);
      }
      return paramRunnable;
    }
  }
  
  class b
    implements Runnable
  {
    public ToServiceMsg a;
    
    b(ToServiceMsg paramToServiceMsg)
    {
      a = paramToServiceMsg;
    }
    
    public void run()
    {
      try
      {
        String str = Thread.currentThread().getName();
        int i = e.a(e.this).getActiveCount();
        if (QLog.isColorLevel()) {
          QLog.d("LightSender", 2, "threadName: " + str + " threadPoolAccount: " + i);
        }
        if (a == null) {
          return;
        }
        e.b(e.this).add(a);
        c(a);
        b(a);
        return;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        QLog.d("LightSender", 1, "LightSender sendTask exception,", localException);
      }
    }
  }
}
