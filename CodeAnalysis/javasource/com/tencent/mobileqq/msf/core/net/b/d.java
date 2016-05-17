package com.tencent.mobileqq.msf.core.net.b;

import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.NetConnInfoCenterImpl;
import com.tencent.mobileqq.msf.core.a.a;
import com.tencent.mobileqq.msf.core.b.m;
import com.tencent.mobileqq.msf.core.n;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;

public class d
{
  private static final String a = "ReqAllFailDetector";
  private static final int f = 10000;
  private static final long g = 180000L;
  private CopyOnWriteArrayList b;
  private CopyOnWriteArrayList c;
  private CopyOnWriteArrayList d = new CopyOnWriteArrayList();
  private AtomicBoolean e = new AtomicBoolean(false);
  private long h = 0L;
  private String i = "";
  private int j = 0;
  private long k = 0L;
  private String l = "";
  private MsfCore m;
  private Handler n = new e(this, Looper.getMainLooper());
  
  public d(MsfCore paramMsfCore)
  {
    m = paramMsfCore;
    a();
  }
  
  private CopyOnWriteArrayList c()
  {
    if (NetConnInfoCenterImpl.isWifiConn()) {
      return c;
    }
    if (NetConnInfoCenterImpl.isMobileConn()) {
      return b;
    }
    return null;
  }
  
  public void a()
  {
    for (;;)
    {
      try
      {
        if (!a.ao()) {
          break;
        }
        b = new CopyOnWriteArrayList();
        c = new CopyOnWriteArrayList();
        Object localObject = n.e();
        if (localObject == null) {
          return;
        }
        if ((((String)localObject).startsWith("460")) || (((String)localObject).startsWith("461")))
        {
          if ((((String)localObject).startsWith("46000")) || (((String)localObject).startsWith("46002")))
          {
            localObject = new com.tencent.mobileqq.msf.core.d();
            ((com.tencent.mobileqq.msf.core.d)localObject).c("120.196.210.210");
            ((com.tencent.mobileqq.msf.core.d)localObject).a(8080);
            b.add(localObject);
            localObject = new com.tencent.mobileqq.msf.core.d();
            ((com.tencent.mobileqq.msf.core.d)localObject).c("183.232.95.122");
            ((com.tencent.mobileqq.msf.core.d)localObject).a(8080);
            b.add(localObject);
          }
        }
        else
        {
          localObject = new com.tencent.mobileqq.msf.core.d();
          ((com.tencent.mobileqq.msf.core.d)localObject).c("120.196.210.210");
          ((com.tencent.mobileqq.msf.core.d)localObject).a(8080);
          c.add(localObject);
          localObject = new com.tencent.mobileqq.msf.core.d();
          ((com.tencent.mobileqq.msf.core.d)localObject).c("183.232.95.122");
          ((com.tencent.mobileqq.msf.core.d)localObject).a(8080);
          c.add(localObject);
          localObject = new com.tencent.mobileqq.msf.core.d();
          ((com.tencent.mobileqq.msf.core.d)localObject).c("112.90.82.216");
          ((com.tencent.mobileqq.msf.core.d)localObject).a(8080);
          c.add(localObject);
          localObject = new com.tencent.mobileqq.msf.core.d();
          ((com.tencent.mobileqq.msf.core.d)localObject).c("112.90.83.32");
          ((com.tencent.mobileqq.msf.core.d)localObject).a(8080);
          c.add(localObject);
          localObject = new com.tencent.mobileqq.msf.core.d();
          ((com.tencent.mobileqq.msf.core.d)localObject).c("183.60.9.149");
          ((com.tencent.mobileqq.msf.core.d)localObject).a(8080);
          c.add(localObject);
          localObject = new com.tencent.mobileqq.msf.core.d();
          ((com.tencent.mobileqq.msf.core.d)localObject).c("183.60.15.152");
          ((com.tencent.mobileqq.msf.core.d)localObject).a(8080);
          c.add(localObject);
          return;
        }
        if (((String)localObject).startsWith("46001"))
        {
          localObject = new com.tencent.mobileqq.msf.core.d();
          ((com.tencent.mobileqq.msf.core.d)localObject).c("112.90.82.216");
          ((com.tencent.mobileqq.msf.core.d)localObject).a(8080);
          b.add(localObject);
          localObject = new com.tencent.mobileqq.msf.core.d();
          ((com.tencent.mobileqq.msf.core.d)localObject).c("112.90.83.32");
          ((com.tencent.mobileqq.msf.core.d)localObject).a(8080);
          b.add(localObject);
          continue;
        }
        if (!localException.startsWith("46003")) {
          continue;
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        QLog.d("ReqAllFailDetector", 1, "loadConfigEndpoint exception", localException);
        return;
      }
      com.tencent.mobileqq.msf.core.d localD = new com.tencent.mobileqq.msf.core.d();
      localD.c("183.60.9.149");
      localD.a(8080);
      b.add(localD);
      localD = new com.tencent.mobileqq.msf.core.d();
      localD.c("183.60.15.152");
      localD.a(8080);
      b.add(localD);
    }
    b = a.aq();
    c = a.ap();
  }
  
  public void a(long paramLong1, String paramString1, int paramInt, String paramString2, long paramLong2)
  {
    if (!e.compareAndSet(false, true)) {
      QLog.d("ReqAllFailDetector", 1, "startReqFailDetect fail by detect running");
    }
    for (;;)
    {
      return;
      try
      {
        QLog.d("ReqAllFailDetector", 1, "startReqFailDetect succ");
        CopyOnWriteArrayList localCopyOnWriteArrayList = c();
        if ((localCopyOnWriteArrayList != null) && (localCopyOnWriteArrayList.size() > 0))
        {
          QLog.d("ReqAllFailDetector", 1, "startReqFailDetect");
          n.sendEmptyMessageDelayed(10000, 180000L);
          h = paramLong1;
          i = paramString1;
          j = paramInt;
          l = paramString2;
          k = paramLong2;
          paramInt = 0;
          while (paramInt < localCopyOnWriteArrayList.size())
          {
            paramString1 = new f(m, (com.tencent.mobileqq.msf.core.d)localCopyOnWriteArrayList.get(paramInt), paramInt);
            paramString1.start();
            d.add(paramString1);
            paramInt += 1;
          }
        }
        e.set(false);
        QLog.d("ReqAllFailDetector", 1, "stopReqFailDetect by sso empty");
        return;
      }
      catch (Exception paramString1)
      {
        paramString1.printStackTrace();
        QLog.d("ReqAllFailDetector", 1, "startReqFailDetect fail by except", paramString1);
      }
    }
  }
  
  public void a(ToServiceMsg paramToServiceMsg)
  {
    try
    {
      if ((e.get()) && (d.size() > 0))
      {
        int i1 = 0;
        while (i1 < d.size())
        {
          ((f)d.get(i1)).a(paramToServiceMsg);
          i1 += 1;
        }
      }
      return;
    }
    catch (Throwable paramToServiceMsg)
    {
      paramToServiceMsg.printStackTrace();
      QLog.d("ReqAllFailDetector", 1, "onSendRequest exception", paramToServiceMsg);
    }
  }
  
  public void b()
  {
    boolean bool2 = false;
    QLog.d("ReqAllFailDetector", 1, "stopReqFailDetect");
    e.set(false);
    label529:
    label532:
    label535:
    label540:
    for (;;)
    {
      try
      {
        Object localObject1 = new StringBuffer();
        Object localObject2 = d.iterator();
        int i1 = 0;
        i2 = 0;
        if (((Iterator)localObject2).hasNext())
        {
          f localF = (f)((Iterator)localObject2).next();
          String str = localF.b();
          localF.a();
          d.remove(localF);
          if (((StringBuffer)localObject1).length() > 0) {
            ((StringBuffer)localObject1).append("#");
          }
          ((StringBuffer)localObject1).append(str);
          if (!c) {
            break label532;
          }
          if (!a) {
            break label535;
          }
          if (b) {
            break label532;
          }
          break label535;
          if ((!c) || (d <= 30000L)) {
            break label529;
          }
          i1 = 1;
          if ((c) && (e > 30000L))
          {
            i1 = 1;
            break label540;
          }
        }
        else
        {
          localObject2 = new HashMap();
          ((HashMap)localObject2).put("host", i);
          ((HashMap)localObject2).put("port", String.valueOf(j));
          ((HashMap)localObject2).put("reason", String.valueOf(l));
          ((HashMap)localObject2).put("sendCount", String.valueOf(k));
          ((HashMap)localObject2).put("connTime", String.valueOf(h));
          ((HashMap)localObject2).put("detectInfo", ((StringBuffer)localObject1).toString());
          localObject1 = BaseApplication.getContext().getPackageName();
          localObject1 = new File(Environment.getExternalStorageDirectory().getPath() + "/tencent/" + ((String)localObject1).replace(".", "/") + "/");
          boolean bool1 = bool2;
          int i3;
          if (((File)localObject1).exists())
          {
            bool1 = bool2;
            if (((File)localObject1).isDirectory())
            {
              localObject1 = ((File)localObject1).list();
              bool1 = bool2;
              if (localObject1 != null)
              {
                bool1 = bool2;
                if (localObject1.length > 0)
                {
                  int i4 = localObject1.length;
                  i3 = 0;
                  bool1 = bool2;
                  if (i3 < i4)
                  {
                    if (!localObject1[i3].endsWith(".pcap")) {
                      continue;
                    }
                    bool1 = true;
                  }
                }
              }
            }
          }
          m.statReporter.a("dim.Msf.ConnRequestAllFailDetect3", bool1, 0L, 0L, (Map)localObject2, false, false);
          if (i2 != 0) {
            m.statReporter.a("dim.Msf.ConnRequestAllFailDetect_Special", bool1, 0L, 0L, (Map)localObject2, false, false);
          }
          if (i1 != 0) {
            m.statReporter.a("dim.Msf.ConnRequestAllFailDetect_Special1", bool1, 0L, 0L, (Map)localObject2, false, false);
          }
          return;
          i3 += 1;
          continue;
        }
      }
      catch (Throwable localThrowable)
      {
        localThrowable.printStackTrace();
        QLog.d("ReqAllFailDetector", 1, "stopReqFailDetect exception", localThrowable);
        return;
      }
      continue;
      continue;
      int i2 = 1;
    }
  }
}
