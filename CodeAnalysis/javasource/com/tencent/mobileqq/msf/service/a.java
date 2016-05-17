package com.tencent.mobileqq.msf.service;

import android.os.DeadObjectException;
import android.os.SystemClock;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.b.e;
import com.tencent.mobileqq.msf.core.b.e.a;
import com.tencent.mobileqq.msf.core.b.m;
import com.tencent.mobileqq.msf.core.push.d;
import com.tencent.mobileqq.msf.core.push.f;
import com.tencent.mobileqq.msf.sdk.MsfCommand;
import com.tencent.mobileqq.msf.sdk.MsfMessagePair;
import com.tencent.qphone.base.BaseConstants;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.IMsfServiceCallbacker;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;

class a
  extends Thread
{
  private static final int e = 10;
  volatile Object a = new Object();
  volatile boolean b = false;
  volatile boolean c = true;
  int d = 0;
  
  a() {}
  
  private static boolean a(String paramString, b paramB)
  {
    int i = 0;
    int j;
    MsfMessagePair localMsfMessagePair2;
    label43:
    Object localObject1;
    boolean bool2;
    label65:
    Object localObject2;
    label95:
    boolean bool1;
    label214:
    label233:
    boolean bool3;
    if (!g.isEmpty())
    {
      i += 1;
      j = i;
      if (i <= 10)
      {
        localMsfMessagePair2 = (MsfMessagePair)g.peek();
        if (localMsfMessagePair2 == null) {
          j = i;
        }
      }
      else
      {
        if (j <= 10) {
          break label1234;
        }
        return true;
      }
      localObject1 = paramB.c();
      if (localObject1 == null)
      {
        bool2 = true;
        if (!bool2) {
          break label444;
        }
        bool2 = false;
        localObject2 = fromServiceMsg.getServiceCmd();
        localObject1 = BaseConstants.CMD_NeedBootPushCmdHeads;
        int k = localObject1.length;
        j = 0;
        bool1 = bool2;
        if (j < k)
        {
          Object localObject3 = localObject1[j];
          if ((localObject2 == null) || (!((String)localObject2).startsWith((String)localObject3))) {
            break label437;
          }
          a = false;
          c = false;
          if ((!"LongConn.OffPicUp".equalsIgnoreCase((String)localObject2)) && (!"ImgStore.GroupPicUp".equalsIgnoreCase((String)localObject2))) {
            break label1236;
          }
          localObject3 = new StringBuilder().append("dispatchMsg:").append((String)localObject2).append(" resp:").append(fromServiceMsg.getStringForLog()).append(" req:");
          if (toServiceMsg == null) {
            break label430;
          }
          localObject1 = toServiceMsg.getStringForLog();
          QLog.d("MSF.S.AppProcessManager", 1, (String)localObject1);
          bool1 = true;
        }
        if (QLog.isColorLevel()) {
          QLog.d("MSF.S.AppProcessManager", 2, paramString + "'s callBack is null; " + (String)localObject2 + " is cared: " + bool1);
        }
        bool3 = true;
        bool2 = bool1;
        bool1 = bool3;
      }
    }
    for (;;)
    {
      label290:
      if (("LongConn.OffPicUp".equalsIgnoreCase(fromServiceMsg.getServiceCmd())) || ("ImgStore.GroupPicUp".equalsIgnoreCase(fromServiceMsg.getServiceCmd()))) {
        QLog.d("MSF.S.AppProcessManager", 1, "dispatchMsg:" + fromServiceMsg.getStringForLog() + " processDied:" + bool2 + " isSendToSink:" + bool1);
      }
      if (fromServiceMsg.getAttribute("resp_needBootApp") != null)
      {
        bool1 = true;
        label390:
        if (bool2) {
          break label779;
        }
        g.poll();
        if (bool1) {
          paramB.a(3, fromServiceMsg.getUin());
        }
      }
      for (;;)
      {
        break;
        bool2 = false;
        break label65;
        label430:
        localObject1 = "null";
        break label214;
        label437:
        j += 1;
        break label95;
        label444:
        if ((c == true) && (fromServiceMsg.getMsfCommand() != MsfCommand.setMsfConnStatus))
        {
          j = i;
          if (SystemClock.elapsedRealtime() - b < 2000L) {
            break label43;
          }
          c = false;
          if (QLog.isColorLevel()) {
            QLog.d("MSF.S.AppProcessManager", 2, "half close timeout " + paramString + " isAppConnected " + a);
          }
        }
        try
        {
          if (toServiceMsg == null)
          {
            ((IMsfServiceCallbacker)localObject1).onRecvPushResp(fromServiceMsg);
            if (QLog.isColorLevel()) {
              QLog.d("MSF.S.AppProcessManager", 2, "send push " + paramString + " from:" + fromServiceMsg);
            }
          }
          else
          {
            ((IMsfServiceCallbacker)localObject1).onResponse(toServiceMsg, fromServiceMsg);
            if (QLog.isColorLevel()) {
              QLog.d("MSF.S.AppProcessManager", 2, "send resp " + paramString + " to:" + toServiceMsg + " from:" + fromServiceMsg);
            }
          }
        }
        catch (DeadObjectException localDeadObjectException)
        {
          bool3 = true;
          boolean bool4 = false;
          paramB.d();
          bool1 = bool4;
          bool2 = bool3;
          if (!QLog.isColorLevel()) {
            break label290;
          }
          QLog.d("MSF.S.AppProcessManager", 2, "DeadObjectException");
          bool1 = bool4;
          bool2 = bool3;
          break label290;
        }
        catch (Exception localException1)
        {
          if (QLog.isColorLevel()) {
            QLog.d("MSF.S.AppProcessManager", 2, localMsfMessagePair2.toString() + " " + fromServiceMsg, localException1);
          }
          bool1 = false;
        }
        break label290;
        bool1 = false;
        break label390;
        label779:
        if (QLog.isColorLevel()) {
          QLog.d("MSF.S.AppProcessManager", 2, "need boot " + bool1 + " " + paramString + " from:" + fromServiceMsg);
        }
        try
        {
          if (fromServiceMsg.getServiceCmd().equals("MessageSvc.PushNotify")) {
            c.e.getStatReporter().a("dim.Msf.PushRecvFail", true, 0L, 0L, null, true, false);
          }
          if (!bool1) {}
        }
        catch (Exception localException2)
        {
          for (;;)
          {
            try
            {
              paramB.a(0, fromServiceMsg.getUin());
              d += 1L;
              if (d > com.tencent.mobileqq.msf.core.a.a.au())
              {
                MsfMessagePair localMsfMessagePair1 = (MsfMessagePair)g.poll();
                localObject2 = new HashMap();
                c.a((HashMap)localObject2);
                ((HashMap)localObject2).put("MsgType", fromServiceMsg.toString());
                ((HashMap)localObject2).put("ProcName", paramString);
                ((HashMap)localObject2).put("uin", fromServiceMsg.getUin());
                ((HashMap)localObject2).put("appid", String.valueOf(fromServiceMsg.getAppId()));
                ((HashMap)localObject2).put("MsgLeft", String.valueOf(g.size()));
                QLog.d("MSF.S.AppProcessManager", 1, "dispatchMsg boot too many times:" + com.tencent.mobileqq.msf.core.a.a.au() + " MsgType:" + fromServiceMsg.toString() + " ProcName:" + paramString + " MsgLeft:" + String.valueOf(g.size()));
                c.e.getStatReporter().a("dim.Msf.ForkProcFailed", false, 0L, 0L, (Map)localObject2, true, false);
                d = 0L;
                if ((fromServiceMsg != null) && (fromServiceMsg.getServiceCmd() != null) && (fromServiceMsg.getServiceCmd().equals("SharpSvr.s2c"))) {
                  e.a().a(e.a.c, fromServiceMsg.getWupBuffer(), 14);
                }
              }
              return false;
            }
            catch (Exception localException3)
            {
              QLog.d("MSF.S.AppProcessManager", 1, "needBoot:" + bool1, localException3);
            }
            localException2 = localException2;
            if (QLog.isColorLevel()) {
              QLog.d("MSF.S.AppProcessManager", 2, "failed to report push notify event");
            }
          }
          g.poll();
        }
      }
      label1234:
      return false;
      label1236:
      bool1 = true;
      break label233;
      j = i;
      break label43;
      bool1 = true;
    }
  }
  
  private static boolean b(String paramString, b paramB)
  {
    boolean bool2 = false;
    int i = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (!g.isEmpty())
      {
        if (i <= 10) {
          break label31;
        }
        bool1 = true;
      }
      label31:
      MsfMessagePair localMsfMessagePair;
      do
      {
        return bool1;
        localMsfMessagePair = (MsfMessagePair)g.peek();
        bool1 = bool2;
      } while (localMsfMessagePair == null);
      if (fromServiceMsg.getAttribute("resp_needBootApp") != null) {}
      for (int j = 1;; j = 0)
      {
        Object localObject;
        if ((paramB.c() == null) && (j != 0))
        {
          bool1 = bool2;
          if (fromServiceMsg == null) {
            break;
          }
          localObject = BaseConstants.CMD_NeedBootPushCmdHeads;
          j = localObject.length;
          i = 0;
          label101:
          if (i >= j) {
            break label1170;
          }
          String str = localObject[i];
          if (!fromServiceMsg.getServiceCmd().startsWith(str)) {}
        }
        label1170:
        for (i = 1;; i = 0)
        {
          if (i != 0)
          {
            a = false;
            c = false;
            i = c.e.getUinPushStatus(fromServiceMsg.getUin());
            g.a(BaseApplication.getContext(), paramString, fromServiceMsg.getUin(), ((b)c.c.get(paramString)).b(), i);
            getCorepushManager.i.a();
            if (QLog.isColorLevel()) {
              QLog.d("MSF.S.AppProcessManager", 2, "need boot app " + paramString + " from:" + fromServiceMsg);
            }
            d += 1L;
            bool1 = bool2;
            if (d <= com.tencent.mobileqq.msf.core.a.a.au()) {
              break;
            }
            localMsfMessagePair = (MsfMessagePair)g.poll();
            localObject = new HashMap();
            c.a((HashMap)localObject);
            ((HashMap)localObject).put("MsgType", fromServiceMsg.toString());
            ((HashMap)localObject).put("ProcName", paramString);
            ((HashMap)localObject).put("uin", fromServiceMsg.getUin());
            ((HashMap)localObject).put("appid", String.valueOf(fromServiceMsg.getAppId()));
            ((HashMap)localObject).put("MsgLeft", String.valueOf(g.size()));
            QLog.d("MSF.S.AppProcessManager", 1, "sendAppMsgPair boot too many times:" + com.tencent.mobileqq.msf.core.a.a.au() + " MsgType:" + fromServiceMsg.toString() + " ProcName:" + paramString + " MsgLeft:" + String.valueOf(g.size()));
            c.e.getStatReporter().a("dim.Msf.ForkProcFailed", false, 0L, 0L, (Map)localObject, true, false);
            d = 0L;
            return false;
            i += 1;
            break label101;
          }
          g.poll();
          bool1 = bool2;
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.d("MSF.S.AppProcessManager", 2, "need boot app but not in CMD_NeedBootPushCmdHeads " + paramString + " from:" + fromServiceMsg);
          return false;
          if ((c == true) && (fromServiceMsg.getMsfCommand() != MsfCommand.setMsfConnStatus))
          {
            bool1 = bool2;
            if (SystemClock.elapsedRealtime() - b < 2000L) {
              break;
            }
            c = false;
            if (QLog.isColorLevel()) {
              QLog.d("MSF.S.AppProcessManager", 2, "half close timeout " + paramString + " isAppConnected " + a);
            }
          }
          if (a)
          {
            try
            {
              if (toServiceMsg == null)
              {
                paramB.c().onRecvPushResp(fromServiceMsg);
                if (QLog.isColorLevel()) {
                  QLog.d("MSF.S.AppProcessManager", 2, "send push " + paramString + " from:" + fromServiceMsg);
                }
              }
              for (;;)
              {
                g.poll();
                break;
                paramB.c().onResponse(toServiceMsg, fromServiceMsg);
                if (QLog.isColorLevel()) {
                  QLog.d("MSF.S.AppProcessManager", 2, "send resp " + paramString + " to:" + toServiceMsg + " from:" + fromServiceMsg);
                }
              }
            }
            catch (DeadObjectException localDeadObjectException)
            {
              paramB.d();
              if (j != 0)
              {
                i = c.e.getUinPushStatus(fromServiceMsg.getUin());
                if (c.c.get(paramString) != null)
                {
                  g.a(BaseApplication.getContext(), paramString, fromServiceMsg.getUin(), ((b)c.c.get(paramString)).b(), i);
                  getCorepushManager.i.a();
                }
              }
              for (;;)
              {
                bool1 = bool2;
                if (!QLog.isColorLevel()) {
                  break;
                }
                QLog.d("MSF.S.AppProcessManager", 2, "found DeadObjectException " + localDeadObjectException.toString());
                return false;
                g.poll();
                if (QLog.isColorLevel()) {
                  QLog.d("MSF.S.AppProcessManager", 2, "found not NeedBootMsg," + fromServiceMsg + " dropped");
                }
              }
            }
            catch (Throwable localThrowable)
            {
              g.poll();
              localThrowable.printStackTrace();
              if (!QLog.isColorLevel()) {
                break label1180;
              }
            }
            QLog.d("MSF.S.AppProcessManager", 2, "handle error " + localMsfMessagePair.toString() + " " + fromServiceMsg + " ", localThrowable);
            break label1180;
          }
          if (j != 0)
          {
            i = c.e.getUinPushStatus(fromServiceMsg.getUin());
            g.a(BaseApplication.getContext(), paramString, fromServiceMsg.getUin(), ((b)c.c.get(paramString)).b(), i);
            getCorepushManager.i.a();
            return false;
          }
          g.poll();
          if (!QLog.isColorLevel()) {
            break label1180;
          }
          QLog.d("MSF.S.AppProcessManager", 2, "found " + e + " notNeedBootMsg," + fromServiceMsg + " dropped");
          break label1180;
        }
      }
      label1180:
      i += 1;
    }
  }
  
  public void a()
  {
    synchronized (a)
    {
      c = true;
      b = false;
      a.notify();
      return;
    }
  }
  
  public void run()
  {
    ff = false;
    while (c)
    {
      c = false;
      d = 0;
      ??? = c.c.keySet().iterator();
      while (((Iterator)???).hasNext())
      {
        String str = (String)((Iterator)???).next();
        b localB = (b)c.c.get(str);
        if (localB != null)
        {
          if (a(str, localB)) {
            c = true;
          }
          d += g.size();
        }
      }
    }
    c.f.a(2);
    b = true;
    for (;;)
    {
      synchronized (a)
      {
        boolean bool = b;
        if (bool) {}
        try
        {
          if (d == 0)
          {
            a.wait(61440L);
            c = true;
          }
        }
        catch (InterruptedException localInterruptedException)
        {
          localInterruptedException.printStackTrace();
          continue;
        }
      }
      a.wait(600L);
    }
  }
}
