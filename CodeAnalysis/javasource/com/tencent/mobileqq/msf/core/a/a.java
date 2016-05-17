package com.tencent.mobileqq.msf.core.a;

import android.text.TextUtils;
import com.qq.jce.wup.UniPacket;
import com.qq.taf.jce.HexUtil;
import com.qq.taf.jce.JceInputStream;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.MsfStore;
import com.tencent.mobileqq.msf.core.NetConnInfoCenterImpl;
import com.tencent.mobileqq.msf.core.auth.h;
import com.tencent.mobileqq.msf.core.b.i;
import com.tencent.mobileqq.msf.core.n;
import com.tencent.mobileqq.msf.core.w;
import com.tencent.mobileqq.msf.sdk.MsfCommand;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.msf.boot.config.NativeConfigStore;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.SimpleAccount;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.report.StrupBuff;
import com.tencent.qphone.base.util.CodecWarpper;
import com.tencent.qphone.base.util.QLog;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;

public class a
{
  static long A = 0L;
  static long B = 0L;
  static long C = 0L;
  static long D = 0L;
  public static final int E = 100;
  public static long F = 0L;
  public static long G = 0L;
  public static final int H = 1;
  public static final int I = 16;
  private static final byte[] K = { -16, 68, 31, 95, -12, 45, -91, -113, -36, -9, -108, -102, -70, 98, -44, 17 };
  public static final String a = "ConfigService.ClientReq";
  static final String b = "MSF.C.ConfigManager";
  public static final String c = "__loginSdk_iconf_UserConf";
  public static final String d = "__loginSdk_iconf_AppConf";
  public static final String e = "__loginSdk_iconf_UserCommCon";
  public static final String f = "__loginSdk_mobilessotime";
  public static final String g = "__loginSdk_wifissotime";
  public static final String h = "__loginSdk_checkmobilessotime";
  public static final String i = "__loginSdk_checkwifissotime";
  public static final String j = "_msf_isBootingKey";
  public static final int k = 32;
  public static final String l = "__loginSdk_iConfAppidTimeKey";
  public static final String m = "__loginSdk_iConfSdkLastTimeKey";
  public static final String n = "__loginSdk_iConfGetEspLastTimeKe";
  public static final String o = "__msf_isAutoBootKey";
  public static final boolean p = true;
  static ConcurrentHashMap q = new ConcurrentHashMap();
  public static HashSet r = new HashSet();
  public static HashSet s = new HashSet();
  public static boolean t = true;
  public static int u = 0;
  public static int v = 0;
  public static boolean w = true;
  static AtomicBoolean y = new AtomicBoolean();
  public static final String z = "__loginSdk_iconf_Msf";
  public ArrayList J = new ArrayList();
  MsfCore x;
  
  public a(MsfCore paramMsfCore)
  {
    x = paramMsfCore;
  }
  
  public static long A()
  {
    try
    {
      if (q.containsKey("msf_checkChangeTokenInterval"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_checkChangeTokenInterval"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getCheckChangeTokenInterval error" + localException);
      }
    }
    return 1800000L;
  }
  
  public static long B()
  {
    try
    {
      if (q.containsKey("msf_ChangeTokenRequestInterval"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_ChangeTokenRequestInterval"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getChangeTokenRequestInterval error" + localException);
      }
    }
    return 1000L;
  }
  
  public static long C()
  {
    try
    {
      if (q.containsKey("msf_quickHeartBeatTimeout"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_quickHeartBeatTimeout"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getHeartBeatTimeout error" + localException);
      }
    }
    return 10000L;
  }
  
  public static long D()
  {
    try
    {
      if (q.containsKey("msf_getQuickHeartBeatReConnInterval"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_getQuickHeartBeatReConnInterval"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getQuickHeartBeatReConnInterval error" + localException);
      }
    }
    return 120000L;
  }
  
  public static int E()
  {
    try
    {
      if (q.containsKey("msf_heartBeatRetrycount"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_heartBeatRetrycount"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getHeartBeatRetryCount error" + localException);
      }
    }
    return 1;
  }
  
  public static int F()
  {
    try
    {
      if (q.containsKey("msf_busPacketTimeoutMaxNum"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_busPacketTimeoutMaxNum"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getBusPacketTimeoutMaxNum error" + localException);
      }
    }
    return 10;
  }
  
  public static long G()
  {
    try
    {
      if (q.containsKey("msf_busCheckServerTimeInterval"))
      {
        long l1 = Long.parseLong((String)q.get("msf_busCheckServerTimeInterval"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getBusPacketTimeoutMaxNum error" + localException);
      }
    }
    return 5000L;
  }
  
  public static long H()
  {
    try
    {
      if (q.containsKey("msf_checkUpdateServerTimeInterval"))
      {
        long l1 = Long.parseLong((String)q.get("msf_checkUpdateServerTimeInterval"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getUpdateServerTimePacketTimeoutMaxNum error" + localException);
      }
    }
    return 72000000L;
  }
  
  public static long I()
  {
    try
    {
      if (q.containsKey("msf_checkUpdateServerTimeExtraInterval"))
      {
        long l1 = Long.parseLong((String)q.get("msf_checkUpdateServerTimeExtraInterval"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getUpdateServerTimePacketTimeoutExtraInterval error" + localException);
      }
    }
    return 7200000L;
  }
  
  public static long J()
  {
    try
    {
      if (q.containsKey("msf_checkServerTimeCompareInterval"))
      {
        long l1 = Long.parseLong((String)q.get("msf_checkServerTimeCompareInterval"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getCheckServerTimeCompareInterval error" + localException);
      }
    }
    return 7200000L;
  }
  
  public static int K()
  {
    try
    {
      if (q.containsKey("msf_heartBeatTimeInterval"))
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "msf_heartBeatTimeInterval = " + (String)q.get("msf_heartBeatTimeInterval"));
        }
        int i1 = Integer.parseInt((String)q.get("msf_heartBeatTimeInterval"));
        return i1 * 60 * 1000;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.ConfigManager", 4, "getHeartBeatTimeInterval error" + localException);
      }
    }
    return 60000;
  }
  
  public static int L()
  {
    try
    {
      if (q.containsKey("msf_netIdleTimeInterval"))
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "msf_netIdleTimeInterval = " + (String)q.get("msf_netIdleTimeInterval"));
        }
        int i1 = Integer.parseInt((String)q.get("msf_netIdleTimeInterval"));
        return i1 * 60 * 1000;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.ConfigManager", 4, "getNetIdleTimeInterval error" + localException);
      }
    }
    return 1680000;
  }
  
  public static String M()
  {
    try
    {
      if (q.containsKey("TcpdumpSSOVip_new"))
      {
        String str = (String)q.get("TcpdumpSSOVip_new");
        return str;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getTcpdumpSSOVip error" + localException);
      }
    }
    return null;
  }
  
  public static int N()
  {
    try
    {
      if (q.containsKey("TcpdumpSSOTime"))
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "TcpdumpSSOTime = " + (String)q.get("TcpdumpSSOTime"));
        }
        int i1 = Integer.parseInt((String)q.get("TcpdumpSSOTime"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.ConfigManager", 4, "getTcpdumpSSOTime error" + localException);
      }
    }
    return 0;
  }
  
  public static int O()
  {
    try
    {
      if (q.containsKey("msf_netWeakTimeInterval"))
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "msf_netWeakTimeInterval = " + (String)q.get("msf_netWeakTimeInterval"));
        }
        int i1 = Integer.parseInt((String)q.get("msf_netWeakTimeInterval"));
        return i1 * 60 * 1000;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.ConfigManager", 4, "getNetWeakTimeInterval error" + localException);
      }
    }
    return 180000;
  }
  
  public static int P()
  {
    try
    {
      if (q.containsKey("msf_pcactiveretrytimes"))
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "msf_pcactiveretrytimes = " + (String)q.get("msf_pcactiveretrytimes"));
        }
        int i1 = Integer.parseInt((String)q.get("msf_pcactiveretrytimes"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.ConfigManager", 4, "msf_pcactiveretrytimes error" + localException);
      }
    }
    return 10;
  }
  
  public static int Q()
  {
    try
    {
      if (q.containsKey("msf_netWeakExceptionCount"))
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "msf_netWeakExceptionCount = " + (String)q.get("msf_netWeakExceptionCount"));
        }
        int i1 = Integer.parseInt((String)q.get("msf_netWeakExceptionCount"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.ConfigManager", 4, "getNetWeakExceptionCount error" + localException);
      }
    }
    return 3;
  }
  
  public static long R()
  {
    if (q.containsKey("msf_CallQQIntervTimeOnBoot")) {
      try
      {
        long l1 = Long.parseLong(((String)q.get("msf_CallQQIntervTimeOnBoot")).trim());
        return l1;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, " get CallQQIntervTimeOnBoot error " + localNumberFormatException);
        }
      }
    }
    return 0L;
  }
  
  public static String S()
  {
    if (q.containsKey("bigflow2g3g_ver2")) {
      return (String)q.get("bigflow2g3g_ver2");
    }
    return "40";
  }
  
  public static boolean T()
  {
    if (q.containsKey("msf_StartNoStickyForMSFService")) {
      try
      {
        boolean bool = Boolean.parseBoolean(((String)q.get("msf_StartNoStickyForMSFService")).trim());
        return bool;
      }
      catch (Exception localException)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, " set msf_StartNoStickyForMSFService error " + localException);
        }
        return false;
      }
    }
    return false;
  }
  
  public static boolean U()
  {
    if (q.containsKey("msf_quickSendAvailable")) {
      try
      {
        boolean bool = Boolean.parseBoolean(((String)q.get("msf_quickSendAvailable")).trim());
        return bool;
      }
      catch (Exception localException)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, " set isPermitQuickTimeoutCheck error " + localException);
        }
        return false;
      }
    }
    return true;
  }
  
  public static int V()
  {
    try
    {
      if (q.containsKey("msf_getHttpRecvTimeout"))
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "msf_getHttpRecvTimeout = " + (String)q.get("msf_getHttpRecvTimeout"));
        }
        int i1 = Integer.parseInt((String)q.get("msf_getHttpRecvTimeout"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.ConfigManager", 4, "getHttpRecvTimeout error" + localException);
      }
    }
    return 30000;
  }
  
  public static int W()
  {
    try
    {
      if (q.containsKey("msf_getHttpReSendMessageConcurrentLimit"))
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "msf_getHttpReSendMessageConcurrentLimit = " + (String)q.get("msf_getHttpReSendMessageConcurrentLimit"));
        }
        int i1 = Integer.parseInt((String)q.get("msf_getHttpReSendMessageConcurrentLimit"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.ConfigManager", 4, "getHttpReSendMessageConcurrentLimit error" + localException);
      }
    }
    return 5;
  }
  
  public static int X()
  {
    try
    {
      if (q.containsKey("msf_getHttpReSendMessageTimeout"))
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "msf_getHttpReSendMessageTimeout = " + (String)q.get("msf_getHttpReSendMessageTimeout"));
        }
        int i1 = Integer.parseInt((String)q.get("msf_getHttpReSendMessageTimeout"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.ConfigManager", 4, "getHttpReSendMessageTimeout error" + localException);
      }
    }
    return 30000;
  }
  
  public static String[] Y()
  {
    if (q.containsKey("getQuickSendBlackList")) {
      return ((String)q.get("getQuickSendBlackList")).replaceAll("\\|", "#").split("#");
    }
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.ConfigManager", 2, "getQuickSendBlackList not be found.");
    }
    return null;
  }
  
  public static String Z()
  {
    if (q.containsKey("MsfCrashControlInfo")) {
      return (String)q.get("MsfCrashControlInfo");
    }
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.ConfigManager", 2, "getMsfCrashControlInfo not found");
    }
    return null;
  }
  
  public static void a(boolean paramBoolean)
  {
    try
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "msfCore setAutoStaring " + paramBoolean);
      }
      y.set(paramBoolean);
      if (MsfStore.getNativeConfigStore() != null) {
        MsfStore.getNativeConfigStore().setConfig("_msf_isBootingKey", String.valueOf(paramBoolean));
      }
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "storeAutoStaring " + paramBoolean);
      }
      return;
    }
    finally {}
  }
  
  public static boolean a(String paramString)
  {
    if (q.containsKey(paramString + "_isAutoBoot")) {
      try
      {
        boolean bool = Boolean.parseBoolean(((String)q.get(paramString + "_isAutoBoot")).trim());
        return bool;
      }
      catch (Exception localException)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, paramString + " set isAutoBoot error " + localException);
        }
        return false;
      }
    }
    return true;
  }
  
  private boolean a(String paramString1, String paramString2, String paramString3)
  {
    try
    {
      c.a(new ByteArrayInputStream(("<" + paramString1 + ">" + paramString2 + "</" + paramString1 + ">").getBytes("UTF-8")), q, paramString3);
      return true;
    }
    catch (Exception paramString2)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "parse " + paramString1 + "Config error " + paramString2, paramString2);
      }
    }
    return false;
  }
  
  public static boolean aA()
  {
    try
    {
      if (q.containsKey("msf_applySocketAdaptorFeature"))
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_applySocketAdaptorFeature"));
        return bool;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "applySocketAdaptorFeature error" + localException);
      }
    }
    return false;
  }
  
  public static boolean aB()
  {
    try
    {
      if (q.containsKey("msf_innerSwitchForAdaptor"))
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_innerSwitchForAdaptor"));
        return bool;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "innerSwitchForAdaptor error" + localException);
      }
    }
    return false;
  }
  
  public static int aC()
  {
    try
    {
      if (q.containsKey("msf_timeoutPkgToResetMode"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_timeoutPkgToResetMode"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "timeoutPkgToResetMode error" + localException);
      }
    }
    return 100;
  }
  
  public static int aD()
  {
    try
    {
      if (q.containsKey("msf_ExptionCountToResetMode"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_ExptionCountToResetMode"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "ExptionCountToResetMode error" + localException);
      }
    }
    return 15;
  }
  
  public static long aE()
  {
    try
    {
      if (q.containsKey("msf_startHeartBeatProxyInterval"))
      {
        long l1 = Long.parseLong((String)q.get("msf_startHeartBeatProxyInterval"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "startHeartBeatProxyInterval error" + localException);
      }
    }
    return 60000L;
  }
  
  public static int aF()
  {
    try
    {
      if (q.containsKey("msf_ExptionCountToCloseHeartbeat"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_ExptionCountToCloseHeartbeat"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "ExptionCountToCloseHeartbeat error" + localException);
      }
    }
    return 50;
  }
  
  public static int aG()
  {
    try
    {
      if (q.containsKey("msf_ResumeCountLimit"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_ResumeCountLimit"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "ResumeCountLimit error" + localException);
      }
    }
    return 3;
  }
  
  public static long aH()
  {
    try
    {
      if (q.containsKey("msf_hwExceptionCheckInterval"))
      {
        long l1 = Long.parseLong((String)q.get("msf_hwExceptionCheckInterval"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "hwExceptionCheckInterval error" + localException);
      }
    }
    return 7200000L;
  }
  
  public static boolean aI()
  {
    try
    {
      if (q.containsKey("msf_applyHeartbeatProxyFeature"))
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_applyHeartbeatProxyFeature"));
        return bool;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "applyHeartbeatProxyFeature error" + localException);
      }
    }
    return false;
  }
  
  public static int aJ()
  {
    try
    {
      if (q.containsKey("msf_retryHeartbeatTestCount"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_retryHeartbeatTestCount"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "retryHeartbeatTestCount error" + localException);
      }
    }
    return 5;
  }
  
  public static int aK()
  {
    try
    {
      if (q.containsKey("msf_SortIpSocketErrorWeight"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_SortIpSocketErrorWeight"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getSortIpSocketErrorWeight error" + localException);
      }
    }
    return 10;
  }
  
  public static int aL()
  {
    try
    {
      if (q.containsKey("msf_SortIpContinueRspTimeoutWeight"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_SortIpContinueRspTimeoutWeight"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getSortIpContinueRspTimeoutWeight error" + localException);
      }
    }
    return 10;
  }
  
  public static int aM()
  {
    try
    {
      if (q.containsKey("msf_SortIpPingTimeoutWeight"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_SortIpPingTimeoutWeight"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getSortIpPingTimeoutWeight error" + localException);
      }
    }
    return 10;
  }
  
  public static int aN()
  {
    try
    {
      if (q.containsKey("msf_SortIpNetDetectFailedWeight"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_SortIpNetDetectFailedWeight"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getSortIpNetDetectFailedWeight error" + localException);
      }
    }
    return 20;
  }
  
  public static int aO()
  {
    try
    {
      if (q.containsKey("msf_SortIpInvalidDataWeight"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_SortIpInvalidDataWeight"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getSortIpInvalidDataWeight error" + localException);
      }
    }
    return 20;
  }
  
  public static int aP()
  {
    try
    {
      if (q.containsKey("msf_SortIpConnFullWeight"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_SortIpConnFullWeight"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getSortIpConnFullWeight error" + localException);
      }
    }
    return 20;
  }
  
  public static boolean aQ()
  {
    try
    {
      if (q.containsKey("msf_loginWithPicSt"))
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_loginWithPicSt"));
        return bool;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "loginWithPicSt error" + localException);
      }
    }
    return true;
  }
  
  public static int aR()
  {
    try
    {
      if (q.containsKey("msf_SingleWiFiSSIDStoreTimes"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_SingleWiFiSSIDStoreTimes"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getSingleWiFiSSIDStoreTimes error" + localException);
      }
    }
    return 3;
  }
  
  public static long aS()
  {
    try
    {
      if (q.containsKey("msf_ReportWiFiSSIDInterval"))
      {
        long l1 = Long.parseLong((String)q.get("msf_ReportWiFiSSIDInterval"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getReportWiFiSSIDInterval error" + localException);
      }
    }
    return 72000000L;
  }
  
  public static int aT()
  {
    try
    {
      if (q.containsKey("msf_aliveSplitLen"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_aliveSplitLen"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getMsfAliveSplitLen error" + localException);
      }
    }
    return 1024;
  }
  
  public static int aU()
  {
    try
    {
      if (q.containsKey("msf_aliveReportMax"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_aliveReportMax"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getMsfAliveReportMax error" + localException);
      }
    }
    return 15360;
  }
  
  public static int aV()
  {
    try
    {
      if (q.containsKey("msf_aliveAutoInterval"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_aliveAutoInterval"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getMsfAliveAutoInterval error" + localException);
      }
    }
    return 7200;
  }
  
  public static boolean aW()
  {
    try
    {
      if (q.containsKey("msf_reportMsfAliveFull"))
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_reportMsfAliveFull"));
        return bool;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "reportMsfAliveFull error" + localException);
      }
    }
    return true;
  }
  
  public static int aX()
  {
    try
    {
      if (q.containsKey("msf_RandomPushReportBase"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_RandomPushReportBase"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getRandomPushReportBase error" + localException);
      }
    }
    return 1;
  }
  
  public static HashSet aY()
  {
    try
    {
      if (q.containsKey("msf_getPskeyDomains"))
      {
        Object localObject = (String)q.get("msf_getPskeyDomains");
        if (!TextUtils.isEmpty((CharSequence)localObject))
        {
          localObject = ((String)localObject).split("#");
          if ((localObject != null) && (localObject.length > 0))
          {
            int i1 = 0;
            while (i1 < localObject.length)
            {
              if (!TextUtils.isEmpty(localObject[i1])) {
                h.c.add(localObject[i1]);
              }
              i1 += 1;
            }
          }
        }
      }
      return h.c;
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getPskeyDomains error" + localException);
      }
    }
  }
  
  public static long aZ()
  {
    try
    {
      if (q.containsKey("msf_StoreLogcatTriggerInterval"))
      {
        long l1 = Long.parseLong((String)q.get("msf_StoreLogcatTriggerInterval"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getStoreLogcatTriggerInterval error" + localException);
      }
    }
    return 10000L;
  }
  
  public static String aa()
  {
    if (q.containsKey("bigflowwifi_ver2")) {
      return (String)q.get("bigflowwifi_ver2");
    }
    return "20";
  }
  
  public static long ab()
  {
    try
    {
      if (q.containsKey("msf_basicTicketChangeInterval"))
      {
        long l1 = Long.parseLong((String)q.get("msf_basicTicketChangeInterval"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getBasicTicketChangeInterval error" + localException);
      }
    }
    return 0L;
  }
  
  public static long ac()
  {
    try
    {
      if (q.containsKey("msf_webTicketChangeInterval"))
      {
        long l1 = Long.parseLong((String)q.get("msf_webTicketChangeInterval"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getWebTicketChangeInterval error" + localException);
      }
    }
    return 0L;
  }
  
  public static boolean ad()
  {
    return y.get();
  }
  
  public static String[] am()
  {
    if (q.containsKey("StandbyMode")) {
      return ((String)q.get("StandbyMode")).replaceAll("\\|", ",").split(",");
    }
    QLog.d("MSF.C.ConfigManager", 1, "StandbyMode whitelist not be found.");
    return null;
  }
  
  public static boolean an()
  {
    if (q.containsKey("msf_StandbyModeAvailable")) {
      try
      {
        boolean bool = Boolean.parseBoolean(((String)q.get("msf_StandbyModeAvailable")).trim());
        return bool;
      }
      catch (Exception localException)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, " set isStandbyModeAvailable error " + localException);
        }
      }
    }
    return true;
  }
  
  public static boolean ao()
  {
    if (q.containsKey("msf_isReqAllFailTest")) {
      try
      {
        boolean bool = Boolean.parseBoolean(((String)q.get("msf_isReqAllFailTest")).trim());
        return bool;
      }
      catch (Exception localException)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, " set isReqAllFailTest error " + localException);
        }
      }
    }
    return false;
  }
  
  public static CopyOnWriteArrayList ap()
  {
    localCopyOnWriteArrayList = new CopyOnWriteArrayList();
    int i1;
    String[] arrayOfString4;
    com.tencent.mobileqq.msf.core.d localD;
    if (q.containsKey("ydconn")) {
      try
      {
        String[] arrayOfString1 = ((String)q.get("ydconn")).replaceAll("\\|", ",").split(",");
        i1 = 0;
        while (i1 < arrayOfString1.length)
        {
          arrayOfString4 = arrayOfString1[i1].split(":");
          localD = new com.tencent.mobileqq.msf.core.d();
          localD.c(arrayOfString4[0]);
          localD.a(Integer.parseInt(arrayOfString4[1]));
          localCopyOnWriteArrayList.add(localD);
          i1 += 1;
        }
        if (!q.containsKey("ltconn")) {
          break label218;
        }
      }
      catch (Exception localException1)
      {
        localException1.printStackTrace();
      }
    }
    try
    {
      String[] arrayOfString2 = ((String)q.get("ltconn")).replaceAll("\\|", ",").split(",");
      i1 = 0;
      while (i1 < arrayOfString2.length)
      {
        arrayOfString4 = arrayOfString2[i1].split(":");
        localD = new com.tencent.mobileqq.msf.core.d();
        localD.c(arrayOfString4[0]);
        localD.a(Integer.parseInt(arrayOfString4[1]));
        localCopyOnWriteArrayList.add(localD);
        i1 += 1;
      }
      if (!q.containsKey("dxconn")) {
        return localCopyOnWriteArrayList;
      }
    }
    catch (Exception localException2)
    {
      localException2.printStackTrace();
    }
    try
    {
      label218:
      String[] arrayOfString3 = ((String)q.get("dxconn")).replaceAll("\\|", ",").split(",");
      i1 = 0;
      while (i1 < arrayOfString3.length)
      {
        arrayOfString4 = arrayOfString3[i1].split(":");
        localD = new com.tencent.mobileqq.msf.core.d();
        localD.c(arrayOfString4[0]);
        localD.a(Integer.parseInt(arrayOfString4[1]));
        localCopyOnWriteArrayList.add(localD);
        i1 += 1;
      }
      return localCopyOnWriteArrayList;
    }
    catch (Exception localException3)
    {
      localException3.printStackTrace();
    }
  }
  
  public static CopyOnWriteArrayList aq()
  {
    Object localObject = n.e();
    CopyOnWriteArrayList localCopyOnWriteArrayList = new CopyOnWriteArrayList();
    if (localObject == null) {
      return null;
    }
    if ((((String)localObject).startsWith("460")) || (((String)localObject).startsWith("461"))) {
      if ((((String)localObject).startsWith("46000")) || (((String)localObject).startsWith("46002"))) {
        localObject = "ydconn";
      }
    }
    for (;;)
    {
      if (q.containsKey(localObject)) {
        try
        {
          localObject = ((String)q.get(localObject)).replaceAll("\\|", ",").split(",");
          int i1 = 0;
          for (;;)
          {
            if (i1 < localObject.length)
            {
              String[] arrayOfString = localObject[i1].split(":");
              com.tencent.mobileqq.msf.core.d localD = new com.tencent.mobileqq.msf.core.d();
              localD.c(arrayOfString[0]);
              localD.a(Integer.parseInt(arrayOfString[1]));
              localCopyOnWriteArrayList.add(localD);
              i1 += 1;
              continue;
              if (((String)localObject).startsWith("46001"))
              {
                localObject = "ltconn";
                break;
              }
              if (((String)localObject).startsWith("46003"))
              {
                localObject = "dxconn";
                break;
              }
              return null;
              return null;
            }
          }
          return localCopyOnWriteArrayList;
        }
        catch (Exception localException)
        {
          localException.printStackTrace();
        }
      }
    }
    for (;;)
    {
      return null;
      QLog.d("MSF.C.ConfigManager", 1, "getReqAllFailDetectXGSSOList not be found.");
    }
  }
  
  public static boolean ar()
  {
    if (q.containsKey("msf_StandbyTestAvailable")) {
      try
      {
        boolean bool = Boolean.parseBoolean(((String)q.get("msf_StandbyTestAvailable")).trim());
        return bool;
      }
      catch (Exception localException)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, " set isStandbyTestAvailable error " + localException);
        }
      }
    }
    return true;
  }
  
  public static int as()
  {
    if (q.containsKey("msf_StandbyTestSeq")) {
      try
      {
        int i1 = Integer.parseInt(((String)q.get("msf_StandbyTestSeq")).trim());
        return i1;
      }
      catch (Exception localException)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, " set getStandbyTestSeq error " + localException);
        }
      }
    }
    return 0;
  }
  
  public static long at()
  {
    try
    {
      if (q.containsKey("msf_tcpDumpTime"))
      {
        long l1 = Long.parseLong((String)q.get("msf_tcpDumpTime"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getTcpDumpTime error" + localException);
      }
    }
    return 600000L;
  }
  
  public static int au()
  {
    if (q.containsKey("msf_RetryStartProcTimes")) {
      try
      {
        int i1 = Integer.parseInt(((String)q.get("msf_RetryStartProcTimes")).trim());
        return i1;
      }
      catch (Exception localException)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, " set getRetryStartProcessTimes error " + localException);
        }
      }
    }
    return 100;
  }
  
  public static int av()
  {
    try
    {
      if (q.containsKey("msf_continueConnInterval"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_continueConnInterval"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getContinueConnInterval error" + localException);
      }
    }
    return 1000;
  }
  
  public static int aw()
  {
    try
    {
      if (q.containsKey("msf_quickSendFastInterval"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_quickSendFastInterval"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getQuickSendFastInterval error" + localException);
      }
    }
    return 15000;
  }
  
  public static int ax()
  {
    try
    {
      if (q.containsKey("msf_quickSendFastTimes"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_quickSendFastTimes"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getQuickSendFastTimes error" + localException);
      }
    }
    return 4;
  }
  
  public static boolean ay()
  {
    try
    {
      if (q.containsKey("msf_newQuickSendCtrl"))
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_newQuickSendCtrl"));
        return bool;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "useNewQuickSendCtrl error" + localException);
      }
    }
    return true;
  }
  
  public static boolean az()
  {
    try
    {
      if (q.containsKey("msf_notifyAfter2901"))
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_notifyAfter2901"));
        return bool;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "notifyAfter2901 error" + localException);
      }
    }
    return true;
  }
  
  public static long ba()
  {
    try
    {
      if (q.containsKey("msf_LogcatStoreInterval"))
      {
        long l1 = Long.parseLong((String)q.get("msf_LogcatStoreInterval"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getLogcatStoreInterval error" + localException);
      }
    }
    return 1800000L;
  }
  
  public static int bb()
  {
    try
    {
      if (q.containsKey("msf_logCompressLevel"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_logCompressLevel"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getLogCompressLevel error" + localException);
      }
    }
    return 9;
  }
  
  public static int bc()
  {
    try
    {
      if (q.containsKey("msf_MSFPullReportBase"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_MSFPullReportBase"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getMSFPullReportBase error" + localException);
      }
    }
    return 1;
  }
  
  public static boolean bd()
  {
    try
    {
      if (q.containsKey("msf_reportPushDetail"))
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_reportPushDetail"));
        return bool;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "reportPushDetail error" + localException);
      }
    }
    return true;
  }
  
  private void bf()
  {
    boolean bool = false;
    int i2;
    int i1;
    String str2;
    if (q.containsKey("msf_noReportRdmEvent")) {
      try
      {
        String[] arrayOfString1 = ((String)q.get("msf_noReportRdmEvent")).split(";");
        i2 = arrayOfString1.length;
        i1 = 0;
        while (i1 < i2)
        {
          str2 = arrayOfString1[i1];
          if (!str2.trim().equals(""))
          {
            r.add(str2);
            if (QLog.isColorLevel()) {
              QLog.d("MSF.C.ConfigManager", 2, "rdm event " + str2 + " set no report.");
            }
          }
          i1 += 1;
        }
        if (!q.containsKey("msf_needPrintLogCmd")) {
          break label308;
        }
      }
      catch (Exception localException1)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "set msf_noReportRdmEvent error " + localException1);
        }
      }
    }
    try
    {
      String[] arrayOfString2 = ((String)q.get("msf_needPrintLogCmd")).split(";");
      i2 = arrayOfString2.length;
      i1 = 0;
      while (i1 < i2)
      {
        str2 = arrayOfString2[i1];
        if (!str2.trim().equals(""))
        {
          s.add(str2);
          if (QLog.isColorLevel()) {
            QLog.d("MSF.C.ConfigManager", 2, "msg " + str2 + " need print log.");
          }
        }
        i1 += 1;
      }
      if (!q.containsKey("msf_AnyPacketAsPushHB")) {}
    }
    catch (Exception localException2)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "set msf_noReportRdmEvent error " + localException2);
      }
    }
    try
    {
      label308:
      String str1 = (String)q.get("msf_AnyPacketAsPushHB");
      if (str1.equals("0"))
      {
        t = bool;
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "config useAnyPacketAsPushHB " + str1);
        }
      }
    }
    catch (Exception localException4)
    {
      try
      {
        i.b(Long.parseLong(aa()));
      }
      catch (Exception localException4)
      {
        try
        {
          for (;;)
          {
            i.a(Long.parseLong(S()));
            return;
            bool = true;
            continue;
            localException3 = localException3;
            if (QLog.isColorLevel())
            {
              QLog.d("MSF.C.ConfigManager", 2, "set msf_noReportRdmEvent error " + localException3);
              continue;
              localException4 = localException4;
              if (QLog.isColorLevel()) {
                QLog.d("MSF.C.ConfigManager", 2, "set3GBigLow error " + localException4);
              }
            }
          }
        }
        catch (Exception localException5)
        {
          while (!QLog.isColorLevel()) {}
          QLog.d("MSF.C.ConfigManager", 2, "setWifiBigLow error " + localException5);
        }
      }
    }
  }
  
  private void bg()
  {
    try
    {
      String[] arrayOfString = am();
      if ((arrayOfString != null) && (x.getStandyModeManager() != null)) {
        x.getStandyModeManager().a(arrayOfString);
      }
      return;
    }
    catch (Exception localException)
    {
      QLog.d("MSF.C.ConfigManager", 1, " " + localException, localException);
    }
  }
  
  private void bh()
  {
    try
    {
      String[] arrayOfString = c();
      if (arrayOfString != null)
      {
        x.sender.f = Integer.parseInt(arrayOfString[0]);
        x.sender.g = Integer.parseInt(arrayOfString[1]);
        x.sender.k = Integer.parseInt(arrayOfString[2]);
        x.sender.i = Integer.parseInt(arrayOfString[3]);
      }
      return;
    }
    catch (Exception localException1)
    {
      try
      {
        for (;;)
        {
          arrayOfString = d();
          x.sender.a(arrayOfString);
          try
          {
            x.sender.j = Integer.parseInt(e());
            return;
          }
          catch (Exception localException3)
          {
            QLog.d("MSF.C.ConfigManager", 1, " " + localException3, localException3);
          }
          localException1 = localException1;
          QLog.d("MSF.C.ConfigManager", 1, " " + localException1, localException1);
        }
      }
      catch (Exception localException2)
      {
        for (;;)
        {
          QLog.d("MSF.C.ConfigManager", 1, " " + localException2, localException2);
        }
      }
    }
  }
  
  static String c(String paramString)
  {
    try
    {
      paramString = HexUtil.bytes2HexStr(paramString.getBytes("UTF-8"));
      return paramString;
    }
    catch (Exception paramString)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.ConfigManager", 4, "Str2HexStr error " + paramString, paramString);
      }
    }
    return null;
  }
  
  public static String[] c()
  {
    if (q.containsKey("MultiPkgPara"))
    {
      String[] arrayOfString = ((String)q.get("MultiPkgPara")).replaceAll("\\|", ",").split(",");
      if (arrayOfString.length == 4) {
        return arrayOfString;
      }
    }
    else
    {
      QLog.d("MSF.C.ConfigManager", 1, "login merge configuration not be found.");
    }
    return null;
  }
  
  static String d(String paramString)
  {
    try
    {
      paramString = new String(HexUtil.hexStr2Bytes(paramString), "UTF-8");
      return paramString;
    }
    catch (Exception paramString)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "HexStr2Str error " + paramString, paramString);
      }
    }
    return null;
  }
  
  public static String[] d()
  {
    if (q.containsKey("MultiPkgWL")) {
      return ((String)q.get("MultiPkgWL")).replaceAll("\\|", ",").split(",");
    }
    QLog.d("MSF.C.ConfigManager", 1, "login merge whitelist not be found.");
    return null;
  }
  
  public static String e()
  {
    if (q.containsKey("AndroidMergeDuration")) {
      return (String)q.get("AndroidMergeDuration");
    }
    QLog.d("MSF.C.ConfigManager", 1, "login merge duration not be found.");
    return "0";
  }
  
  public static String f()
  {
    if (q.contains("NetFlowMax")) {
      return (String)q.get("NetFlowMax");
    }
    return "10485760";
  }
  
  public static String g()
  {
    if (q.containsKey("msf_locallogtime")) {
      return (String)q.get("msf_locallogtime");
    }
    return "3";
  }
  
  public static String h()
  {
    if (q.containsKey("msf_checkSsoIntervtime")) {
      return (String)q.get("msf_checkSsoIntervtime");
    }
    return "300000";
  }
  
  public static boolean i()
  {
    if (q.containsKey("msf_useLastOpenAddress")) {
      try
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_useLastOpenAddress"));
        return bool;
      }
      catch (Exception localException)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "get useLastOpenAddress error " + localException);
        }
      }
    }
    return false;
  }
  
  public static boolean j()
  {
    if (q.containsKey("msf_limitWtChangetoken")) {
      try
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_limitWtChangetoken"));
        return bool;
      }
      catch (Exception localException)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "get msf_limitWtChangetoken error " + localException);
        }
      }
    }
    return true;
  }
  
  public static boolean k()
  {
    if (q.containsKey("msf_isSetReloadKeyUin")) {
      try
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_isSetReloadKeyUin"));
        return bool;
      }
      catch (Exception localException)
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "get msf_isSetReloadKeyUin error " + localException);
        }
      }
    }
    return true;
  }
  
  public static long l()
  {
    try
    {
      if (q.contains("DeepSleepMaxInterval"))
      {
        long l1 = Long.parseLong((String)q.get("DeepSleepMaxInterval"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "get DeepSleepMaxInterval error " + localException);
      }
    }
    return 57600000L;
  }
  
  public static boolean m()
  {
    try
    {
      if (q.containsKey("msf_isUseWtlogin"))
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_isUseWtlogin"));
        return bool;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "msf_isUseWtlogin error" + localException);
      }
    }
    return w;
  }
  
  public static long n()
  {
    try
    {
      if (q.containsKey("msf_standbyWaitInterval"))
      {
        long l1 = Long.parseLong((String)q.get("msf_standbyWaitInterval"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "get standbyWaitInterval error" + localException);
      }
    }
    return 30000L;
  }
  
  public static long o()
  {
    try
    {
      if (q.containsKey("msf_compressLogDelay"))
      {
        long l1 = Long.parseLong((String)q.get("msf_compressLogDelay"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "get getCompressLogDelay error" + localException);
      }
    }
    return 60000L;
  }
  
  public static long p()
  {
    try
    {
      if (q.containsKey("msf_LogClearInterval"))
      {
        long l1 = Long.parseLong((String)q.get("msf_LogClearInterval"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "get getLogClearInterval error" + localException);
      }
    }
    return 3600000L;
  }
  
  public static boolean q()
  {
    try
    {
      if (q.containsKey("msf_newLogClearStrategy"))
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_newLogClearStrategy"));
        return bool;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getNewLogClearStrategy error" + localException);
      }
    }
    return false;
  }
  
  public static boolean r()
  {
    try
    {
      if (q.containsKey("msf_newLogClearStrategyTest"))
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_newLogClearStrategyTest"));
        return bool;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getNewLogClearStrategyTest error" + localException);
      }
    }
    return true;
  }
  
  public static boolean s()
  {
    try
    {
      if (q.containsKey("msf_newLogClearStrategyTestShutdown"))
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_newLogClearStrategyTestShutdown"));
        return bool;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getNewLogClearStrategyTestShutdown error" + localException);
      }
    }
    return false;
  }
  
  public static long t()
  {
    try
    {
      if (q.containsKey("msf_pingTimeout"))
      {
        long l1 = Long.parseLong((String)q.get("msf_pingTimeout"));
        return l1 * 1000L;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "get getSSOPingTimeout error" + localException);
      }
    }
    return 12000L;
  }
  
  public static boolean u()
  {
    try
    {
      if (q.containsKey("msf_ssopingavailable"))
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_ssopingavailable"));
        return bool;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "get getSSOPingAvailable error" + localException);
      }
    }
    return true;
  }
  
  public static boolean v()
  {
    try
    {
      if (q.containsKey("msf_connFastDetect"))
      {
        boolean bool = Boolean.parseBoolean((String)q.get("msf_connFastDetect"));
        return bool;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "get getConnFastDetectAvailable error" + localException);
      }
    }
    return true;
  }
  
  public static long w()
  {
    try
    {
      if (q.containsKey("msf_heartBeatTimeout"))
      {
        int i1 = Integer.parseInt((String)q.get("msf_heartBeatTimeout"));
        return i1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getHeartBeatTimeout error" + localException);
      }
    }
    return 30000L;
  }
  
  public static long x()
  {
    try
    {
      if (q.containsKey("msf_connFastDetectDelay"))
      {
        long l1 = Long.parseLong((String)q.get("msf_connFastDetectDelay"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getConnFastDetectDelay error" + localException);
      }
    }
    return 2000L;
  }
  
  public static long y()
  {
    try
    {
      if (q.containsKey("msf_connFastDetectTimeout"))
      {
        long l1 = Long.parseLong((String)q.get("msf_connFastDetectTimeout"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getConnFastDetectTimeout error" + localException);
      }
    }
    return 10000L;
  }
  
  public static long z()
  {
    try
    {
      if (q.containsKey("msf_autoReconnInterval"))
      {
        long l1 = Long.parseLong((String)q.get("msf_autoReconnInterval"));
        return l1;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "getAutoReconnInterval error" + localException);
      }
    }
    return 0L;
  }
  
  public int a(ToServiceMsg paramToServiceMsg)
  {
    if ((paramToServiceMsg.getWupBuffer() != null) && (paramToServiceMsg.getWupBuffer().length > 0)) {}
    for (;;)
    {
      x.sendSsoMsg(paramToServiceMsg);
      return paramToServiceMsg.getRequestSsoSeq();
      Object localObject1 = new com.tencent.msf.service.protocol.f.f();
      f = 0;
      a = new com.tencent.msf.service.protocol.f.b();
      d = "";
      e = "";
      g = new byte[0];
      c = new ArrayList();
      b = new ArrayList();
      Object localObject2 = new com.tencent.msf.service.protocol.f.d();
      e = 0;
      d = 0;
      c = 0;
      a = "";
      b = 0L;
      ArrayList localArrayList = new ArrayList();
      localArrayList.add(localObject2);
      localObject2 = new UniPacket(true);
      ((UniPacket)localObject2).setEncodeName("utf-8");
      ((UniPacket)localObject2).setRequestId(0);
      ((UniPacket)localObject2).setServantName("KQQ.ConfigService.ConfigServantObj");
      ((UniPacket)localObject2).setFuncName("ClientReq");
      ((UniPacket)localObject2).put("iCmdType", Integer.valueOf(64));
      ((UniPacket)localObject2).put("ReqUserInfo", localObject1);
      localObject1 = new com.tencent.msf.service.protocol.f.e();
      a = localArrayList;
      ((UniPacket)localObject2).put("GetResourceReqV2", localObject1);
      paramToServiceMsg.putWupBuffer(((UniPacket)localObject2).encode());
    }
  }
  
  public int a(HashMap paramHashMap, String paramString)
    throws Exception
  {
    paramHashMap = a(paramString, paramHashMap);
    paramString = new ToServiceMsg("", "0", "CliLogSvc.UploadReq");
    paramString.setAppId(x.sender.f());
    paramString.setRequestSsoSeq(MsfCore.getNextSeq());
    paramString.setTimeout(30000L);
    paramString.setNeedCallback(false);
    paramString.putWupBuffer(paramHashMap);
    return x.sendSsoMsg(paramString);
  }
  
  public void a()
  {
    b();
  }
  
  public void a(int paramInt, String paramString1, long paramLong, boolean paramBoolean1, String paramString2, boolean paramBoolean2)
  {
    paramString1 = new b(this, paramBoolean2, paramString1, paramInt, paramLong, paramBoolean1, paramString2);
    paramString1.setName("checkSsoByHttpThread");
    paramString1.start();
  }
  
  public void a(com.tencent.msf.service.protocol.e.f paramF, FromServiceMsg paramFromServiceMsg, ToServiceMsg paramToServiceMsg)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.ConfigManager", 2, "recvServerConfig: " + paramF);
    }
    if (paramF == null) {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "configInfo.iUpdateType is null , return");
      }
    }
    label280:
    label454:
    label540:
    label798:
    do
    {
      String str3;
      do
      {
        do
        {
          do
          {
            return;
            if (a == 1) {
              break;
            }
          } while (!QLog.isColorLevel());
          QLog.d("MSF.C.ConfigManager", 2, "configInfo.iUpdateType is " + a + " , return");
          return;
          str3 = d;
          if ((str3 != null) && (str3.length() != 0)) {
            break;
          }
        } while (!QLog.isColorLevel());
        QLog.d("MSF.C.ConfigManager", 2, "handle config, res.sConf null, return");
        return;
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "handle sConf " + d);
        }
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.ConfigManager", 2, "handle sEspConf " + f);
        }
        String str4 = "";
        i1 = str3.indexOf("<MSF>");
        i2 = str3.indexOf("</MSF>");
        if ((i1 == -1) || (i2 == -1) || (i1 >= i2))
        {
          str1 = str4;
          paramToServiceMsg = str3;
          if (QLog.isColorLevel())
          {
            QLog.d("MSF.C.ConfigManager", 2, "handle config MSF null, skip");
            paramToServiceMsg = str3;
            str1 = str4;
          }
          if ((str1 != null) && (str1.length() != 0)) {
            break label454;
          }
        }
        for (;;)
        {
          if ((b != 0) && (v != b)) {
            break label540;
          }
          if (QLog.isColorLevel()) {
            QLog.d("MSF.C.ConfigManager", 2, "handle config,  iGetSdkLastTime is obsolete, skip...");
          }
          if ((g != 0) && (u != g)) {
            break label798;
          }
          if (QLog.isColorLevel()) {
            QLog.d("MSF.C.ConfigManager", 2, "handle config, iGetAppidTime is obsolete, skip...");
          }
          paramToServiceMsg = f;
          if ((paramToServiceMsg != null) && (paramToServiceMsg.length() != 0)) {
            break label1048;
          }
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.d("MSF.C.ConfigManager", 2, "handle config, res.sEspConf null, return");
          return;
          str1 = str3.substring("<MSF>".length() + i1, i2);
          paramToServiceMsg = str3.substring(0, i1) + str3.substring("</MSF>".length() + i2, str3.length());
          break label280;
          if (a("msfConfig", str1, ""))
          {
            str1 = c(str1);
            if (QLog.isColorLevel()) {
              QLog.d("MSF.C.ConfigManager", 2, "recv config str_msf: " + str1);
            }
            MsfStore.getNativeConfigStore().n_setConfig("__loginSdk_iconf_Msf", str1);
          }
          else if (QLog.isColorLevel())
          {
            QLog.d("MSF.C.ConfigManager", 2, "parse msfConf error , skip store.");
          }
        }
        v = b;
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.ConfigManager", 4, "save confReq iGetSdkNewTime" + b);
        }
        MsfStore.getNativeConfigStore().n_setConfig("__loginSdk_iConfSdkLastTimeKey", String.valueOf(b));
        i1 = paramToServiceMsg.indexOf("<CommConf>");
        i2 = paramToServiceMsg.indexOf("</CommConf>");
        if ((i1 != -1) && (i2 != -1) && (i1 < i2)) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.d("MSF.C.ConfigManager", 2, "handle config CommConf error");
      return;
      String str1 = paramToServiceMsg.substring("<CommConf>".length() + i1, i2);
      if ((str1 == null) || (str1.length() == 0)) {
        MsfStore.getNativeConfigStore().n_setConfig("__loginSdk_iconf_UserCommCon", "");
      }
      for (;;)
      {
        try
        {
          MsfSdkUtils.writeServerConfig("com.tencent.mobileqq", 0, str1, x.sender.e());
        }
        catch (IOException localIOException)
        {
          QLog.e("MSF.C.ConfigManager", 1, "write config error " + localIOException);
        }
        break;
        if (a("commConfig", localIOException, ""))
        {
          str3 = c(localIOException);
          MsfStore.getNativeConfigStore().n_setConfig("__loginSdk_iconf_UserCommCon", str3);
        }
        else if (QLog.isColorLevel())
        {
          QLog.d("MSF.C.ConfigManager", 2, "parse commonConf error , skip store.");
        }
      }
      u = g;
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.ConfigManager", 4, "save confReq getiConfAppidTimeKey" + g);
      }
      MsfStore.getNativeConfigStore().n_setConfig("__loginSdk_iConfAppidTimeKey", String.valueOf(g));
      i1 = paramToServiceMsg.indexOf("<APPIDConf>");
      i2 = paramToServiceMsg.indexOf("</APPIDConf>");
      if ((i1 != -1) && (i2 != -1) && (i1 < i2)) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("MSF.C.ConfigManager", 2, "handle config APPIDConf error");
    return;
    paramToServiceMsg = paramToServiceMsg.substring("<APPIDConf>".length() + i1, i2);
    if ((paramToServiceMsg == null) || (paramToServiceMsg.length() == 0)) {
      MsfStore.getNativeConfigStore().n_setConfig("__loginSdk_iconf_AppConf", "");
    }
    for (;;)
    {
      try
      {
        MsfSdkUtils.writeServerConfig("com.tencent.mobileqq", 2, paramToServiceMsg, x.sender.e());
      }
      catch (IOException paramToServiceMsg)
      {
        QLog.e("MSF.C.ConfigManager", 1, "write config error " + paramToServiceMsg);
      }
      break;
      if (a("appidConf", paramToServiceMsg, ""))
      {
        str2 = c(paramToServiceMsg);
        MsfStore.getNativeConfigStore().n_setConfig("__loginSdk_iconf_AppConf", str2);
      }
      else if (QLog.isColorLevel())
      {
        QLog.d("MSF.C.ConfigManager", 2, "parse appidConf error , skip store.");
      }
    }
    label1048:
    String str2 = "";
    int i1 = paramToServiceMsg.indexOf("<UserConf>");
    int i2 = paramToServiceMsg.indexOf("</UserConf>");
    if ((i1 == -1) || (i2 == -1) || (i1 >= i2))
    {
      paramToServiceMsg = str2;
      if (QLog.isColorLevel())
      {
        QLog.d("MSF.C.ConfigManager", 2, "handle config UserConf skip");
        paramToServiceMsg = str2;
      }
    }
    for (;;)
    {
      if ((paramToServiceMsg == null) || (paramToServiceMsg.length() == 0)) {}
      try
      {
        for (;;)
        {
          MsfSdkUtils.writeServerConfig("com.tencent.mobileqq", 1, paramToServiceMsg, x.sender.e());
          MsfStore.getNativeConfigStore().n_setConfig("__loginSdk_iConfGetEspLastTimeKe", String.valueOf(e));
          if (QLog.isDevelopLevel()) {
            QLog.d("MSF.C.ConfigManager", 4, "save confReq getiConfGetEspLastTimeKey" + e);
          }
          bf();
          bh();
          bg();
          x.quicksender.a();
          if (QLog.isColorLevel()) {
            QLog.d("MSF.C.ConfigManager", 2, "handle server config ok");
          }
          CodecWarpper.getFileStoreKey();
          return;
          paramToServiceMsg = paramToServiceMsg.substring("<UserConf>".length() + i1, i2);
          break;
          if (a("userConf", paramToServiceMsg, paramFromServiceMsg.getUin() + "_"))
          {
            str2 = c(paramToServiceMsg);
            MsfStore.getNativeConfigStore().n_setConfig(paramFromServiceMsg.getUin() + "_" + "__loginSdk_iconf_UserConf", str2);
          }
          else if (QLog.isColorLevel())
          {
            QLog.d("MSF.C.ConfigManager", 2, "parse userConfig error , skip store.");
          }
        }
      }
      catch (IOException paramFromServiceMsg)
      {
        for (;;)
        {
          QLog.e("MSF.C.ConfigManager", 1, "write config error " + paramFromServiceMsg);
        }
      }
    }
  }
  
  public void a(FromServiceMsg paramFromServiceMsg)
  {
    Object localObject1 = new com.tencent.msf.service.protocol.d.b();
    paramFromServiceMsg = paramFromServiceMsg.getWupBuffer();
    Object localObject2 = new byte[paramFromServiceMsg.length - 4];
    System.arraycopy(paramFromServiceMsg, 4, localObject2, 0, paramFromServiceMsg.length - 4);
    ((com.tencent.msf.service.protocol.d.b)localObject1).readFrom(new JceInputStream((byte[])localObject2));
    long l1 = System.currentTimeMillis() / 1000L;
    paramFromServiceMsg = a.iterator();
    while (paramFromServiceMsg.hasNext())
    {
      localObject1 = (com.tencent.msf.service.protocol.d.a)paramFromServiceMsg.next();
      if ((localObject1 != null) && (b > 0) && (b <= 1800))
      {
        localObject2 = new String(a);
        Object localObject3 = ((String)localObject2).substring(0, ((String)localObject2).indexOf(".") + 1);
        Iterator localIterator = J.iterator();
        while (localIterator.hasNext())
        {
          a localA = (a)localIterator.next();
          if (((String)localObject2).equals(c)) {
            J.remove(localA);
          } else if (((((String)localObject2).endsWith(".*")) || (c.endsWith(".*"))) && (c.startsWith((String)localObject3))) {
            J.remove(localA);
          }
        }
        localObject3 = new a();
        a = l1;
        b = ((com.tencent.msf.service.protocol.d.a)localObject1);
        J.add(localObject3);
        QLog.d("MSF.C.ConfigManager", 1, "recved OverloadPushNotify cmd: " + (String)localObject2 + " delaySecs = " + b + " timeReced: " + l1 + " tips: " + e);
      }
    }
  }
  
  public void a(FromServiceMsg paramFromServiceMsg, ToServiceMsg paramToServiceMsg)
  {
    if (!paramFromServiceMsg.isSuccess()) {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "wait " + paramToServiceMsg + " timeout.");
      }
    }
    UniPacket localUniPacket;
    int i1;
    do
    {
      return;
      localUniPacket = new UniPacket(true);
      localUniPacket.setEncodeName("UTF-8");
      localUniPacket.decode(paramFromServiceMsg.getWupBuffer());
      i1 = ((Integer)localUniPacket.getByClass("iCmdType", Integer.valueOf(0))).intValue();
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "handle check ConfigResp ." + i1);
      }
    } while ((i1 == 16) || (i1 != 32));
    a((com.tencent.msf.service.protocol.e.f)localUniPacket.getByClass("SDKConfRes", new com.tencent.msf.service.protocol.e.f()), paramFromServiceMsg, paramToServiceMsg);
  }
  
  public void a(ToServiceMsg paramToServiceMsg, long paramLong)
  {
    if (ah())
    {
      if (!NetConnInfoCenterImpl.isMobileConn()) {
        break label79;
      }
      A = paramLong;
      MsfStore.getNativeConfigStore().n_setConfig("__loginSdk_checkmobilessotime", String.valueOf(A));
      C = A + 3600000L;
      ai();
    }
    try
    {
      a(paramToServiceMsg.getAppId(), paramToServiceMsg.getUin(), 60000L, NetConnInfoCenterImpl.isWifiConn(), "", false);
    }
    catch (Exception localException)
    {
      try
      {
        for (;;)
        {
          a(paramToServiceMsg.getUin(), 60000);
          return;
          label79:
          if (NetConnInfoCenterImpl.isWifiConn())
          {
            B = paramLong;
            MsfStore.getNativeConfigStore().n_setConfig("__loginSdk_checkwifissotime", String.valueOf(B));
            D = B + 3600000L;
            aj();
            continue;
            localException = localException;
            if (QLog.isColorLevel()) {
              QLog.d("MSF.C.ConfigManager", 2, localException.toString(), localException);
            }
          }
        }
      }
      catch (Exception paramToServiceMsg)
      {
        while (!QLog.isColorLevel()) {}
        QLog.d("MSF.C.ConfigManager", 2, paramToServiceMsg.toString(), paramToServiceMsg);
      }
    }
  }
  
  public void a(String paramString, int paramInt)
  {
    byte[] arrayOfByte = ak();
    paramString = new ToServiceMsg("", paramString, "ConfigService.ClientReq");
    paramString.setMsfCommand(MsfCommand._msf_getConfig);
    paramString.setRequestSsoSeq(MsfCore.getNextSeq());
    if (x.getMsfAppid() == -1) {}
    for (int i1 = 100;; i1 = x.getMsfAppid())
    {
      paramString.setAppId(i1);
      paramString.putWupBuffer(arrayOfByte);
      paramString.setTimeout(paramInt);
      x.sender.b(paramString);
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.ConfigManager", 2, "send checkConfig msg ok...");
      }
      return;
    }
  }
  
  byte[] a(String paramString, HashMap paramHashMap)
  {
    StrupBuff localStrupBuff = new StrupBuff();
    prefix = paramString;
    logstring = new HashMap(paramHashMap);
    encoding = 2;
    paramString = new UniPacket(true);
    paramString.setRequestId(MsfCore.getNextSeq());
    paramString.setEncodeName("utf-8");
    paramString.setServantName("QQService.CliLogSvc.MainServantObj");
    paramString.setFuncName("UploadReq");
    paramString.put("Data", localStrupBuff);
    return paramString.encode();
  }
  
  public String ae()
  {
    return d(MsfStore.getNativeConfigStore().getConfig("__loginSdk_iconf_UserCommCon"));
  }
  
  public String af()
  {
    return d(MsfStore.getNativeConfigStore().getConfig("__loginSdk_iconf_AppConf"));
  }
  
  public String ag()
  {
    return d(MsfStore.getNativeConfigStore().getConfig("__loginSdk_iconf_Msf"));
  }
  
  public boolean ah()
  {
    long l1 = System.currentTimeMillis();
    if (NetConnInfoCenterImpl.isMobileConn()) {
      if (A != 0L) {}
    }
    do
    {
      do
      {
        do
        {
          do
          {
            do
            {
              return true;
              if (C != 0L) {
                break;
              }
            } while (l1 - A >= 43200000L);
            return false;
          } while (l1 >= C);
          return false;
          if (!NetConnInfoCenterImpl.isWifiConn()) {
            break;
          }
        } while (B == 0L);
        if (D != 0L) {
          break;
        }
      } while (l1 - B >= 43200000L);
      return false;
    } while (l1 >= D);
    return false;
    return false;
  }
  
  public void ai()
  {
    MsfStore.getNativeConfigStore().n_setConfig("__loginSdk_mobilessotime", String.valueOf(C));
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.ConfigManager", 2, "save next get mobile sso time is " + x.timeFormatter.format(Long.valueOf(C)));
    }
  }
  
  public void aj()
  {
    MsfStore.getNativeConfigStore().n_setConfig("__loginSdk_wifissotime", String.valueOf(D));
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.ConfigManager", 2, "save next get Wifi sso time is " + x.timeFormatter.format(Long.valueOf(D)));
    }
  }
  
  public byte[] ak()
  {
    UniPacket localUniPacket = new UniPacket(true);
    localUniPacket.setServantName("KQQ.ConfigService.ConfigServantObj");
    localUniPacket.setFuncName("ClientReq");
    localUniPacket.put("iCmdType", Integer.valueOf(32));
    com.tencent.msf.service.protocol.e.e localE = new com.tencent.msf.service.protocol.e.e();
    Object localObject2 = MsfStore.getNativeConfigStore().getConfig("__loginSdk_iConfAppidTimeKey");
    if (localObject2 != null)
    {
      localObject1 = localObject2;
      if (((String)localObject2).length() != 0) {}
    }
    else
    {
      localObject1 = "1";
    }
    u = Integer.parseInt((String)localObject1);
    if (u == 0) {
      u = 1;
    }
    localObject2 = MsfStore.getNativeConfigStore().getConfig("__loginSdk_iConfSdkLastTimeKey");
    if (localObject2 != null)
    {
      localObject1 = localObject2;
      if (((String)localObject2).length() != 0) {}
    }
    else
    {
      localObject1 = "0";
    }
    v = Integer.parseInt((String)localObject1);
    localObject2 = MsfStore.getNativeConfigStore().getConfig("__loginSdk_iConfGetEspLastTimeKe");
    if (localObject2 != null)
    {
      localObject1 = localObject2;
      if (((String)localObject2).length() != 0) {}
    }
    else
    {
      localObject1 = "0";
    }
    int i1 = Integer.parseInt((String)localObject1);
    e = u;
    b = v;
    d = i1;
    if (QLog.isDevelopLevel()) {
      QLog.d("MSF.C.ConfigManager", 4, "load confReq iGetAppidTime" + e + " iGetSdkLastTime:" + b + " iGetEspLastTime:" + d);
    }
    localObject2 = x.getAccountCenter().d();
    Object localObject1 = new ArrayList();
    localObject2 = ((ArrayList)localObject2).iterator();
    while (((Iterator)localObject2).hasNext()) {
      ((ArrayList)localObject1).add(((SimpleAccount)((Iterator)localObject2).next()).getUin());
    }
    c = ((ArrayList)localObject1);
    localUniPacket.put("SDKConfReq", localE);
    return localUniPacket.encode();
  }
  
  public ConcurrentHashMap al()
  {
    return q;
  }
  
  public int b(ToServiceMsg paramToServiceMsg)
  {
    byte b1 = ((Byte)paramToServiceMsg.getAttributes().get("to_report_type")).byteValue();
    String str = (String)paramToServiceMsg.getAttributes().get("to_report_content");
    UniPacket localUniPacket = new UniPacket(true);
    localUniPacket.setRequestId(MsfCore.getNextSeq());
    localUniPacket.setServantName("KQQ.ConfigService.ConfigServantObj");
    localUniPacket.setFuncName("ClientReportReq");
    com.tencent.msf.service.protocol.e.a localA = new com.tencent.msf.service.protocol.e.a();
    a = b1;
    try
    {
      c = str.getBytes("utf-8");
      localUniPacket.put("ClientReportReq", localA);
      paramToServiceMsg.putWupBuffer(localUniPacket.encode());
      return x.sendSsoMsg(paramToServiceMsg);
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      for (;;)
      {
        localUnsupportedEncodingException.printStackTrace();
      }
    }
  }
  
  public String b(String paramString)
  {
    return d(MsfStore.getNativeConfigStore().getConfig(paramString + "_" + "__loginSdk_iconf_UserConf"));
  }
  
  protected void b()
  {
    String str1 = MsfStore.getNativeConfigStore().getConfig("__loginSdk_checkmobilessotime");
    if (str1 != null)
    {
      localObject = str1;
      if (str1.length() != 0) {}
    }
    else
    {
      localObject = "0";
    }
    A = Long.parseLong((String)localObject);
    str1 = MsfStore.getNativeConfigStore().getConfig("__loginSdk_checkwifissotime");
    if (str1 != null)
    {
      localObject = str1;
      if (str1.length() != 0) {}
    }
    else
    {
      localObject = "0";
    }
    B = Long.parseLong((String)localObject);
    str1 = MsfStore.getNativeConfigStore().getConfig("__loginSdk_mobilessotime");
    if (str1 != null)
    {
      localObject = str1;
      if (str1.length() != 0) {}
    }
    else
    {
      localObject = "0";
    }
    C = Long.parseLong((String)localObject);
    str1 = MsfStore.getNativeConfigStore().getConfig("__loginSdk_wifissotime");
    if (str1 != null)
    {
      localObject = str1;
      if (str1.length() != 0) {}
    }
    else
    {
      localObject = "0";
    }
    D = Long.parseLong((String)localObject);
    str1 = MsfStore.getNativeConfigStore().getConfig("_msf_isBootingKey");
    if (str1 != null)
    {
      localObject = str1;
      if (str1.length() != 0) {}
    }
    else
    {
      localObject = "false";
    }
    a(Boolean.parseBoolean((String)localObject));
    Object localObject = ag();
    if ((localObject != null) && (((String)localObject).length() > 0)) {
      a("msfConfig", (String)localObject, "");
    }
    localObject = ae();
    if ((localObject != null) && (((String)localObject).length() > 0)) {
      a("commonConfig", (String)localObject, "");
    }
    localObject = af();
    if ((localObject != null) && (((String)localObject).length() > 0)) {
      a("appidConfig", (String)localObject, "");
    }
    if (QLog.isDevelopLevel()) {
      QLog.d("MSF.C.ConfigManager", 4, (String)localObject);
    }
    localObject = x.getAccountCenter().c().iterator();
    while (((Iterator)localObject).hasNext())
    {
      str1 = (String)((Iterator)localObject).next();
      String str2 = b(str1);
      if ((str2 != null) && (str2.length() > 0)) {
        a("userConfig", str2, str1 + "_");
      }
    }
    bf();
  }
  
  public String c(ToServiceMsg paramToServiceMsg)
  {
    switch (((Integer)paramToServiceMsg.getAttributes().get("to_getServerConfig_type")).intValue())
    {
    default: 
      return null;
    case 0: 
      return ae();
    case 1: 
      return b(paramToServiceMsg.getUin());
    }
    return af();
  }
  
  public class a
  {
    public long a;
    public com.tencent.msf.service.protocol.d.a b;
    public String c;
    private boolean e;
    
    public a() {}
  }
}
