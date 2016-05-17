package com.tencent.mobileqq.msf.core.push;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Build;
import android.os.Build.VERSION;
import com.qq.jce.wup.UniPacket;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.msf.core.NetConnInfoCenterImpl;
import com.tencent.mobileqq.msf.core.w;
import com.tencent.mobileqq.msf.sdk.MsfCommand;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.msf.sdk.PushRegisterInfo;
import com.tencent.mobileqq.msf.service.MsfService;
import com.tencent.mobileqq.msf.service.c;
import com.tencent.mobileqq.msf.service.g;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.msf.service.protocol.pb.StatSvcSimpleGet.RspBody;
import com.tencent.msf.service.protocol.push.SvcReqRegister;
import com.tencent.msf.service.protocol.push.SvcRespRegister;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.MD5;
import com.tencent.qphone.base.util.QLog;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

public class d
{
  public static final String a = "StatSvc.register";
  public static final String b = "MSF.C.PushManager:PushCoder";
  public static String g;
  public static String h;
  static boolean k = false;
  public static final String l = "com.tencent.mobileqq.msf.WatchdogForInfoLogin";
  private static String m = "SvcReqRegister";
  private static String n = "PushService";
  private static byte o = 0;
  private static boolean p = false;
  private static int q = -1;
  private static String s = "PullUnreadMsgCount";
  private static String t = "MessageSvc";
  private static String u = "SvcReqGet";
  private static String v = "PushService";
  private static final BroadcastReceiver w;
  f c;
  volatile boolean d = false;
  long e = 0L;
  int f = 0;
  long i = 0L;
  int j = 0;
  private final String r = "unrtime";
  private int x = 0;
  private long y = 0L;
  private int z = 0;
  
  static
  {
    g = "StatSvc.get";
    h = "StatSvc.SimpleGet";
    w = new e();
  }
  
  public d(f paramF)
  {
    c = paramF;
  }
  
  long a(String paramString)
  {
    return BaseApplication.getContext().getSharedPreferences("unrtime", 0).getLong(paramString, 0L);
  }
  
  public void a()
  {
    long l1 = System.currentTimeMillis();
    if (y == 0L) {
      y = l1;
    }
    if ((z >= 5) && (l1 - y < 600000L))
    {
      if (QLog.isColorLevel())
      {
        QLog.d("MSF.C.PushManager:PushCoder", 2, "watchdog mStartWatchdogForInfoLoginRetryCount:" + z + " time:" + (l1 - y));
        QLog.d("MSF.C.PushManager:PushCoder", 2, "watchdog launch QQ Process too much stop.");
      }
      return;
    }
    if (z == 5)
    {
      z = 0;
      y = l1;
    }
    z += 1;
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.PushManager:PushCoder", 2, "watchdog startWatchdogForInfoLogin mnWatchdogForInfoLoginRetryCount:" + x);
    }
    if (!k)
    {
      localObject = new IntentFilter();
      ((IntentFilter)localObject).addAction("com.tencent.mobileqq.msf.WatchdogForInfoLogin");
      BaseApplication.getContext().registerReceiver(w, (IntentFilter)localObject);
      k = true;
    }
    getCorembIsInfoLoginGetted.set(false);
    x = 0;
    Object localObject = new Intent("com.tencent.mobileqq.msf.WatchdogForInfoLogin");
    localObject = PendingIntent.getBroadcast(BaseApplication.getContext(), 0, (Intent)localObject, 0);
    ((AlarmManager)BaseApplication.getContext().getSystemService("alarm")).set(0, System.currentTimeMillis() + 10000L, (PendingIntent)localObject);
  }
  
  void a(a paramA, ToServiceMsg paramToServiceMsg, boolean paramBoolean, m paramM)
  {
    if (k == null) {}
    do
    {
      return;
      if ((!com.tencent.mobileqq.msf.core.a.a.ad()) || (com.tencent.mobileqq.msf.core.a.a.a(k.uin))) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("MSF.C.PushManager:PushCoder", 2, k.uin + " is booting and can not autoRegisterPush,return.");
    return;
    boolean bool = a(paramM);
    if ((!bool) && (!paramBoolean) && (d) && (System.currentTimeMillis() - e < 30000L))
    {
      paramA = new StringBuilder().append("also send pushRegister, return. ");
      if (!bool)
      {
        bool = true;
        paramA = paramA.append(bool).append(" ");
        if (paramBoolean) {
          break label179;
        }
      }
      label179:
      for (paramBoolean = true;; paramBoolean = false)
      {
        QLog.d("MSF.C.PushManager:PushCoder", 1, paramBoolean + " " + d);
        return;
        bool = false;
        break;
      }
    }
    if (paramBoolean) {}
    try
    {
      a(paramToServiceMsg.getUin(), System.currentTimeMillis());
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.PushManager:PushCoder", 2, "ConfigManager.isAutoStarting():" + com.tencent.mobileqq.msf.core.a.a.ad());
      }
      try
      {
        localObject2 = new UniPacket(true);
        ((UniPacket)localObject2).setServantName(n);
        ((UniPacket)localObject2).setFuncName(m);
        localObject1 = new SvcReqRegister();
        cConnType = o;
        lBid = c;
        lUin = Long.parseLong(k.uin);
        iStatus = k.iStatus;
        bKikPC = k.bKikPC;
        bKikWeak = k.bKikWeak;
        timeStamp = k.timeStamp;
        iLargeSeq = k.iLargeSeq;
        if ((paramM == m.b) || (paramM == m.g)) {
          break label1044;
        }
        if (paramM != m.h) {
          break label871;
        }
      }
      catch (Exception paramA)
      {
        for (;;)
        {
          Object localObject2;
          Object localObject1;
          int i1;
          ToServiceMsg localToServiceMsg;
          long l1;
          long l2;
          long l3;
          QLog.d("MSF.C.PushManager:PushCoder", 1, "send registerPush error " + paramA, paramA);
          continue;
          if (NetConnInfoCenterImpl.isWifiConn())
          {
            cNetType = 1;
            continue;
            localException2.setMsfCommand(MsfCommand._msf_RegPush);
            continue;
            d = true;
            QLog.d("MSF.C.PushManager:PushCoder", 1, "handlerPush send " + MD5.toMD5(k.uin) + " register push id " + c + " pushStatus:" + k.iStatus + " bRegType:" + bRegType + " timeStamp:" + timeStamp);
            continue;
            i1 = 0;
          }
        }
      }
      bRegType = ((byte)i1);
    }
    catch (Exception localException1)
    {
      try
      {
        for (;;)
        {
          iOSVersion = Integer.parseInt(Build.VERSION.SDK);
          if (!NetConnInfoCenterImpl.isMobileConn()) {
            break;
          }
          cNetType = 0;
          vecGuid = NetConnInfoCenter.GUID;
          strDevName = Build.MODEL;
          strDevType = Build.MODEL;
          strOSVer = Build.VERSION.RELEASE;
          ((UniPacket)localObject2).put(m, localObject1);
          localObject2 = ((UniPacket)localObject2).encode();
          localToServiceMsg = new ToServiceMsg("", k.uin, "StatSvc.register");
          localToServiceMsg.setAppId(a);
          if (paramToServiceMsg != null)
          {
            localToServiceMsg.setAppSeq(paramToServiceMsg.getAppSeq());
            localToServiceMsg.addAttribute("to_srcCmd", paramToServiceMsg.getServiceCmd());
          }
          localToServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
          localToServiceMsg.putWupBuffer((byte[])localObject2);
          localToServiceMsg.setTimeout(30000L);
          localToServiceMsg.addAttribute("regPushReason", paramM.toString());
          if (!paramBoolean) {
            break label933;
          }
          localToServiceMsg.setMsfCommand(MsfCommand._msf_UnRegPush);
          MsfSdkUtils.addToMsgProcessName(b, localToServiceMsg);
          f.q = true;
          e = System.currentTimeMillis();
          c.b.sendSsoMsg(localToServiceMsg);
          e = System.currentTimeMillis();
          if (!paramBoolean) {
            break label944;
          }
          QLog.d("MSF.C.PushManager:PushCoder", 1, "handlerPush send " + MD5.toMD5(k.uin) + " unregister push id " + c + " pushStatus:" + k.iStatus + " bRegType:" + bRegType);
          c.a();
          return;
          if (paramToServiceMsg != null)
          {
            l1 = a(paramToServiceMsg.getUin());
            if (l1 != 0L)
            {
              l2 = System.currentTimeMillis();
              l3 = l2 - l1;
              if (l3 > 0L)
              {
                l3 /= 1000L;
                localObject1 = new HashMap();
                ((HashMap)localObject1).put("unRegtime", String.valueOf(l1));
                ((HashMap)localObject1).put("now", String.valueOf(l2));
                ((HashMap)localObject1).put("uin", paramToServiceMsg.getUin());
                c.b.getStatReporter().a("Msf.RegInterTime", true, l3, 0L, (Map)localObject1, false, false);
              }
              a(paramToServiceMsg.getUin(), 0L);
              continue;
              localException1 = localException1;
              QLog.d("MSF.C.PushManager:PushCoder", 1, "get reginterv error " + localException1, localException1);
            }
          }
        }
        label871:
        i1 = 1;
      }
      catch (Exception localException2)
      {
        for (;;)
        {
          localException2.printStackTrace();
        }
      }
    }
  }
  
  void a(a paramA, boolean paramBoolean)
  {
    if ((com.tencent.mobileqq.msf.core.a.a.t) && (!paramBoolean))
    {
      long l1 = c.g() + c.e();
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.PushManager:PushCoder", 2, "sendMsgPushQuery, check time now=" + f.g.format(Long.valueOf(System.currentTimeMillis())) + ", shouldSendQueryTime=" + f.g.format(Long.valueOf(l1)));
      }
      if (System.currentTimeMillis() < l1) {
        c.a(l1 - System.currentTimeMillis());
      }
    }
    do
    {
      for (;;)
      {
        return;
        if (k != null) {
          if ((k.uin != null) && (c > 0L))
          {
            String str = c.c + "|" + NetConnInfoCenterImpl.getSystemNetworkType() + "|" + NetConnInfoCenterImpl.getCurrentAPN() + "|" + (System.currentTimeMillis() - i);
            ToServiceMsg localToServiceMsg = new ToServiceMsg("", k.uin, h);
            localToServiceMsg.setAppId(a);
            localToServiceMsg.setTimeout(30000L);
            localToServiceMsg.setMsfCommand(MsfCommand._msf_queryPush);
            localToServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
            MsfSdkUtils.addToMsgProcessName(b, localToServiceMsg);
            try
            {
              c.b.sendSsoMsg(localToServiceMsg);
              if (QLog.isColorLevel())
              {
                QLog.d("MSF.C.PushManager:PushCoder", 2, "send " + k.uin + " query push id " + c + " model:" + str);
                return;
              }
            }
            catch (Exception localException)
            {
              for (;;)
              {
                QLog.w("MSF.C.PushManager:PushCoder", 1, "query push error " + localException, localException);
              }
            }
          }
        }
      }
    } while (!QLog.isColorLevel());
    QLog.d("MSF.C.PushManager:PushCoder", 2, "pushUin is " + k.uin + ", queryPushId is " + c + ". no query");
  }
  
  public void a(FromServiceMsg paramFromServiceMsg, ToServiceMsg paramToServiceMsg)
  {
    paramToServiceMsg = g.c();
    try
    {
      if (paramFromServiceMsg.isSuccess())
      {
        UniPacket localUniPacket = new UniPacket(true);
        localUniPacket.decode(paramFromServiceMsg.getWupBuffer());
        paramFromServiceMsg = (com.tencent.msf.service.protocol.a.b)localUniPacket.getByClass("resp_PullUnreadMsgCount", new com.tencent.msf.service.protocol.a.b());
        if ((paramFromServiceMsg != null) && ((c > 0L) || (d > 0L) || (e > 0L)))
        {
          if (QLog.isColorLevel()) {
            QLog.d("MSF.C.PushManager:PushCoder", 2, "UnreadMsg getted, call QQ process now resp.c2c_count:" + c + " resp.group_count :" + d + " resp.discuss_count" + e);
          }
          c(paramToServiceMsg);
          return;
        }
        if (!QLog.isColorLevel()) {
          return;
        }
        QLog.d("MSF.C.PushManager:PushCoder", 2, "UnreadMsg getted,  resp.c2c_count:" + c + " resp.group_count :" + d + " resp.discuss_count" + e);
        return;
      }
    }
    catch (Throwable paramFromServiceMsg)
    {
      QLog.d("MSF.C.PushManager:PushCoder", 1, "handle unreadmsg error " + paramFromServiceMsg, paramFromServiceMsg);
      c(paramToServiceMsg);
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.PushManager:PushCoder", 2, "UnreadMsg timeout, call QQ process now");
    }
    c(paramToServiceMsg);
  }
  
  void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    long l3 = ((Long)paramToServiceMsg.getAttribute("__timestamp_app2msf")).longValue();
    if (l3 > e) {
      d = false;
    }
    long l4 = System.currentTimeMillis() - l3;
    long l5 = com.tencent.mobileqq.msf.core.b.m.a(paramToServiceMsg, paramFromServiceMsg);
    Object localObject2 = null;
    i3 = -1;
    l1 = -1L;
    i2 = -1;
    for (;;)
    {
      try
      {
        if (paramFromServiceMsg.isSuccess()) {
          continue;
        }
        l1 = -1L;
        i1 = 0;
      }
      catch (Throwable localThrowable2)
      {
        Object localObject4;
        label360:
        label385:
        long l2;
        Object localObject1 = "unknown";
        continue;
        localObject1 = "unknown";
        continue;
        l1 = -1L;
        int i1 = 0;
        continue;
        boolean bool = false;
        continue;
      }
      if ((paramToServiceMsg == null) || (!paramToServiceMsg.getAttributes().containsKey("regPushReason"))) {
        continue;
      }
      localObject1 = (String)paramToServiceMsg.getAttribute("regPushReason");
      if (i1 == 0) {
        continue;
      }
      try
      {
        f = 0;
        i = System.currentTimeMillis();
        if (paramToServiceMsg.getMsfCommand() == MsfCommand._msf_UnRegPush)
        {
          QLog.d("MSF.C.PushManager:PushCoder", 1, "handlerPush unregister push succ " + MD5.toMD5(paramFromServiceMsg.getUin()));
          localObject4 = g.b(paramToServiceMsg);
          localObject4 = (a)c.h.get(localObject4);
          if (localObject4 != null)
          {
            i = c.b.nowSocketConnAdd;
            f = System.currentTimeMillis();
            if (localObject2 == null) {
              continue;
            }
            if (QLog.isColorLevel()) {
              QLog.d("MSF.C.PushManager:PushCoder", 2, "recv register push resp.iInterval=" + iHelloInterval + ", queryIntervTime=" + c.e() + ", next query time is " + f.g.format(Long.valueOf(System.currentTimeMillis() + iHelloInterval * 1000)));
            }
            if ((!com.tencent.mobileqq.msf.core.a.a.aI()) || (com.tencent.mobileqq.msf.core.net.a.b.e)) {
              c.y = (iHelloInterval * 1000);
            }
            c.a(c.e());
          }
          if (paramToServiceMsg.getMsfCommand() != MsfCommand._msf_RegPush) {
            continue;
          }
          paramFromServiceMsg.setMsfCommand(MsfCommand.registerPush);
          if (!paramToServiceMsg.getAttributes().containsKey("to_srcCmd")) {
            continue;
          }
          c.b.addRespToQuque(paramToServiceMsg, paramFromServiceMsg);
          localObject2 = c.b.getStatReporter();
          i1 = paramFromServiceMsg.getBusinessFailCode();
          if (paramToServiceMsg.getMsfCommand() != MsfCommand._msf_UnRegPush) {
            continue;
          }
          bool = true;
          ((com.tencent.mobileqq.msf.core.b.m)localObject2).a(true, l4, i1, l5, bool, (String)localObject1);
          return;
          if ((paramFromServiceMsg.getWupBuffer() == null) || (paramFromServiceMsg.getWupBuffer().length < 5)) {
            continue;
          }
          localObject1 = new UniPacket(true);
          try
          {
            ((UniPacket)localObject1).decode(paramFromServiceMsg.getWupBuffer());
            localObject1 = (SvcRespRegister)((UniPacket)localObject1).getByClass("SvcRespRegister", new SvcRespRegister());
          }
          catch (Exception localException1)
          {
            try
            {
              w.c(strClientIP);
              w.d(iClientPort);
              i3 = bUpdateFlag;
              l2 = l1;
            }
            catch (Exception localException2)
            {
              int i4;
              Object localObject3;
              i1 = -1;
              i2 = -1;
              continue;
            }
            try
            {
              l1 = timeStamp;
              l2 = l1;
              i2 = cReplyCode;
            }
            catch (Exception localException3)
            {
              i1 = -1;
              i2 = i3;
              l1 = l2;
              continue;
            }
            try
            {
              NetConnInfoCenter.handleGetServerTimeResp(lServerTime);
              if (QLog.isDevelopLevel()) {
                QLog.d("MSF.C.PushManager:PushCoder", 4, "pushresp servertime is " + lServerTime + c.b.timeFormatter.format(Long.valueOf(lServerTime * 1000L)));
              }
              i1 = 1;
              localObject2 = localObject1;
            }
            catch (Exception localException4)
            {
              i1 = i2;
              i2 = i3;
              continue;
            }
            localException1 = localException1;
            i2 = -1;
            localObject1 = null;
            i1 = -1;
          }
          if (QLog.isColorLevel()) {
            QLog.d("MSF.C.PushManager:PushCoder", 2, "decodeRegisterPushResp error", localException1);
          }
          i4 = 0;
          i3 = i2;
          localObject3 = localObject1;
          i2 = i1;
          i1 = i4;
        }
        else
        {
          QLog.d("MSF.C.PushManager:PushCoder", 1, "handlerPush register push succ " + MD5.toMD5(paramFromServiceMsg.getUin()) + " bUpdateFlag:" + i3 + " timeStamp:" + l1 + " cReplyCode:" + i2);
          b(g.b(paramToServiceMsg));
          continue;
          localObject4 = c.b.getStatReporter();
        }
      }
      catch (Throwable localThrowable1) {}
    }
    i1 = paramFromServiceMsg.getBusinessFailCode();
    if (paramToServiceMsg.getMsfCommand() == MsfCommand._msf_UnRegPush) {}
    for (bool = true;; bool = false)
    {
      ((com.tencent.mobileqq.msf.core.b.m)localObject4).a(false, l4, i1, l5, bool, (String)localObject1);
      c.a(c.e());
      localThrowable1.printStackTrace();
      return;
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.PushManager:PushCoder", 2, "recv null register push resp, use default intervTime " + c.e());
      }
      c.a(c.e());
      break;
      if (paramToServiceMsg.getMsfCommand() == MsfCommand._msf_UnRegPush)
      {
        paramFromServiceMsg.setMsfCommand(MsfCommand.unRegisterPush);
        break label360;
      }
      paramFromServiceMsg.setMsfCommand(paramToServiceMsg.getMsfCommand());
      break label360;
      MsfSdkUtils.addFromMsgProcessName(g.b(paramToServiceMsg), paramFromServiceMsg);
      c.b.addRespToQuque(null, paramFromServiceMsg);
      break label385;
      com.tencent.mobileqq.msf.core.b.m localM;
      if ((l3 > e) && (!d))
      {
        f.q = false;
        if (f > 2)
        {
          if (QLog.isColorLevel()) {
            QLog.d("MSF.C.PushManager:PushCoder", 2, "register push register error, retry count " + f + ", set retry at " + f.g.format(Long.valueOf(c.e() + System.currentTimeMillis())));
          }
          f = 0;
          c.a(c.e());
        }
      }
      else
      {
        localM = c.b.getStatReporter();
        i1 = paramFromServiceMsg.getBusinessFailCode();
        if (paramToServiceMsg.getMsfCommand() != MsfCommand._msf_UnRegPush) {
          break label1155;
        }
      }
      label1155:
      for (bool = true;; bool = false)
      {
        localM.a(false, l4, i1, l5, bool, (String)localObject1);
        return;
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.PushManager:PushCoder", 2, "register push register error, retry count " + f + ",set retry at " + f.g.format(Long.valueOf(60000L + System.currentTimeMillis())));
        }
        f += 1;
        c.a(60000L);
        break;
      }
    }
  }
  
  void a(String paramString, long paramLong)
  {
    BaseApplication.getContext().getSharedPreferences("unrtime", 0).edit().putLong(paramString, paramLong).commit();
  }
  
  boolean a(m paramM)
  {
    return (paramM == m.b) || (paramM == m.g) || (paramM == m.h);
  }
  
  public void b()
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.PushManager:PushCoder", 2, "watchdog startWatchdogCallback mnWatchdogForInfoLoginRetryCount:" + x);
    }
    String str = MsfSdkUtils.getProcessName(BaseApplication.getContext());
    Object localObject = str;
    if (str != null)
    {
      localObject = str;
      if (str.indexOf(":") > 0) {
        localObject = str.substring(0, str.indexOf(":"));
      }
    }
    localObject = (a)c.h.get(localObject);
    if ((localObject == null) || (k == null) || (MsfService.getCore().getUinPushStatus(k.uin) == 95)) {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.PushManager:PushCoder", 2, "watchdog startWatchdogCallback in 95 status do not start QQ Process");
      }
    }
    do
    {
      do
      {
        return;
        if (!getCorembIsInfoLoginGetted.get()) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.d("MSF.C.PushManager:PushCoder", 2, "watchdog startWatchdogCallback mbIsInfoLoginGetted:" + getCorembIsInfoLoginGetted + " ok");
      return;
      if (!g.b()) {
        break;
      }
      if (x < 6)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.PushManager:PushCoder", 2, "watchdog startWatchdogCallback QQProcessRunning mnWatchdogForInfoLoginRetryCount:" + x);
        }
        x += 1;
        localObject = new Intent("com.tencent.mobileqq.msf.WatchdogForInfoLogin");
        localObject = PendingIntent.getBroadcast(BaseApplication.getContext(), 0, (Intent)localObject, 0);
        ((AlarmManager)BaseApplication.getContext().getSystemService("alarm")).set(0, System.currentTimeMillis() + 10000L, (PendingIntent)localObject);
        return;
      }
    } while (!QLog.isColorLevel());
    QLog.d("MSF.C.PushManager:PushCoder", 2, "watchdog startWatchdogCallback QQProcessRunning mnWatchdogForInfoLoginRetryCount:" + x);
    return;
    QLog.d("MSF.C.PushManager:PushCoder", 1, "watchdog startWatchdogCallback QQProcess killed restart now");
    c(g.c());
  }
  
  void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    String str = g.b(paramToServiceMsg);
    if ((a)c.h.get(str) != null)
    {
      long l1 = System.currentTimeMillis();
      long l2 = ((Long)paramToServiceMsg.getAttribute("__timestamp_app2msf")).longValue();
      long l3 = com.tencent.mobileqq.msf.core.b.m.a(paramToServiceMsg, paramFromServiceMsg);
      try
      {
        if (paramFromServiceMsg.isSuccess())
        {
          paramToServiceMsg = new byte[paramFromServiceMsg.getWupBuffer().length - 4];
          System.arraycopy(paramFromServiceMsg.getWupBuffer(), 4, paramToServiceMsg, 0, paramToServiceMsg.length);
          paramFromServiceMsg = new StatSvcSimpleGet.RspBody();
          paramFromServiceMsg.mergeFrom(paramToServiceMsg);
          j = 0;
          if ((!com.tencent.mobileqq.msf.core.a.a.aI()) || (com.tencent.mobileqq.msf.core.net.a.b.e)) {
            c.y = (uint32_hello_interval.get() * 1000);
          }
          c.a(c.e());
          w.c(str_clientip.get());
          return;
        }
        c.b.getStatReporter().a(false, l1 - l2, paramFromServiceMsg.getBusinessFailCode(), l3);
        c.a(180000L);
        return;
      }
      catch (Throwable paramToServiceMsg)
      {
        paramToServiceMsg.printStackTrace();
        c.a(c.e());
      }
    }
  }
  
  void b(String paramString)
  {
    if (c.a()) {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.PushManager:PushCoder", 2, paramString + " is running, no need send SvcRequestPullUnreadMsgCountReq");
      }
    }
    do
    {
      return;
      paramString = (a)c.h.get(paramString);
      if (MsfService.getCore().getUinPushStatus(k.uin) != 95) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("MSF.C.PushManager:PushCoder", 2, "on recvOfflineMsg status don't start QQ");
    return;
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.PushManager:PushCoder", 2, "QQ not running, send SvcRequestPullUnreadMsgCountReq now");
    }
    UniPacket localUniPacket = new UniPacket(true);
    localUniPacket.setServantName(t);
    localUniPacket.setFuncName(s);
    Object localObject = new com.tencent.msf.service.protocol.a.a();
    a = true;
    b = true;
    c = true;
    localUniPacket.put("req_PullUnreadMsgCount", localObject);
    localObject = new ToServiceMsg("", k.uin, "MessageSvc.PullUnreadMsgCount");
    ((ToServiceMsg)localObject).setAppId(a);
    ((ToServiceMsg)localObject).setTimeout(30000L);
    ((ToServiceMsg)localObject).setRequestSsoSeq(MsfCore.getNextSeq());
    ((ToServiceMsg)localObject).setNeedCallback(true);
    ((ToServiceMsg)localObject).setTimeout(30000L);
    ((ToServiceMsg)localObject).putWupBuffer(localUniPacket.encode());
    try
    {
      c.b.sendSsoMsg((ToServiceMsg)localObject);
      return;
    }
    catch (Exception paramString)
    {
      QLog.w("MSF.C.PushManager:PushCoder", 1, "query push error " + paramString, paramString);
    }
  }
  
  void c(String paramString)
  {
    f.o = true;
    a();
    NetConnInfoCenterImpl.callQQProcess(paramString);
  }
}
