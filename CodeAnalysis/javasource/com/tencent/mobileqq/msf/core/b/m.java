package com.tencent.mobileqq.msf.core.b;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.SupplicantState;
import android.net.wifi.WifiInfo;
import android.os.SystemClock;
import android.provider.Settings.System;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.tencent.beacon.event.UserAction;
import com.tencent.feedback.eup.CrashHandleListener;
import com.tencent.feedback.eup.CrashReport;
import com.tencent.feedback.eup.CrashStrategyBean;
import com.tencent.feedback.upload.UploadHandleListener;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.NetConnInfoCenterImpl;
import com.tencent.mobileqq.msf.core.c;
import com.tencent.mobileqq.msf.core.d;
import com.tencent.mobileqq.msf.core.net.g;
import com.tencent.mobileqq.msf.core.net.h;
import com.tencent.mobileqq.msf.core.net.h.a;
import com.tencent.mobileqq.msf.core.net.q;
import com.tencent.mobileqq.msf.core.w;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.msf.sdk.RdmReq;
import com.tencent.mobileqq.msf.service.MsfService;
import com.tencent.qphone.base.BaseConstants;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

public class m
{
  static final String A = "param_NowLocalIp";
  static final String B = "param_sendLocalIp";
  static final String C = "param_Detail";
  static final String D = "param_tokenType";
  public static final String E = "param_reportTime";
  static final String F = "param_LoginConnect";
  static final String G = "param_connectContinuanceTime";
  static HashSet I = null;
  public static volatile boolean J = false;
  static long K = 0L;
  static long L = 0L;
  static AtomicBoolean M = new AtomicBoolean(false);
  static Thread N = new n("MsfCheckDeepSleepThread");
  private static LinkedBlockingQueue P = new LinkedBlockingQueue(100);
  private static ConcurrentHashMap Q = new ConcurrentHashMap();
  private static long R = 3600000L;
  private static SimpleDateFormat U = new SimpleDateFormat("MM.dd HH:mm:ss.SSS");
  static final String a = "MSF.C.StatReport";
  public static final String b = "param_Reason";
  public static final String c = "param_connecttrycount";
  static final String d = "param_sendTime";
  static final String e = "param_connResult";
  static final String f = "param_connFailReason";
  static final String g = "param_connNetType";
  static final String h = "param_connOpenNetType";
  static final String i = "param_connElapseTime";
  static final String j = "param_localIp";
  static final String k = "param_NetworkStatus";
  static final String l = "param_ssoInfo";
  static final String m = "param_liveTime";
  static final String n = "param_sendBytes";
  static final String o = "param_recvBytes";
  static final String p = "param_runStatus";
  static final String q = "param_deepSleep";
  static final String r = "param_runStatus_new";
  static final String s = "param_isDefaultList";
  static final String t = "param_isConnected";
  static final String u = "param_uin";
  static final String v = "param_src";
  static final String w = "param_imei";
  static final String x = "param_FailCode";
  static final String y = "param_SsoServerIp";
  static final String z = "param_GatewayIp";
  MsfCore H;
  boolean O = false;
  private a S = new a();
  private StringBuilder T = new StringBuilder("Msf Crash Control info:\n");
  
  public m(MsfCore paramMsfCore)
  {
    H = paramMsfCore;
    i.a(this, paramMsfCore);
    R = com.tencent.mobileqq.msf.core.a.a.l();
  }
  
  public static byte a(boolean paramBoolean, long paramLong1, long paramLong2)
  {
    int i2 = 0;
    int i3;
    label26:
    int i4;
    if (i())
    {
      i1 = 1;
      i3 = (byte)i1;
      if (!h()) {
        break label251;
      }
      i1 = 2;
      i4 = (byte)i1;
      boolean bool = paramBoolean;
      if (!paramBoolean)
      {
        bool = paramBoolean;
        if (paramLong1 <= paramLong2)
        {
          Iterator localIterator = Q.entrySet().iterator();
          Map.Entry localEntry;
          do
          {
            bool = paramBoolean;
            if (!localIterator.hasNext()) {
              break;
            }
            localEntry = (Map.Entry)localIterator.next();
          } while ((paramLong1 >= ((Long)localEntry.getValue()).longValue()) || (paramLong2 <= ((Long)localEntry.getKey()).longValue()));
          if (QLog.isColorLevel()) {
            QLog.d("MSF.C.StatReport", 2, "find deep sleep. report time:[" + paramLong1 + ", " + paramLong2 + "], sleep time:[" + localEntry.getKey() + ", " + localEntry.getValue() + "]");
          }
          bool = true;
        }
      }
      if (!bool) {
        break label257;
      }
    }
    label251:
    label257:
    for (int i1 = 4;; i1 = 0)
    {
      int i5 = (byte)i1;
      i1 = i2;
      if (j()) {
        i1 = 8;
      }
      return (byte)(i5 | i3 | i4 | (byte)i1);
      i1 = 0;
      break;
      i1 = 0;
      break label26;
    }
  }
  
  public static long a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    long l2 = 0L;
    long l1 = l2;
    if (paramToServiceMsg != null)
    {
      l1 = l2;
      if (paramToServiceMsg.getWupBuffer() != null) {
        l1 = 0L + paramToServiceMsg.getWupBuffer().length;
      }
    }
    l2 = l1;
    if (paramFromServiceMsg != null)
    {
      l2 = l1;
      if (paramFromServiceMsg.getWupBuffer() != null) {
        l2 = l1 + paramFromServiceMsg.getWupBuffer().length;
      }
    }
    return l2;
  }
  
  private String a(d paramD)
  {
    if (paramD == null) {
      return "null EndpointKey";
    }
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(paramD.b()).append("://");
    localStringBuilder.append(paramD.c()).append(":").append(paramD.d());
    return localStringBuilder.toString();
  }
  
  public static long b(boolean paramBoolean, long paramLong1, long paramLong2)
  {
    if (!paramBoolean) {}
    while (paramLong1 >= paramLong2) {
      return 0L;
    }
    Iterator localIterator = Q.entrySet().iterator();
    long l1 = 0L;
    Map.Entry localEntry;
    if (localIterator.hasNext())
    {
      localEntry = (Map.Entry)localIterator.next();
      if ((paramLong1 >= ((Long)localEntry.getKey()).longValue()) && (paramLong1 <= ((Long)localEntry.getValue()).longValue()))
      {
        if (paramLong2 <= ((Long)localEntry.getValue()).longValue()) {
          return paramLong2 - paramLong1;
        }
        l1 = ((Long)localEntry.getValue()).longValue() + l1 - paramLong1;
      }
    }
    for (;;)
    {
      break;
      if (paramLong1 < ((Long)localEntry.getKey()).longValue()) {
        if ((paramLong2 >= ((Long)localEntry.getKey()).longValue()) && (paramLong2 <= ((Long)localEntry.getValue()).longValue()))
        {
          l1 = l1 + paramLong2 - ((Long)localEntry.getKey()).longValue();
        }
        else if (paramLong2 > ((Long)localEntry.getValue()).longValue())
        {
          l1 = l1 + ((Long)localEntry.getValue()).longValue() - ((Long)localEntry.getKey()).longValue();
          continue;
          return l1;
        }
      }
    }
  }
  
  static void b(boolean paramBoolean)
  {
    while (!P.isEmpty())
    {
      StringBuilder localStringBuilder;
      Map localMap;
      for (;;)
      {
        try
        {
          RdmReq localRdmReq = (RdmReq)P.take();
          if (localRdmReq == null) {
            break;
          }
          localStringBuilder = new StringBuilder();
          localMap = params;
          if (localMap == null) {
            break label262;
          }
          long l1 = Long.parseLong((String)localMap.get("param_reportTime"));
          long l2 = l1 - elapse;
          int i1 = a(paramBoolean, l2, l1);
          localMap.put("param_runStatus", String.valueOf(i1));
          if ((i1 & 0x4) != 0) {
            break label257;
          }
          bool = false;
          localMap.put("param_deepSleep", String.valueOf(b(bool, l2, l1)));
          localMap.remove("param_reportTime");
          Iterator localIterator = localMap.entrySet().iterator();
          if (!localIterator.hasNext()) {
            break label262;
          }
          Map.Entry localEntry = (Map.Entry)localIterator.next();
          localStringBuilder.append("k=").append((String)localEntry.getKey()).append(", v=").append((String)localEntry.getValue()).append("; ");
          continue;
          if (!QLog.isColorLevel()) {
            break;
          }
        }
        catch (Exception localException) {}
        QLog.w("MSF.C.StatReport", 2, "report RQD error " + localException, localException);
        break;
        label257:
        boolean bool = true;
      }
      label262:
      UserAction.onUserAction(eventName, isSucceed, elapse, size, localMap, isRealTime);
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.StatReport", 2, "report RQD IMEI:" + com.tencent.mobileqq.msf.core.n.d() + " eventName=" + eventName + " isSucceed:" + isSucceed + " elapse:" + elapse + " size:" + size + " isRealTime:" + isRealTime + " isMerge:" + isMerge + " params:" + localStringBuilder.toString());
      }
    }
  }
  
  private static boolean h()
  {
    return !MsfSdkUtils.isTopActivity(BaseApplication.getContext());
  }
  
  private static boolean i()
  {
    return !MsfSdkUtils.isScreenOn(BaseApplication.getContext());
  }
  
  private static boolean j()
  {
    boolean bool = false;
    if (Settings.System.getInt(BaseApplication.getContext().getContentResolver(), "airplane_mode_on", 0) != 0) {
      bool = true;
    }
    return bool;
  }
  
  void a()
  {
    String str = com.tencent.mobileqq.msf.core.a.a.Z();
    if (!TextUtils.isEmpty(str)) {}
    try
    {
      Object localObject = new JSONObject(str);
      S.a = ((JSONObject)localObject).getBoolean("control_switch");
      S.b = ((JSONObject)localObject).getInt("control_window");
      S.c = ((JSONObject)localObject).getInt("control_freq");
      localObject = T.append("initCrashControl");
      ((StringBuilder)localObject).append(",controlJson=").append(str);
      ((StringBuilder)localObject).append(",switch=").append(S.a);
      ((StringBuilder)localObject).append(",window=").append(S.b);
      ((StringBuilder)localObject).append(",Freq=").append(S.c);
      ((StringBuilder)localObject).append("\n");
      return;
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        S.a();
        QLog.d("MSF.C.StatReport", 1, "initCrashControl parse json throws an exception, so reset.");
      }
    }
  }
  
  public void a(long paramLong1, int paramInt, long paramLong2)
  {
    if (NetConnInfoCenterImpl.isWifiOrMobileConn())
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("param_FailCode", String.valueOf(paramInt));
      a("dim.Msf.TokenExpired", false, paramLong1, paramLong2, localHashMap, false, false);
    }
  }
  
  public void a(long paramLong, String paramString1, String paramString2)
  {
    String str = "" + paramLong;
    str = str + "|";
    paramString1 = str + paramString1;
    paramString1 = paramString1 + "|";
    paramString1 = paramString1 + paramString2;
    paramString2 = new HashMap();
    paramString2.put("param_connectContinuanceTime", paramString1);
    a("msf_connectContinuanceTime", false, paramLong, 0L, paramString2, false, false);
  }
  
  public void a(WifiInfo paramWifiInfo)
  {
    int i2;
    label45:
    int i3;
    if ((paramWifiInfo.getBSSID() == null) || (paramWifiInfo.getIpAddress() == 0) || (paramWifiInfo.getSupplicantState() != SupplicantState.COMPLETED))
    {
      if (paramWifiInfo.getBSSID() != null) {
        break label106;
      }
      i1 = 1;
      i2 = (byte)i1;
      if (paramWifiInfo.getIpAddress() != 0) {
        break label111;
      }
      i1 = 2;
      i3 = (byte)i1;
      if (paramWifiInfo.getSupplicantState() == SupplicantState.COMPLETED) {
        break label116;
      }
    }
    label106:
    label111:
    label116:
    for (int i1 = 4;; i1 = 0)
    {
      i1 = (byte)i1;
      paramWifiInfo = new HashMap();
      paramWifiInfo.put("param_FailCode", String.valueOf((i1 | i2 | i3) + 5000));
      a("dim.Msf.WifiNoConnection", false, 0L, 0L, paramWifiInfo, true, false);
      return;
      i1 = 0;
      break;
      i1 = 0;
      break label45;
    }
  }
  
  public void a(String paramString)
  {
    UserAction.setUserID(paramString);
    CrashReport.setUserId(BaseApplication.getContext(), paramString);
  }
  
  public void a(String paramString, boolean paramBoolean, long paramLong1, int paramInt, long paramLong2)
  {
    if (NetConnInfoCenterImpl.isWifiOrMobileConn())
    {
      if (I == null) {
        I = new HashSet();
      }
      if (!I.contains(paramString)) {}
    }
    else
    {
      return;
    }
    I.add(paramString);
    HashMap localHashMap = new HashMap();
    localHashMap.put("param_uin", paramString);
    localHashMap.put("param_FailCode", String.valueOf(paramInt));
    a("dim.Msf.UserGrayfail", paramBoolean, paramLong1, paramLong2, localHashMap, false, false);
  }
  
  public void a(String paramString, boolean paramBoolean1, long paramLong1, long paramLong2, Map paramMap, boolean paramBoolean2, boolean paramBoolean3)
  {
    if (J)
    {
      J = false;
      e();
    }
    if (com.tencent.mobileqq.msf.core.a.a.r.contains(paramString))
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.StatReport", 2, paramString + " is not need report.");
      }
      return;
    }
    if ((paramMap == null) || (!paramBoolean1)) {}
    for (;;)
    {
      int i1;
      try
      {
        if ((H != null) && (H.sender != null) && (H.sender.a != null)) {
          paramMap.put("param_isConnected", String.valueOf(H.sender.a.o().b()));
        }
        paramMap.put("param_NetworkOperator", com.tencent.mobileqq.msf.core.n.l());
        i1 = NetConnInfoCenterImpl.getSystemNetworkType();
        paramMap.put("param_NetworkInfo", String.valueOf(i1));
        if (!paramMap.containsKey(BaseConstants.RDM_NoChangeFailCode)) {
          break label356;
        }
        paramMap.remove(BaseConstants.RDM_NoChangeFailCode);
        paramMap.put("param_SsoServerIp", w.C);
        paramMap.put("param_GatewayrIp", w.j());
        if (!paramMap.containsKey("param_reportTime")) {
          paramMap.put("param_reportTime", String.valueOf(SystemClock.elapsedRealtime()));
        }
        RdmReq localRdmReq = new RdmReq();
        eventName = paramString;
        elapse = paramLong1;
        size = paramLong2;
        isSucceed = paramBoolean1;
        isRealTime = paramBoolean2;
        isMerge = paramBoolean3;
        params = paramMap;
        if ((P.offer(localRdmReq)) || (!QLog.isColorLevel())) {
          break;
        }
        QLog.e("MSF.C.StatReport", 2, "wait queue is full!");
        return;
      }
      catch (Exception paramString) {}
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.w("MSF.C.StatReport", 2, "report RQD error " + paramString, paramString);
      return;
      label356:
      if (i1 == 0) {
        paramMap.put("param_FailCode", "900");
      }
    }
  }
  
  public void a(boolean paramBoolean)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("param_FailCode", String.valueOf(4015));
    localHashMap.put("param_Reason", String.valueOf(paramBoolean));
    a("Msf.LoginRespTimeout", false, 0L, 0L, localHashMap, false, false);
  }
  
  public void a(boolean paramBoolean, int paramInt, long paramLong, ArrayList paramArrayList)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("timeConnectTestServerDiff", String.valueOf(paramLong));
    int i1 = 0;
    while (i1 < paramArrayList.size())
    {
      localHashMap.put("SSOIP" + i1, geta);
      localHashMap.put("ConnTestSsoResult" + i1, String.valueOf(getb));
      localHashMap.put("errorDetail" + i1, getc);
      i1 += 1;
    }
    localHashMap.put("respcode", String.valueOf(paramInt));
    a("msf_netStateWhileSSOListCannotConnBDOK5", paramBoolean, 0L, 0L, localHashMap, true, false);
  }
  
  public void a(boolean paramBoolean, long paramLong1, int paramInt, long paramLong2)
  {
    HashMap localHashMap;
    if (NetConnInfoCenterImpl.isWifiOrMobileConn())
    {
      localHashMap = new HashMap();
      localHashMap.put("param_FailCode", String.valueOf(paramInt + 3300));
      if (i()) {
        a("dim.Msf.BG.PushQueryResult", paramBoolean, paramLong1, paramLong2, localHashMap, false, false);
      }
    }
    else
    {
      return;
    }
    a("dim.Msf.PushQueryResult", paramBoolean, paramLong1, paramLong2, localHashMap, false, false);
  }
  
  public void a(boolean paramBoolean1, long paramLong1, int paramInt, long paramLong2, String paramString1, String paramString2, boolean paramBoolean2, long paramLong3)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("param_FailCode", String.valueOf(paramInt + 3000));
    localHashMap.put("param_SsoServerIp", paramString1);
    localHashMap.put("param_sendLocalIp", paramString2);
    localHashMap.put("param_NowLocalIp", w.D);
    localHashMap.put("param_Reason", String.valueOf(paramBoolean2));
    localHashMap.put("param_sendTime", String.valueOf(paramLong3));
    a("Msf.CommonLogin", paramBoolean1, paramLong1, paramLong2, localHashMap, false, false);
  }
  
  public void a(boolean paramBoolean1, long paramLong1, int paramInt, long paramLong2, boolean paramBoolean2, String paramString)
  {
    HashMap localHashMap;
    if (NetConnInfoCenterImpl.isWifiOrMobileConn())
    {
      localHashMap = new HashMap();
      localHashMap.put("param_Reason", paramString);
      if (paramBoolean2) {
        break label85;
      }
      localHashMap.put("param_FailCode", String.valueOf(paramInt + 3100));
      if (i()) {
        a("dim.Msf.BG.RigisterPushResult", paramBoolean1, paramLong1, paramLong2, localHashMap, false, false);
      }
    }
    else
    {
      return;
    }
    a("dim.Msf.RigisterPushResult", paramBoolean1, paramLong1, paramLong2, localHashMap, false, false);
    return;
    label85:
    localHashMap.put("param_FailCode", String.valueOf(paramInt + 3200));
    if (i())
    {
      a("dim.Msf.BG.UnRigisterPushResult", paramBoolean1, paramLong1, paramLong2, localHashMap, false, false);
      return;
    }
    a("dim.Msf.UnRigisterPushResult", paramBoolean1, paramLong1, paramLong2, localHashMap, false, false);
  }
  
  public void a(boolean paramBoolean1, long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean2, ArrayList paramArrayList, int paramInt)
  {
    if (!NetConnInfoCenterImpl.isWifiOrMobileConn()) {}
    while (paramArrayList.size() <= 0) {
      return;
    }
    Object localObject1 = "" + H.getMsfAppid();
    localObject1 = (String)localObject1 + "|1";
    Object localObject2 = c.f(BaseApplication.getContext()) + "." + c.e(BaseApplication.getContext());
    localObject1 = (String)localObject1 + "|" + (String)localObject2;
    localObject2 = (com.tencent.mobileqq.msf.core.net.a)paramArrayList.get(paramArrayList.size() - 1);
    localObject2 = (String)localObject1 + "|" + g;
    localObject1 = com.tencent.mobileqq.msf.core.n.e();
    if ((localObject1 != null) && (((String)localObject1).length() >= 5))
    {
      localObject2 = (String)localObject2 + "|" + ((String)localObject1).substring(0, 3);
      localObject1 = (String)localObject2 + ":" + ((String)localObject1).substring(3, 5);
      localObject2 = com.tencent.mobileqq.msf.core.n.i();
      if (localObject2 == null) {
        break label582;
      }
      localObject1 = (String)localObject1 + ":" + (String)localObject2;
      label301:
      localObject1 = (String)localObject1 + ":" + false;
      localObject1 = (String)localObject1 + "|" + paramLong1;
      localObject1 = (String)localObject1 + "|" + paramLong2;
      localObject1 = (String)localObject1 + "|" + paramLong3;
      localObject1 = (String)localObject1 + "|" + paramBoolean2;
      if (!paramBoolean1) {
        break label608;
      }
    }
    label582:
    label608:
    for (localObject1 = (String)localObject1 + "|1";; localObject1 = (String)localObject1 + "|" + paramInt)
    {
      localObject2 = paramArrayList.iterator();
      for (paramArrayList = (ArrayList)localObject1; ((Iterator)localObject2).hasNext(); paramArrayList = paramArrayList + "|" + ((com.tencent.mobileqq.msf.core.net.a)localObject1).a()) {
        localObject1 = (com.tencent.mobileqq.msf.core.net.a)((Iterator)localObject2).next();
      }
      localObject1 = (String)localObject2 + "|000";
      localObject1 = (String)localObject1 + ":00";
      break;
      localObject1 = (String)localObject1 + ":000";
      break label301;
    }
    localObject1 = new HashMap();
    ((HashMap)localObject1).put("param_LoginConnect", paramArrayList);
    try
    {
      ((HashMap)localObject1).put("param_totalmemory", MsfSdkUtils.getTotalMemory());
    }
    catch (Exception paramArrayList)
    {
      try
      {
        ((HashMap)localObject1).put("param_Resolution", MsfSdkUtils.getResolutionString(BaseApplication.getContext()));
      }
      catch (Exception paramArrayList)
      {
        try
        {
          for (;;)
          {
            ((HashMap)localObject1).put("param_runStatus_new", String.valueOf(h.r));
            if (QLog.isColorLevel())
            {
              QLog.d("MSF.C.StatReport", 2, "get report status " + (String)((HashMap)localObject1).get("param_runStatus"));
              QLog.d("MSF.C.StatReport", 2, "get report new status " + String.valueOf(h.r));
            }
            if (paramLong3 == -1L) {
              break;
            }
            a("msf_connAndRecv", paramBoolean1, paramLong1 + paramLong3, 0L, (Map)localObject1, false, false);
            return;
            paramArrayList = paramArrayList;
            QLog.d("MSF.C.StatReport", 1, "getTotalMemoey error " + paramArrayList);
            continue;
            paramArrayList = paramArrayList;
            QLog.d("MSF.C.StatReport", 1, "getResilution error " + paramArrayList);
          }
        }
        catch (Exception paramArrayList)
        {
          for (;;)
          {
            QLog.d("MSF.C.StatReport", 1, "get new status error " + paramArrayList.toString());
          }
          a("msf_connAndRecv", paramBoolean1, paramLong1, 0L, (Map)localObject1, false, false);
        }
      }
    }
  }
  
  public void a(boolean paramBoolean, long paramLong1, d paramD, com.tencent.qphone.base.a paramA, int paramInt, long paramLong2, long paramLong3, long paramLong4, String paramString1, String paramString2)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("param_connOpenNetType", String.valueOf(paramInt));
    localHashMap.put("param_ssoInfo", a(paramD));
    localHashMap.put("param_liveTime", String.valueOf(paramLong2));
    localHashMap.put("param_sendBytes", String.valueOf(paramLong3));
    localHashMap.put("param_recvBytes", String.valueOf(paramLong4));
    localHashMap.put("param_FailCode", String.valueOf(paramA.ordinal() + 4900));
    localHashMap.put("param_Reason", paramA.toString());
    paramD = "" + paramLong1;
    paramD = paramD + "|";
    paramD = paramD + paramString1;
    paramD = paramD + "|";
    localHashMap.put("param_connectContinuanceTime", paramD + paramString2);
    if (i())
    {
      a("dim.Msf.BG.ConnClose", paramBoolean, paramLong1, 0, localHashMap, false, false);
      return;
    }
    a("dim.Msf.ConnClose", paramBoolean, paramLong1, 0, localHashMap, false, false);
  }
  
  public void a(boolean paramBoolean, long paramLong, String paramString)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("ssolist", paramString);
    localHashMap.put("SSOListToConnectEndTime", "" + paramLong);
    a("msf_justGetSSOListButCannotConn", paramBoolean, paramLong, 0L, localHashMap, true, false);
  }
  
  public void a(boolean paramBoolean, String paramString1, long paramLong1, int paramInt, long paramLong2, String paramString2, String paramString3)
  {
    if (NetConnInfoCenterImpl.isWifiOrMobileConn())
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("param_FailCode", String.valueOf(paramInt));
      localHashMap.put("param_tokenType", String.valueOf(paramString2));
      localHashMap.put("param_uin", paramString1);
      localHashMap.put("param_src", paramString3);
      localHashMap.put("param_imei", com.tencent.mobileqq.msf.core.n.d());
      a("dim.Msf.RenewToken_3", paramBoolean, paramLong1, paramLong2, localHashMap, false, false);
    }
  }
  
  public void a(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, long paramLong, ArrayList paramArrayList)
  {
    HashMap localHashMap = new HashMap();
    int i3 = 0;
    int i4 = 0;
    int i1 = i4;
    int i2 = i3;
    if (!paramBoolean3)
    {
      i1 = i4;
      i2 = i3;
      if (paramArrayList.size() > 0)
      {
        localHashMap.put("param_Reason", String.valueOf(getsize1e));
        if (getsize1e != q.m) {
          break label201;
        }
        i2 = 1;
        i1 = i4;
      }
    }
    for (;;)
    {
      localHashMap.put("param_GatewayIp", w.j());
      localHashMap.put("param_FailCode", String.valueOf(paramArrayList.size()));
      localObject = new StringBuilder();
      paramArrayList = paramArrayList.iterator();
      while (paramArrayList.hasNext())
      {
        com.tencent.mobileqq.msf.core.net.a localA = (com.tencent.mobileqq.msf.core.net.a)paramArrayList.next();
        ((StringBuilder)localObject).append(localA.toString() + "|");
      }
      label201:
      i1 = i4;
      i2 = i3;
      if (getsize1e == q.i)
      {
        i1 = 1;
        i2 = i3;
      }
    }
    Object localObject = ((StringBuilder)localObject).toString();
    paramArrayList = (ArrayList)localObject;
    if (((String)localObject).endsWith("|")) {
      paramArrayList = ((String)localObject).substring(0, ((String)localObject).length() - 1);
    }
    localHashMap.put("param_connResult", paramArrayList);
    if (!paramBoolean3)
    {
      localHashMap.put("param_localIp", com.tencent.mobileqq.msf.core.n.n());
      localHashMap.put("param_NetworkStatus", d());
    }
    if (paramBoolean1)
    {
      if (paramBoolean2)
      {
        a("dim.Msf.MutilConnDefaultElapsedTime", paramBoolean3, paramLong, 0, localHashMap, true, false);
        return;
      }
      a("dim.Msf.MutilConnElapsedTime", paramBoolean3, paramLong, 0, localHashMap, false, false);
      return;
    }
    if (paramBoolean2)
    {
      if (i())
      {
        a("dim.Msf.BG.ConnDefaultElapsedTime", paramBoolean3, paramLong, 0, localHashMap, false, false);
        return;
      }
      a("dim.Msf.ConnDefaultElapsedTime", paramBoolean3, paramLong, 0, localHashMap, false, false);
      return;
    }
    if (i())
    {
      if (i2 != 0)
      {
        a("dim.Msf.BG.ConnFailByUnreachable", paramBoolean3, paramLong, 0, localHashMap, false, false);
        return;
      }
      if (i1 != 0)
      {
        a("dim.Msf.BG.ConnFailByPermission", paramBoolean3, paramLong, 0, localHashMap, false, false);
        return;
      }
      a("dim.Msf.BG.ConnElapsedTime", paramBoolean3, paramLong, 0, localHashMap, false, false);
      return;
    }
    if (i2 != 0)
    {
      a("dim.Msf.ConnFailByUnreachable", paramBoolean3, paramLong, 0, localHashMap, false, false);
      return;
    }
    if (i1 != 0)
    {
      a("dim.Msf.ConnFailByPermission", paramBoolean3, paramLong, 0, localHashMap, false, false);
      return;
    }
    a("dim.Msf.ConnElapsedTime", paramBoolean3, paramLong, 0, localHashMap, false, false);
  }
  
  void b()
  {
    if (!S.a) {
      QLog.d("MSF.C.StatReport", 1, "doCrashControl crash control is off..");
    }
    SharedPreferences localSharedPreferences;
    do
    {
      return;
      localSharedPreferences = BaseApplication.getContext().getSharedPreferences("msf_crashcontrol", 0);
    } while (localSharedPreferences == null);
    long l1 = localSharedPreferences.getLong("starttime", 0L);
    int i1 = localSharedPreferences.getInt("crashcount", 0);
    long l2 = System.currentTimeMillis();
    T.append("doCrashControl startTime=").append(U.format(new Date(l1))).append(",currenttime=").append(U.format(new Date(l2))).append(",crashCount=").append(i1).append("\n");
    if ((l1 <= 0L) || (l2 <= l1) || (i1 < 0) || (l2 - l1 > S.b * 1000))
    {
      i1 = 1;
      l1 = l2;
    }
    for (;;)
    {
      if (i1 > S.c) {
        O = true;
      }
      if (O)
      {
        QLog.d("MSF.C.StatReport", 1, "doCrashControl crashCount=" + i1 + ",shouldStopMsf=" + O);
        BaseApplication localBaseApplication = BaseApplication.getContext();
        localBaseApplication.stopService(new Intent(localBaseApplication, MsfService.class));
      }
      T.append("doCrashControl shouldStopMsf=").append(O).append("\n");
      localSharedPreferences.edit().putLong("starttime", l1).putInt("crashcount", i1).putBoolean("shouldStopMsf", O).commit();
      return;
      i1 += 1;
    }
  }
  
  public void c()
  {
    if (!M.get())
    {
      try
      {
        localObject = BaseApplication.getContext().getSharedPreferences("msf_crashcontrol", 0);
        if ((localObject != null) && (((SharedPreferences)localObject).getBoolean("shouldStopMsf", false)))
        {
          a("actMsfStopMsf", true, 0L, 0L, null, true, false);
          ((SharedPreferences)localObject).edit().putBoolean("shouldStopMsf", false).commit();
        }
      }
      catch (Exception localException)
      {
        for (;;)
        {
          Object localObject;
          CrashStrategyBean localCrashStrategyBean;
          localException.printStackTrace();
        }
      }
      catch (Throwable localThrowable)
      {
        QLog.w("MSF.C.StatReport", 1, "init RQD error " + localThrowable, localThrowable);
        return;
      }
      UserAction.initUserAction(BaseApplication.getContext(), true, 1200L);
      localObject = BaseApplication.getContext().getAppData("channel_id");
      if ((localObject != null) && ((localObject instanceof String))) {
        UserAction.setChannelID((String)localObject);
      }
      localObject = new o(this);
      localCrashStrategyBean = new CrashStrategyBean();
      localCrashStrategyBean.setMaxStackFrame(6);
      localCrashStrategyBean.setMaxStackLine(400);
      CrashReport.initCrashReport(BaseApplication.getContext(), (CrashHandleListener)localObject, new b(), true, localCrashStrategyBean);
      UserAction.closeUseInfoEvent();
      UserAction.setAutoLaunchEventUsable(true);
      localObject = BaseApplication.getContext().getDir("tombs", 0).getAbsolutePath();
      CrashReport.initNativeCrashReport(BaseApplication.getContext(), (String)localObject, true);
      N.start();
      M.set(true);
      if (com.tencent.mobileqq.msf.core.n.g == 0) {}
      for (boolean bool = false;; bool = true)
      {
        a("dim.Msf.IMEIReading", bool, com.tencent.mobileqq.msf.core.n.g, 0L, null, false, false);
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("MSF.C.StatReport", 2, "init RQD finished");
        return;
      }
    }
  }
  
  String d()
  {
    int i3 = 0;
    int i2 = 0;
    NetworkInfo localNetworkInfo = ((ConnectivityManager)BaseApplication.getContext().getSystemService("connectivity")).getActiveNetworkInfo();
    if (localNetworkInfo != null)
    {
      int i4;
      if (localNetworkInfo.isAvailable())
      {
        i1 = 1;
        i4 = (byte)i1;
        if (!localNetworkInfo.isConnected()) {
          break label107;
        }
      }
      label107:
      for (int i1 = 2;; i1 = 0)
      {
        int i5 = (byte)i1;
        i1 = i3;
        if (NetConnInfoCenterImpl.isMobileNetworkInfo(localNetworkInfo))
        {
          i1 = i2;
          if (((TelephonyManager)BaseApplication.getContext().getSystemService("phone")).getDataState() == 2) {
            i1 = 4;
          }
          i1 = (byte)i1;
        }
        return String.valueOf((byte)(i5 | i4 | i1));
        i1 = 0;
        break;
      }
    }
    return "-1";
  }
  
  public void e()
  {
    a("dim.Msf.AUTOBOTTING", true, 0L, 0L, new HashMap(), false, false);
  }
  
  static class a
  {
    boolean a = true;
    int b = 86400;
    int c = 20;
    
    a() {}
    
    void a()
    {
      a = true;
      b = 86400;
      c = 20;
    }
  }
  
  class b
    implements UploadHandleListener
  {
    b() {}
    
    public void onUploadEnd(int paramInt1, int paramInt2, long paramLong1, long paramLong2, boolean paramBoolean, String paramString)
    {
      if (NetConnInfoCenterImpl.isMobileConn()) {
        i.a(H.sender.e(), new String[] { "param_XGRdmFlow", "param_XGFlow", "param_Flow" }, paramLong1 + paramLong2);
      }
      while (!NetConnInfoCenterImpl.isWifiConn()) {
        return;
      }
      i.a(H.sender.e(), new String[] { "param_WIFIRdmFlow", "param_WIFIFlow", "param_Flow" }, paramLong1 + paramLong2);
    }
    
    public void onUploadStart(int paramInt) {}
  }
}
