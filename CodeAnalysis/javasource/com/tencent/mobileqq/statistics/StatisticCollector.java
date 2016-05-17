package com.tencent.mobileqq.statistics;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningServiceInfo;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Debug.MemoryInfo;
import android.os.Process;
import android.text.TextUtils;
import com.tencent.beacon.event.UserAction;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.feedback.eup.CrashReport;
import com.tencent.feedback.eup.CrashStrategyBean;
import com.tencent.feedback.eup.jni.NativeExceptionUpload;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.DpcNames;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.msf.sdk.MsfMsgUtil;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.msf.sdk.MsfServiceSdk;
import com.tencent.mobileqq.msf.sdk.RdmReq;
import com.tencent.mobileqq.servlet.ReportServlet;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.qphone.base.remote.SimpleAccount;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import cooperation.qzone.LocalMultiProcConfig;
import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Stack;
import mqq.app.AppRuntime;
import mqq.app.NewIntent;
import mqq.os.MqqHandler;
import org.json.JSONObject;
import rep;
import req;
import rer;
import reu;
import rev;
import rew;
import rex;

public class StatisticCollector
{
  public static final String A = "actC2CStreamPttUpload";
  public static final String B = "actC2CStreamPttDownload";
  public static final String C = "actC2CPttDownload";
  public static final String D = "actC2CPttUpload";
  public static final String E = "actGroupPicUploadV1";
  public static final String F = "actGroupPicUploadV2";
  public static final String G = "actGroupPicDownloadV1";
  public static final String H = "actGroupPicSmallDownV1";
  public static final String I = "actGrpPttUp";
  public static final String J = "actGrpPttDown";
  public static final String K = "actAllC2CPttUp";
  public static final String L = "actPttShowDownloading";
  public static final String M = "actPttUserWaiting";
  public static final String N = "actPttDownloadStream2Offline";
  public static final String O = "actPttLongPressFate2";
  public static final String P = "actPttSoUpdate";
  public static final String Q = "actPttProcessFrameCost";
  public static final String R = "actPttNoRangeFailed";
  public static final String S = "actPttPlayBluetooth";
  public static final String T = "actDiscussPicUpload";
  public static final String U = "actDiscussPicUploadV2";
  public static final String V = "actDiscussPicDown";
  public static final String W = "actDiscussPicSmallDown";
  public static final String X = "actDisscusPttUp";
  public static final String Y = "actDisscusPttDown";
  public static final String Z = "actMultiMsgUpload";
  public static final int a = 5;
  private static final long jdField_a_of_type_Long = 3000L;
  private static Context jdField_a_of_type_AndroidContentContext;
  private static StatisticCollector jdField_a_of_type_ComTencentMobileqqStatisticsStatisticCollector;
  public static final String a = "StatisticCollector";
  private static SimpleDateFormat jdField_a_of_type_JavaTextSimpleDateFormat;
  public static final String aA = "actShortVideoDiscussgroupDownloadThumb";
  public static final String aB = "actShortVideoForward";
  public static final String aC = "actShortVideoForwardBDH";
  public static final String aD = "actSqliteDatabaseCorrupt";
  public static final String aE = "evSpError";
  public static final String aF = "actLongMessageDownload";
  public static final String aG = "callqzonefrompushv2";
  public static final String aH = "actQZSourceDataReport";
  public static final String aI = "actQZPushDataReport";
  public static final String aJ = "actQZUnreadDataReport";
  public static final String aK = "qzonepushstate";
  public static final String aL = "callqzonefromfriendfeed";
  public static final String aM = "prxyRegisterB";
  public static final String aN = "prxyRegisterT";
  public static final String aO = "prxyRegisterM";
  public static final String aP = "prxyRegFailCode";
  public static final String aQ = "prxyRegDiffGroupNum";
  public static final String aR = "prxyRegNeedPullGroup";
  public static final String aS = "actDefaultObserverCost";
  public static final String aT = "addFriendSource";
  public static final String aV = "CrashInfoSummary.log";
  public static final String aW = "actNvwaConfig";
  public static final String aX = "actNvwaDownload";
  public static final String aY = "actNvwaCheck";
  public static final String aZ = "actNvwaLoad";
  public static final String aa = "actMultiMsgDownload";
  public static final String ab = "actSendDiscussProcess";
  public static final String ac = "actIntroPttUpload";
  public static final String ad = "actIntroPttDownload";
  public static final String ae = "dim.actSendWpaMsg";
  public static final String af = "actQzoneUnread";
  public static final String ag = "actPluginUnread";
  public static final String ah = "actNearbyPeoplePicUpload";
  public static final String ai = "actFriendAvatarUpload";
  public static final String aj = "actNearbyPeoplePicDownload";
  public static final String ak = "actFreshNewsPicUpload";
  public static final String al = "actNearbyPicBrowser";
  public static final String am = "actSnapChatPicUpload";
  public static final String an = "actBusinessCardPicUpload";
  public static final String ao = "actMessageEvent";
  public static final String ap = "multiMsgNickTimeOut";
  public static final String aq = "multiMsgNickTimeoutR";
  public static final String ar = "multiMsgSend";
  public static final String as = "multiMsgReceive";
  public static final String at = "actShortVideoUpload";
  public static final String au = "actShortVideoUploadBDH";
  public static final String av = "actShortVideoDownloadVideo";
  public static final String aw = "actShortVideoDownloadThumb";
  public static final String ax = "actShortVideoDiscussgroupUpload";
  public static final String ay = "actShortVideoDiscussgroupUploadBDH";
  public static final String az = "actShortVideoDiscussgroupDownloadVideo";
  public static final int b = 100;
  private static final long jdField_b_of_type_Long = 86400000L;
  public static final String b = "actLoginT";
  private static SimpleDateFormat jdField_b_of_type_JavaTextSimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
  public static boolean b = false;
  public static final String ba = "actNvwaInstall";
  private static final String bb = "Statistics_time";
  private static final String bc = "fg_duration";
  private static final String bd = "bg_duration";
  private static final String be = "next_reportTime";
  private static final String bf = "End_Info";
  private static final String bg = "AndroidQQUseApp";
  private static final String bh = "AndroidQQRunTime";
  private static final String bi = "mqq_dailyUse";
  public static final int c = 101;
  public static final String c = "actMemory";
  private static boolean jdField_c_of_type_Boolean = false;
  public static final int d = 102;
  private static final long jdField_d_of_type_Long = 15360L;
  public static final String d = "actSyncMsgFirst";
  private static final boolean jdField_d_of_type_Boolean = true;
  public static final int e = 200;
  public static final String e = "actSyncMsgSecond";
  public static final int f = 201;
  public static final String f = "actQQInit";
  private static boolean f = false;
  public static final int g = 202;
  public static final String g = "actSendC2CProcess";
  public static final int h = 300;
  public static final String h = "actSendC2CPictureProcess";
  public static final int i = 301;
  public static final String i = "actSendGroupProcess";
  public static final int j = 302;
  public static final String j = "actSendGroupPictureProcess";
  public static final int k = 400;
  public static final String k = "dim.actSendGroupPttMsg";
  public static final int l = 401;
  public static final String l = "facePicUploadProcess";
  public static final int m = 500;
  public static final String m = "sendMsgTooLargeErrorTag";
  public static final int n = 501;
  public static final String n = "revokeMsgErrorTag";
  public static final int o = 502;
  public static final String o = "PAJSSDKPicUploadProcess";
  private static final int p = 10;
  public static final String p = "C2BUploadFile";
  private static final int q = 28800000;
  public static final String q = "msgSendCostPerPhase";
  public static final String r = "version_patchlib_load";
  public static final String s = "actPicUploadV2.Card.Picture";
  public static final String t = "actPicDownloadV2.Card.Picture";
  public static final String u = "dim.actSendGrpTmpMsg";
  public static final String v = "actC2CPicUploadV1";
  public static final String w = "actC2CPicUploadV2";
  public static final String x = "actC2CPicDownloadV1";
  public static final String y = "actC2CPicSmallDownV1";
  public static final String z = "actSwitchChnl";
  private StringBuilder jdField_a_of_type_JavaLangStringBuilder = new StringBuilder("DPC info:\n");
  private HashMap jdField_a_of_type_JavaUtilHashMap = new HashMap(4);
  private LinkedList jdField_a_of_type_JavaUtilLinkedList = new LinkedList();
  private Stack jdField_a_of_type_JavaUtilStack = new Stack();
  rew jdField_a_of_type_Rew = new rew();
  public boolean a;
  private rex[] jdField_a_of_type_ArrayOfRex = { new rex(this, "com.tencent.mtt", "qqBrowser"), new rex(this, "com.tencent.android.qqdownloader", "qqMarket"), new rex(this, "com.tencent.qqgame", "qqGame"), new rex(this, "com.tencent.qqmusic", "qqMusic"), new rex(this, "com.tencent.news", "qqNews"), new rex(this, "com.qq.reader", "qqReader"), new rex(this, "com.tencent.qqlive", "qqVideo"), new rex(this, "com.tencent.wblog", "qqMicroblog"), new rex(this, "com.tencent.qqphonebook", "qqPhonebook") };
  public String aU = "999";
  private StringBuilder jdField_b_of_type_JavaLangStringBuilder = new StringBuilder("Thread info:\n");
  private String bj;
  private long jdField_c_of_type_Long;
  private boolean e = false;
  private boolean g;
  private int r = 0;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_c_of_type_Boolean = false;
    jdField_a_of_type_JavaTextSimpleDateFormat = new SimpleDateFormat("MM.dd HH:mm:ss.SSS");
    jdField_b_of_type_Boolean = false;
    f = false;
  }
  
  private StatisticCollector(Context paramContext, long paramLong)
  {
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_AndroidContentContext = paramContext;
    UserAction.setUserID("10000");
    UserAction.initUserAction(jdField_a_of_type_AndroidContentContext, false, paramLong);
    UserAction.setChannelID("2017");
  }
  
  public static int a()
  {
    return LocalMultiProcConfig.a("version_patchlib_load", 0);
  }
  
  public static StatisticCollector a(Context paramContext)
  {
    return a(paramContext, 3000L);
  }
  
  public static StatisticCollector a(Context paramContext, long paramLong)
  {
    BaseApplication localBaseApplication = BaseApplication.getContext();
    if (localBaseApplication != null) {
      paramContext = localBaseApplication;
    }
    if (jdField_a_of_type_ComTencentMobileqqStatisticsStatisticCollector == null) {}
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqStatisticsStatisticCollector == null) {
        jdField_a_of_type_ComTencentMobileqqStatisticsStatisticCollector = new StatisticCollector(paramContext, paramLong);
      }
      return jdField_a_of_type_ComTencentMobileqqStatisticsStatisticCollector;
    }
    finally {}
  }
  
  private String a(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    int i1 = 0;
    if (i1 < jdField_a_of_type_ArrayOfRex.length)
    {
      String str = jdField_a_of_type_ArrayOfRex[i1].a;
      if (!paramString.toLowerCase().contains(str)) {}
    }
    for (paramString = jdField_a_of_type_ArrayOfRex[i1].b;; paramString = null)
    {
      return paramString;
      i1 += 1;
      break;
    }
  }
  
  private static Map a()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("param_MODEL", DeviceInfoUtil.d());
    localHashMap.put("param_manu", DeviceInfoUtil.k());
    localHashMap.put("param_OS", DeviceInfoUtil.e());
    localHashMap.put("param_Resolution", MsfSdkUtils.getResolutionString(jdField_a_of_type_AndroidContentContext));
    localHashMap.put("param_IMEI", DeviceInfoUtil.a());
    localHashMap.put("param_IMSI", DeviceInfoUtil.b());
    localHashMap.put("param_NetworkType", "" + NetworkUtil.b(jdField_a_of_type_AndroidContentContext));
    localHashMap.put("param_ProductVersion", "" + AppSetting.jdField_a_of_type_Int);
    localHashMap.put("param_CPU", DeviceInfoUtil.g());
    localHashMap.put("param_totalmemory", MsfSdkUtils.getTotalMemory());
    localHashMap.put("param_availmemory", String.valueOf(DeviceInfoUtil.d() / 1024L) + "kB");
    long[] arrayOfLong = DeviceInfoUtil.a();
    localHashMap.put("param_totalrom", String.valueOf(arrayOfLong[0]) + "MB");
    localHashMap.put("param_availrom", String.valueOf(arrayOfLong[1]) + "MB");
    arrayOfLong = DeviceInfoUtil.b();
    localHashMap.put("param_totalsd", String.valueOf(arrayOfLong[0]) + "MB");
    localHashMap.put("param_availsd", String.valueOf(arrayOfLong[1]) + "MB");
    localHashMap.put("param_Camera", "" + DeviceInfoUtil.c());
    return localHashMap;
  }
  
  public static void a(int paramInt)
  {
    LocalMultiProcConfig.a("version_patchlib_load", paramInt);
    if (paramInt > 0) {
      QLog.i("PatchLibLoader", 1, "setQzonePatchTag" + paramInt);
    }
  }
  
  private void a(Context paramContext, String paramString)
  {
    if ((TextUtils.isEmpty(paramString)) || (paramContext == null)) {}
    for (;;)
    {
      return;
      Object localObject = ((ActivityManager)paramContext.getSystemService("activity")).getRunningServices(200);
      if ((localObject != null) && (((List)localObject).size() > 0))
      {
        localObject = ((List)localObject).iterator();
        while (((Iterator)localObject).hasNext())
        {
          ActivityManager.RunningServiceInfo localRunningServiceInfo = (ActivityManager.RunningServiceInfo)((Iterator)localObject).next();
          if (paramString.equals(process))
          {
            Intent localIntent = new Intent();
            localIntent.setComponent(service);
            QLog.d("StatisticCollector", 1, "Stop service: " + service + ", clientCount: " + clientCount + ", clientPackage: " + clientPackage + ", crashCount: " + crashCount);
            paramContext.stopService(localIntent);
          }
        }
      }
    }
  }
  
  public static void a(Map paramMap, int paramInt)
  {
    paramMap.put("param_FailCode", String.valueOf(paramInt));
  }
  
  private boolean a(String paramString)
  {
    if ("actC2CPicUploadV1".equals(paramString)) {}
    while (("actC2CPicUploadV2".equals(paramString)) || ("actGroupPicUploadV2".equals(paramString)) || ("actDiscussPicUploadV2".equals(paramString)) || ("actC2CPicDownloadV1".equals(paramString)) || ("actC2CPicSmallDownV1".equals(paramString)) || ("actGroupPicUploadV1".equals(paramString)) || ("actGroupPicDownloadV1".equals(paramString)) || ("actGroupPicSmallDownV1".equals(paramString)) || ("actDiscussPicUpload".equals(paramString)) || ("actDiscussPicDown".equals(paramString)) || ("actDiscussPicSmallDown".equals(paramString)) || ("actGrpPttUp".equals(paramString)) || ("actGrpPttDown".equals(paramString)) || ("actDisscusPttUp".equals(paramString)) || ("actDisscusPttDown".equals(paramString)) || ("actC2CStreamPttUpload".equals(paramString)) || ("actC2CStreamPttDownload".equals(paramString)) || ("actC2CPttDownload".equals(paramString)) || ("actC2CPttUpload".equals(paramString)) || ("actFileDown".equals(paramString)) || ("actFileUp".equals(paramString)) || ("actFileOf2Of".equals(paramString)) || ("actFileOf2Wy".equals(paramString)) || ("actFileWy2Of".equals(paramString)) || ("actFileWyUp".equals(paramString)) || ("actFileWyDown".equals(paramString)) || ("actFileUpDetail".equals(paramString)) || ("actFileDownDetail".equals(paramString)) || ("actFAFileDown".equals(paramString)) || ("actFAFileUp".equals(paramString)) || ("actShortVideoUpload".equals(paramString)) || ("actShortVideoUploadBDH".equals(paramString)) || ("actShortVideoDiscussgroupUploadBDH".equals(paramString)) || ("actShortVideoForwardBDH".equals(paramString)) || ("actShortVideoDownloadVideo".equals(paramString)) || ("actShortVideoDownloadThumb".equals(paramString)) || ("actShortVideoDiscussgroupUpload".equals(paramString)) || ("actShortVideoDiscussgroupDownloadVideo".equals(paramString)) || ("actShortVideoDiscussgroupDownloadThumb".equals(paramString)) || ("PicStatisticsManagerUploadPic".equals(paramString))) {
      return true;
    }
    return false;
  }
  
  private static String b()
  {
    StringBuilder localStringBuilder = new StringBuilder("RAM Info:all=");
    DecimalFormat localDecimalFormat = new DecimalFormat();
    localDecimalFormat.applyPattern("0.0");
    try
    {
      long l1 = DeviceInfoUtil.c() / 1024L / 1024L;
      long l2 = DeviceInfoUtil.d() / 1024L / 1024L;
      Debug.MemoryInfo[] arrayOfMemoryInfo = ((ActivityManager)BaseApplicationImpl.getContext().getSystemService("activity")).getProcessMemoryInfo(new int[] { Process.myPid() });
      float f2 = -1.0F;
      float f1 = f2;
      if (arrayOfMemoryInfo != null)
      {
        f1 = f2;
        if (arrayOfMemoryInfo.length > 0) {
          f1 = arrayOfMemoryInfo[0].getTotalPss() / 1024.0F;
        }
      }
      f2 = (float)Runtime.getRuntime().freeMemory() / 1024.0F / 1024.0F;
      float f3 = (float)Runtime.getRuntime().totalMemory() / 1024.0F / 1024.0F;
      float f4 = (float)Runtime.getRuntime().maxMemory() / 1024.0F / 1024.0F;
      localStringBuilder.append(l1).append("M,avaiable:").append(l2).append("M used:").append(localDecimalFormat.format(f1)).append("M freeMemory:").append(f2).append("M,appTotalMemory:").append(f3).append("M,maxMemory:").append(f4).append("M");
    }
    catch (Throwable localThrowable)
    {
      for (;;) {}
    }
    return localStringBuilder.toString();
  }
  
  private void b(String paramString1, String paramString2)
  {
    if ((paramString1 == null) || (paramString2 == null)) {
      return;
    }
    jdField_a_of_type_JavaUtilHashMap.remove(paramString1);
    paramString2 = paramString2 + " time:" + System.currentTimeMillis() + "\n";
    jdField_a_of_type_JavaUtilHashMap.put(paramString1, paramString2);
  }
  
  public void a()
  {
    String str = DeviceProfileManager.b().a(DeviceProfileManager.DpcNames.crash_control.name(), null);
    if (!TextUtils.isEmpty(str)) {}
    try
    {
      Object localObject = new JSONObject(str);
      jdField_a_of_type_Rew.jdField_a_of_type_Boolean = ((JSONObject)localObject).getBoolean("control_switch");
      jdField_a_of_type_Rew.jdField_a_of_type_Int = ((JSONObject)localObject).getInt("control_level");
      jdField_a_of_type_Rew.b = ((JSONObject)localObject).getInt("control_window");
      jdField_a_of_type_Rew.c = ((JSONObject)localObject).getInt("control_freq");
      localObject = jdField_a_of_type_JavaLangStringBuilder.append("initCrashControl");
      ((StringBuilder)localObject).append(",controlJson=").append(str);
      ((StringBuilder)localObject).append(",switch=").append(jdField_a_of_type_Rew.jdField_a_of_type_Boolean);
      ((StringBuilder)localObject).append(",level=").append(jdField_a_of_type_Rew.jdField_a_of_type_Int);
      ((StringBuilder)localObject).append(",window=").append(jdField_a_of_type_Rew.b);
      ((StringBuilder)localObject).append(",Freq=").append(jdField_a_of_type_Rew.c);
      jdField_a_of_type_JavaLangStringBuilder.append("\n");
      return;
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        jdField_a_of_type_Rew.a();
        QLog.d("StatisticCollector", 1, "initCrashControl parse json throws an exception, so reset.");
      }
    }
  }
  
  public void a(Context paramContext)
  {
    if (paramContext != null)
    {
      paramContext = paramContext.toString();
      jdField_a_of_type_JavaUtilStack.push(paramContext);
      b("onCreate", paramContext);
    }
  }
  
  public void a(String paramString)
  {
    aU = paramString;
    try
    {
      UserAction.setUserID(paramString);
      CrashReport.setUserId(BaseApplication.getContext(), paramString);
      return;
    }
    catch (Exception paramString)
    {
      paramString.printStackTrace();
    }
  }
  
  public void a(String paramString1, String paramString2)
  {
    if ((paramString1 == null) || (paramString1.length() == 0) || (paramString2 == null) || (paramString2.length() == 0)) {}
    for (;;)
    {
      return;
      paramString1 = new rev(System.currentTimeMillis(), paramString1, paramString2);
      jdField_a_of_type_JavaUtilLinkedList.add(paramString1);
      int i1 = r;
      for (r = (jdField_a_of_type_Int + i1); (r > 15360L) && (jdField_a_of_type_JavaUtilLinkedList.size() > 1); r -= jdField_a_of_type_Int) {
        paramString1 = (rev)jdField_a_of_type_JavaUtilLinkedList.removeLast();
      }
    }
  }
  
  public void a(String paramString1, String paramString2, int paramInt, String paramString3)
  {
    for (;;)
    {
      String str1;
      HashMap localHashMap;
      Object localObject1;
      Object localObject2;
      try
      {
        str1 = String.valueOf(paramInt);
        localHashMap = new HashMap();
        localHashMap.put("resultCode", str1);
        localHashMap.put("patchId", paramString3);
        if (!TextUtils.isEmpty(paramString1)) {
          break label487;
        }
        localObject1 = BaseApplicationImpl.a().a();
        if (localObject1 == null) {
          break label481;
        }
        localObject1 = ((AppRuntime)localObject1).getAccount();
        paramString1 = (String)localObject1;
        if (TextUtils.isEmpty((CharSequence)localObject1))
        {
          localObject2 = BaseApplicationImpl.a().getFirstSimpleAccount();
          paramString1 = (String)localObject1;
          if (localObject2 != null) {
            paramString1 = ((SimpleAccount)localObject2).getUin();
          }
        }
        QLog.d("StatisticCollector", 1, "reportDexPatch curUin=" + paramString1 + ", event=" + paramString2 + ", result=" + paramInt + ", patchId=" + paramString3);
        if (paramInt % 100 != 0) {
          break label491;
        }
        bool = true;
        if (("actNvwaConfig".equals(paramString2)) || ("actNvwaDownload".equals(paramString2)))
        {
          a(paramString1, paramString2, bool, 0L, 0L, localHashMap, null);
          QLog.d("StatisticCollector", 1, "reportDexPatch collectPerformance " + paramString2);
          return;
        }
        localObject2 = jdField_a_of_type_AndroidContentContext.getSharedPreferences("sp_dex_patch", 4);
        paramString3 = paramString2 + paramString3;
        localObject1 = ((SharedPreferences)localObject2).getString(paramString3, "");
        localObject2 = ((SharedPreferences)localObject2).edit();
        if ("actNvwaCheck".equals(paramString2))
        {
          if (((String)localObject1).equals(str1)) {
            break label490;
          }
          a(paramString1, paramString2, bool, 0L, 0L, localHashMap, null);
          ((SharedPreferences.Editor)localObject2).putString(paramString3, str1).commit();
          QLog.d("StatisticCollector", 1, "reportDexPatch collectPerformance actNvwaCheck");
          return;
        }
      }
      catch (Throwable paramString1)
      {
        QLog.d("StatisticCollector", 1, "reportDexPatch throwable=" + paramString1.toString());
        paramString1.printStackTrace();
        return;
      }
      if ("actNvwaInstall".equals(paramString2))
      {
        String str2 = jdField_b_of_type_JavaTextSimpleDateFormat.format(new Date(System.currentTimeMillis()));
        str1 = str1 + str2;
        if ((!bool) || (TextUtils.isEmpty((CharSequence)localObject1)) || (!((String)localObject1).equals(str1)))
        {
          a(paramString1, paramString2, bool, 0L, 0L, localHashMap, null);
          ((SharedPreferences.Editor)localObject2).putString(paramString3, str1).commit();
          QLog.d("StatisticCollector", 1, "reportDexPatch collectPerformance actNvwaInstall");
          return;
          label481:
          localObject1 = paramString1;
          continue;
          label487:
          continue;
        }
      }
      label490:
      return;
      label491:
      boolean bool = false;
    }
  }
  
  public void a(String paramString1, String paramString2, boolean paramBoolean, long paramLong1, long paramLong2, HashMap paramHashMap, String paramString3)
  {
    a(paramString1, paramString2, paramBoolean, paramLong1, paramLong2, paramHashMap, paramString3, false);
  }
  
  public void a(String paramString1, String paramString2, boolean paramBoolean1, long paramLong1, long paramLong2, HashMap paramHashMap, String paramString3, boolean paramBoolean2)
  {
    if (paramString1 == null) {
      paramString1 = "10000";
    }
    for (;;)
    {
      paramString3 = paramString1;
      if (paramString1 != null)
      {
        paramString3 = paramString1;
        if (paramString1.length() < 1) {
          paramString3 = "10000";
        }
      }
      UserAction.setUserID(paramString3);
      if (paramHashMap == null)
      {
        paramString1 = new HashMap();
        if (paramString1 != null) {
          paramString1.put("param_ProductVersion", "" + AppSetting.jdField_a_of_type_Int);
        }
        if (QLog.isColorLevel()) {
          QLog.d("StatisticCollector", 2, "event report: " + paramString2 + " " + paramBoolean1 + " time:" + paramLong1 + " size:" + paramLong2);
        }
        if ((paramBoolean1) && ((!paramString1.containsKey("param_FailCode")) || ("".equals(paramString1.get("param_FailCode"))))) {
          paramString1.put("param_FailCode", String.valueOf(0));
        }
        paramHashMap = new RdmReq();
        eventName = paramString2;
        elapse = paramLong1;
        size = paramLong2;
        isSucceed = paramBoolean1;
        isRealTime = paramBoolean2;
        if (a(paramString2))
        {
          isMerge = false;
          isRealTime = true;
        }
        params = paramString1;
      }
      try
      {
        paramString1 = MsfMsgUtil.getRdmReportMsg(MsfServiceSdk.get().getMsfServiceName(), paramHashMap);
        paramString1.setAppId(AppSetting.jdField_a_of_type_Int);
        paramString1.setTimeout(30000L);
        ThreadManager.a(new reu(this, paramString1), 5, null, true);
        return;
      }
      catch (Exception paramString1)
      {
        return;
      }
      paramString3 = paramHashMap.keySet().iterator();
      for (;;)
      {
        paramString1 = paramHashMap;
        if (!paramString3.hasNext()) {
          break;
        }
        paramString1 = (String)paramString3.next();
        if ((String)paramHashMap.get(paramString1) == null) {
          paramHashMap.put(paramString1, "");
        }
      }
    }
  }
  
  public void a(String paramString, boolean paramBoolean)
  {
    if (paramString == null) {}
    SharedPreferences localSharedPreferences;
    do
    {
      return;
      localSharedPreferences = jdField_a_of_type_AndroidContentContext.getSharedPreferences("mobileQQ", 0);
      if (jdField_c_of_type_Long == 0L) {
        jdField_c_of_type_Long = localSharedPreferences.getLong("Statistics_time_" + paramString, System.currentTimeMillis());
      }
    } while (g == paramBoolean);
    g = paramBoolean;
    long l1;
    long l2;
    long l3;
    if (jdField_c_of_type_Long > 0L)
    {
      l1 = System.currentTimeMillis() - jdField_c_of_type_Long;
      l2 = localSharedPreferences.getLong("fg_duration_" + paramString, 0L);
      l3 = localSharedPreferences.getLong("bg_duration_" + paramString, 0L);
      if (!paramBoolean) {
        break label315;
      }
      l3 = l2 + l1;
      if (QLog.isColorLevel()) {
        QLog.d("StatisticCollector", 2, "uin:" + paramString + " save fg: " + l3 + " fs:" + l2 + " spend:" + l1);
      }
      localSharedPreferences.edit().putLong("fg_duration_" + paramString, l3).commit();
    }
    for (;;)
    {
      jdField_c_of_type_Long = System.currentTimeMillis();
      localSharedPreferences.edit().putLong("Statistics_time_" + paramString, jdField_c_of_type_Long).commit();
      return;
      label315:
      l2 = l3 + l1;
      localSharedPreferences.edit().putLong("bg_duration_" + paramString, l2).commit();
      if (QLog.isColorLevel()) {
        QLog.d("StatisticCollector", 2, "save _--bg--_: " + l2 + " bs:" + l3 + " spend:" + l1);
      }
    }
  }
  
  public void a(AppRuntime paramAppRuntime)
  {
    if (f) {}
    long l1;
    long l2;
    do
    {
      do
      {
        return;
      } while ((paramAppRuntime == null) || (!paramAppRuntime.isLogin()));
      localObject = jdField_a_of_type_AndroidContentContext.getSharedPreferences("mobileQQ", 0);
      l1 = ((SharedPreferences)localObject).getLong("next_reportTime_" + paramAppRuntime.getAccount(), 0L);
      l2 = (NetConnInfoCenter.getServerTimeMillis() + 28800000L) / 86400000L;
    } while (l2 < l1);
    f = true;
    ((SharedPreferences)localObject).edit().putLong("next_reportTime_" + paramAppRuntime.getAccount(), 1L + l2).commit();
    Object localObject = new NewIntent(paramAppRuntime.getApplication(), ReportServlet.class);
    ((NewIntent)localObject).putExtra("sendType", 2);
    ((NewIntent)localObject).putExtra("tag", "mqq_dailyUse");
    ((NewIntent)localObject).putExtra("content", "");
    paramAppRuntime.startServlet((NewIntent)localObject);
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, "Report Daily Use,Next Report Day:" + l2 + 1);
    }
    f = false;
  }
  
  public void a(AppRuntime paramAppRuntime, String paramString)
  {
    if ((paramAppRuntime == null) || (paramString == null)) {}
    do
    {
      return;
      paramString = a(paramString);
    } while (paramString == null);
    paramString = paramString + '|';
    paramString = paramString + "1|";
    NewIntent localNewIntent = new NewIntent(paramAppRuntime.getApplication(), ReportServlet.class);
    localNewIntent.putExtra("sendType", 2);
    localNewIntent.putExtra("tag", "AndroidQQUseApp");
    localNewIntent.putExtra("content", paramString);
    paramAppRuntime.startServlet(localNewIntent);
  }
  
  public void a(AppRuntime paramAppRuntime, String paramString, int paramInt)
  {
    if ((paramAppRuntime == null) || (paramString == null)) {
      return;
    }
    a(paramAppRuntime, paramString, paramInt, "", "", "");
  }
  
  public void a(AppRuntime paramAppRuntime, String paramString1, int paramInt, String paramString2, String paramString3, String paramString4)
  {
    if ((paramAppRuntime == null) || (paramString1 == null)) {}
    do
    {
      return;
      paramString1 = paramString1 + "|" + paramString2 + "|" + paramString3 + "|" + paramInt + "|" + paramString4;
      paramString2 = new NewIntent(paramAppRuntime.getApplication(), ReportServlet.class);
      paramString2.putExtra("sendType", 2);
      paramString2.putExtra("tag", "appPlug");
      paramString2.putExtra("content", paramString1);
      paramAppRuntime.startServlet(paramString2);
    } while (!QLog.isColorLevel());
    QLog.d("reportToAds", 2, paramString1);
  }
  
  public void a(AppRuntime paramAppRuntime, String paramString1, String paramString2)
  {
    if ((paramAppRuntime == null) || (paramString1 == null)) {
      return;
    }
    a(paramAppRuntime, paramString1, 1, "", "", paramString2);
  }
  
  @Deprecated
  public void a(AppRuntime paramAppRuntime, String paramString1, String paramString2, int paramInt)
  {
    if ((paramAppRuntime == null) || (paramString1 == null) || (paramString2 == null)) {
      return;
    }
    paramString1 = paramString2 + "|" + paramInt;
    paramString2 = new NewIntent(paramAppRuntime.getApplication(), ReportServlet.class);
    paramString2.putExtra("sendType", 2);
    paramString2.putExtra("tag", "mqq_tab");
    paramString2.putExtra("content", paramString1);
    paramAppRuntime.startServlet(paramString2);
  }
  
  @Deprecated
  public void a(AppRuntime paramAppRuntime, String paramString1, String paramString2, String paramString3)
  {
    if ((paramAppRuntime == null) || (paramString1 == null) || (paramString2 == null)) {
      return;
    }
    paramString1 = paramString2 + "|" + paramString3;
    paramString2 = new NewIntent(paramAppRuntime.getApplication(), ReportServlet.class);
    paramString2.putExtra("sendType", 2);
    paramString2.putExtra("tag", "mqq_tab");
    paramString2.putExtra("content", paramString1);
    paramAppRuntime.startServlet(paramString2);
  }
  
  @Deprecated
  public void a(AppRuntime paramAppRuntime, String paramString1, String paramString2, String paramString3, int paramInt1, int paramInt2, String paramString4, String paramString5, String paramString6, String paramString7, String paramString8)
  {
    if ((paramAppRuntime == null) || (paramString1 == null) || (paramString2 == null) || (paramString3 == null)) {
      return;
    }
    String str = paramString4;
    if (paramString4 == null) {
      str = "0";
    }
    paramString4 = paramString5;
    if (paramString5 == null) {
      paramString4 = "";
    }
    paramString5 = paramString6;
    if (paramString6 == null) {
      paramString5 = "";
    }
    paramString6 = paramString7;
    if (paramString7 == null) {
      paramString6 = "";
    }
    paramString7 = paramString8;
    if (paramString8 == null) {
      paramString7 = "";
    }
    paramString8 = new StringBuilder(128);
    paramString8.append(paramAppRuntime.getAccount()).append('|').append(paramString1).append('|').append(paramString2).append('|').append(paramString3).append('|').append(paramInt1).append('|').append(paramInt2).append('|').append(str).append('|').append(paramString4).append('|').append(paramString5).append('|').append(paramString6).append('|').append(paramString7).append('|');
    paramString1 = new NewIntent(paramAppRuntime.getApplication(), ReportServlet.class);
    paramString1.putExtra("sendType", 2);
    paramString1.putExtra("tag", "CliOper");
    paramString1.putExtra("content", paramString8.toString());
    paramAppRuntime.startServlet(paramString1);
  }
  
  @Deprecated
  public void a(AppRuntime paramAppRuntime, String paramString1, String paramString2, String paramString3, String paramString4, int paramInt1, int paramInt2, int paramInt3)
  {
    if ((paramAppRuntime == null) || (paramString1 == null) || (paramString3 == null) || (paramString4 == null)) {}
    StringBuilder localStringBuilder;
    do
    {
      return;
      localStringBuilder = new StringBuilder(128);
      localStringBuilder.append(paramString1).append('|').append(paramString2).append('|').append(paramString3).append('|').append(paramString4).append('|').append(paramInt1).append('|').append(paramInt2).append('|').append(paramInt3);
      localStringBuilder.append('|').append('|').append('|').append('|').append('|');
      paramString1 = new NewIntent(paramAppRuntime.getApplication(), ReportServlet.class);
      paramString1.putExtra("sendType", 2);
      paramString1.putExtra("tag", "CliOper");
      paramString1.putExtra("content", localStringBuilder.toString());
      paramAppRuntime.startServlet(paramString1);
    } while (!QLog.isColorLevel());
    QLog.d("StatisticCollector", 2, "tag=CliOper,content=" + localStringBuilder.toString());
  }
  
  @Deprecated
  public void a(AppRuntime paramAppRuntime, String paramString1, String paramString2, String paramString3, String paramString4, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if ((paramAppRuntime == null) || (paramString1 == null) || (paramString3 == null) || (paramString4 == null)) {}
    StringBuilder localStringBuilder;
    do
    {
      return;
      localStringBuilder = new StringBuilder(128);
      localStringBuilder.append(paramString1).append('|').append(paramString2).append('|').append(paramString3).append('|').append(paramString4).append('|').append(paramInt1).append('|').append(paramInt2).append('|').append(paramInt3).append('|').append(paramInt4).append('|').append('|').append('|').append('|');
      paramString1 = new NewIntent(paramAppRuntime.getApplication(), ReportServlet.class);
      paramString1.putExtra("sendType", 2);
      paramString1.putExtra("tag", "CliOper");
      paramString1.putExtra("content", localStringBuilder.toString());
      paramAppRuntime.startServlet(paramString1);
    } while (!QLog.isColorLevel());
    QLog.d("StatisticCollector", 2, "tag=CliOper,content=" + localStringBuilder.toString());
  }
  
  @Deprecated
  public void a(AppRuntime paramAppRuntime, String paramString1, String paramString2, String paramString3, String paramString4, int paramInt1, int paramInt2, int paramInt3, String paramString5, String paramString6, String paramString7, String paramString8)
  {
    if ((paramAppRuntime == null) || (paramString1 == null) || (paramString3 == null) || (paramString4 == null)) {
      return;
    }
    String str = paramString5;
    if (paramString5 == null) {
      str = "";
    }
    paramString5 = paramString6;
    if (paramString6 == null) {
      paramString5 = "";
    }
    paramString6 = paramString7;
    if (paramString7 == null) {
      paramString6 = "";
    }
    paramString7 = paramString8;
    if (paramString8 == null) {
      paramString7 = "";
    }
    paramString8 = new StringBuilder(128);
    paramString8.append(paramString1).append('|').append(paramString2).append('|').append(paramString3).append('|').append(paramString4).append('|').append(paramInt1).append('|').append(paramInt2).append('|').append(paramInt3).append('|').append(str).append('|').append(paramString5).append('|').append(paramString6).append('|').append(paramString7).append('|');
    paramString1 = new NewIntent(paramAppRuntime.getApplication(), ReportServlet.class);
    paramString1.putExtra("sendType", 2);
    paramString1.putExtra("tag", "CliOper");
    paramString1.putExtra("content", paramString8.toString());
    paramAppRuntime.startServlet(paramString1);
  }
  
  @Deprecated
  public void a(AppRuntime paramAppRuntime, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, int paramInt1, int paramInt2, int paramInt3)
  {
    if ((paramAppRuntime == null) || (paramString1 == null) || (paramString4 == null) || (paramString5 == null)) {}
    StringBuilder localStringBuilder;
    do
    {
      return;
      localStringBuilder = new StringBuilder(128);
      localStringBuilder.append(paramString3).append('|').append(paramString1).append('|').append("").append('|').append(paramString4).append('|').append(paramString5).append('|').append(paramInt1).append('|').append(paramInt2).append('|').append(paramInt3);
      localStringBuilder.append('|').append(paramString2).append('|').append('|').append('|').append('|');
      paramString1 = new NewIntent(paramAppRuntime.getApplication(), ReportServlet.class);
      paramString1.putExtra("sendType", 2);
      paramString1.putExtra("tag", "P_CliOper");
      paramString1.putExtra("content", localStringBuilder.toString());
      paramAppRuntime.startServlet(paramString1);
    } while (!QLog.isColorLevel());
    QLog.d("StatisticCollector", 2, "tag=P_CliOper,content=" + localStringBuilder.toString());
  }
  
  @Deprecated
  public void a(AppRuntime paramAppRuntime, String paramString, Map paramMap)
  {
    if ((paramAppRuntime == null) || (paramString == null) || (paramMap == null)) {
      return;
    }
    StringBuilder localStringBuilder = new StringBuilder(128);
    Object localObject = paramMap.keySet();
    paramString = new ArrayList(paramMap.size());
    localObject = ((Set)localObject).iterator();
    while (((Iterator)localObject).hasNext())
    {
      String str = (String)((Iterator)localObject).next();
      localStringBuilder.append(str).append("|").append(paramMap.get(str)).append("|");
      paramString.add(localStringBuilder.toString());
      localStringBuilder.delete(0, localStringBuilder.length());
    }
    paramMap = new NewIntent(paramAppRuntime.getApplication(), ReportServlet.class);
    paramMap.putExtra("sendType", 6);
    paramMap.putExtra("tag", "custom_set");
    paramMap.putExtra("content", paramString);
    paramAppRuntime.startServlet(paramMap);
  }
  
  public void b()
  {
    if (!jdField_a_of_type_Rew.jdField_a_of_type_Boolean) {
      QLog.d("StatisticCollector", 1, "updateLocalCrashData crash control is off..");
    }
    Object localObject;
    do
    {
      return;
      localObject = astartComponentInfo;
      if ((jdField_a_of_type_Rew.jdField_a_of_type_Int == 2) && ((TextUtils.isEmpty((CharSequence)localObject)) || (!((String)localObject).contains("QQBroadcastReceiver"))))
      {
        QLog.d("StatisticCollector", 1, "updateLocalCrashData controllevel is 2 but not QQBroadcastReceiver start QQ.");
        return;
      }
      localObject = jdField_a_of_type_AndroidContentContext.getSharedPreferences("crashcontrol", 0);
    } while (localObject == null);
    long l1 = ((SharedPreferences)localObject).getLong("starttime", 0L);
    int i1 = ((SharedPreferences)localObject).getInt("crashcount", 0);
    long l2 = System.currentTimeMillis();
    jdField_a_of_type_JavaLangStringBuilder.append("updateLocalCrashData startTime=").append(jdField_a_of_type_JavaTextSimpleDateFormat.format(new Date(l1))).append(",currenttime=").append(jdField_a_of_type_JavaTextSimpleDateFormat.format(new Date(l2))).append(",crashCount=").append(i1).append(",mCurUin=").append(aU).append("\n");
    if ((l1 <= 0L) || (l2 <= l1) || (i1 < 0) || (l2 - l1 > jdField_a_of_type_Rew.b * 1000))
    {
      i1 = 1;
      l1 = l2;
    }
    for (;;)
    {
      if (i1 > jdField_a_of_type_Rew.c) {
        jdField_a_of_type_Boolean = true;
      }
      jdField_a_of_type_JavaLangStringBuilder.append("updateLocalCrashData shouldStopMsf=").append(jdField_a_of_type_Boolean).append("\n");
      ((SharedPreferences)localObject).edit().putLong("starttime", l1).putInt("crashcount", i1).putBoolean("shouldStopMsf", jdField_a_of_type_Boolean).commit();
      return;
      i1 += 1;
    }
  }
  
  public void b(Context paramContext)
  {
    if (paramContext != null) {
      b("onResume", paramContext.toString());
    }
  }
  
  public void b(String paramString)
  {
    boolean bool1 = true;
    if (!jdField_a_of_type_Rew.jdField_a_of_type_Boolean) {
      QLog.d("StatisticCollector", 1, "updatePreloadCrashData crash control is off..");
    }
    SharedPreferences localSharedPreferences;
    do
    {
      return;
      localSharedPreferences = jdField_a_of_type_AndroidContentContext.getSharedPreferences("CrashControl_" + paramString, 4);
    } while (localSharedPreferences == null);
    long l1 = localSharedPreferences.getLong("starttime", 0L);
    int i1 = localSharedPreferences.getInt("crashcount", 0);
    boolean bool2 = localSharedPreferences.getBoolean("allowpreload", true);
    long l2 = System.currentTimeMillis();
    jdField_a_of_type_JavaLangStringBuilder.append("updatePreloadCrashData process=").append(paramString).append(",startTime=").append(jdField_a_of_type_JavaTextSimpleDateFormat.format(new Date(l1))).append(",currenttime=").append(jdField_a_of_type_JavaTextSimpleDateFormat.format(new Date(l2))).append(",crashCount=").append(i1).append(",allowPreload=").append(bool2).append(",mCurUin=").append(aU).append("\n");
    if ((l1 <= 0L) || (l2 <= l1) || (i1 < 0) || (l2 - l1 > jdField_a_of_type_Rew.b * 1000))
    {
      i1 = 1;
      l1 = l2;
    }
    for (;;)
    {
      if (i1 > jdField_a_of_type_Rew.c) {
        bool1 = false;
      }
      jdField_a_of_type_JavaLangStringBuilder.append("updatePreloadCrashData update allowPreload=").append(bool1).append("\n");
      localSharedPreferences.edit().putLong("starttime", l1).putInt("crashcount", i1).putBoolean("allowpreload", bool1).putInt("controlwindow", jdField_a_of_type_Rew.b).commit();
      return;
      i1 += 1;
    }
  }
  
  public void b(AppRuntime paramAppRuntime, String paramString)
  {
    if ((paramAppRuntime == null) || (paramString == null)) {}
    String str;
    label445:
    do
    {
      return;
      SharedPreferences localSharedPreferences = jdField_a_of_type_AndroidContentContext.getSharedPreferences("mobileQQ", 0);
      long l2 = localSharedPreferences.getLong("fg_duration_" + paramString, 0L);
      long l1 = localSharedPreferences.getLong("bg_duration_" + paramString, 0L);
      long l3 = localSharedPreferences.getLong("Statistics_time_" + paramString, System.currentTimeMillis());
      if (QLog.isColorLevel()) {
        QLog.d("StatisticCollector", 2, "uin:+ " + paramString + " llll:" + l3);
      }
      l3 = System.currentTimeMillis() - l3;
      if (!g) {
        l2 += l3;
      }
      for (;;)
      {
        jdField_c_of_type_Long = System.currentTimeMillis();
        localSharedPreferences.edit().putLong("Statistics_time_" + paramString, jdField_c_of_type_Long).commit();
        str = l2 / 1000L + "|";
        str = str + l1 / 1000L + "|";
        localSharedPreferences.edit().putLong("fg_duration_" + paramString, 0L).commit();
        localSharedPreferences.edit().putLong("bg_duration_" + paramString, 0L).commit();
        if ((l2 >= 0L) && (l2 <= 86400000L) && (l1 >= 0L) && (l1 <= 86400000L) && (l1 + l2 <= 86400000L)) {
          break label445;
        }
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("StatisticCollector", 2, "**************cancel report mQQ runingtime:" + str);
        return;
        l1 += l3;
      }
      paramString = new NewIntent(paramAppRuntime.getApplication(), ReportServlet.class);
      paramString.putExtra("sendType", 2);
      paramString.putExtra("tag", "AndroidQQRunTime");
      paramString.putExtra("content", str);
      paramAppRuntime.startServlet(paramString);
    } while (!QLog.isColorLevel());
    QLog.d("StatisticCollector", 2, "report mQQ runingtime:" + str);
  }
  
  public void b(AppRuntime paramAppRuntime, String paramString1, String paramString2, int paramInt)
  {
    a(paramAppRuntime, paramString2, paramInt);
  }
  
  @Deprecated
  public void b(AppRuntime paramAppRuntime, String paramString, Map paramMap)
  {
    if ((paramAppRuntime == null) || (paramString == null) || (paramMap == null)) {
      return;
    }
    StringBuilder localStringBuilder = new StringBuilder(128);
    Object localObject = paramMap.keySet();
    paramString = new ArrayList(paramMap.size());
    localObject = ((Set)localObject).iterator();
    while (((Iterator)localObject).hasNext())
    {
      String str = (String)((Iterator)localObject).next();
      localStringBuilder.append(str).append("|").append(paramMap.get(str)).append("|");
      paramString.add(localStringBuilder.toString());
      localStringBuilder.delete(0, localStringBuilder.length());
    }
    paramMap = new NewIntent(paramAppRuntime.getApplication(), ReportServlet.class);
    paramMap.putExtra("sendType", 6);
    paramMap.putExtra("tag", "on_off");
    paramMap.putExtra("content", paramString);
    paramAppRuntime.startServlet(paramMap);
  }
  
  public void c(Context paramContext)
  {
    if (paramContext != null) {
      b("onPause", paramContext.toString());
    }
  }
  
  public void c(String paramString)
  {
    aU = paramString;
    CrashReport.setLogAble(false, false);
    Object localObject1 = new CrashStrategyBean();
    ((CrashStrategyBean)localObject1).setMaxStackFrame(6);
    ((CrashStrategyBean)localObject1).setMaxStackLine(400);
    QLog.d("StatisticCollector", 1, "initCrashReport ... process:" + BaseApplicationImpl.processName + " pid=" + Process.myPid());
    if (BaseApplicationImpl.processName.endsWith(":qzone"))
    {
      int i1 = a();
      if (i1 > 0)
      {
        Object localObject2 = BaseApplicationImpl.a().a();
        if (localObject2 != null)
        {
          localObject2 = ((AppRuntime)localObject2).getApplication();
          if (localObject2 != null)
          {
            localObject2 = ((Context)localObject2).getPackageManager().getPackageInfo(((Context)localObject2).getPackageName(), 0);
            if ((localObject2 != null) && (versionName != null))
            {
              localObject2 = versionName + "." + (i1 + versionCode);
              CrashReport.setProductVersion(BaseApplicationImpl.a(), (String)localObject2);
            }
          }
        }
      }
    }
    CrashReport.initCrashReport(BaseApplication.getContext(), new rep(this), null, true, (CrashStrategyBean)localObject1, 30000L);
    if (jdField_c_of_type_Boolean) {
      NativeExceptionUpload.setNativeLogMode(3);
    }
    for (;;)
    {
      localObject1 = BaseApplication.getContext().getDir("tombs", 0).getAbsolutePath();
      try
      {
        QLog.d("StatisticCollector", 1, "initNativeCrashReport ... process:" + BaseApplicationImpl.processName + " pid=" + Process.myPid());
        CrashReport.initNativeCrashReport(BaseApplication.getContext(), (String)localObject1, false);
        CrashReport.setUserId(BaseApplication.getContext(), paramString);
        jdField_b_of_type_JavaLangStringBuilder.append("Current process name=").append(BaseApplicationImpl.processName).append("\n");
        if (BaseApplicationImpl.processName.equals("com.tencent.mobileqq")) {
          ThreadManager.b().postDelayed(new req(this, paramString), 3000L);
        }
        ThreadManager.a().post(new rer(this));
        return;
        NativeExceptionUpload.setNativeLogMode(6);
      }
      catch (UnsatisfiedLinkError localUnsatisfiedLinkError)
      {
        for (;;)
        {
          if (QLog.isColorLevel()) {
            QLog.e("StatisticCollector", 2, "", localUnsatisfiedLinkError);
          }
        }
      }
    }
  }
  
  @Deprecated
  public void c(AppRuntime paramAppRuntime, String paramString)
  {
    NewIntent localNewIntent = new NewIntent(paramAppRuntime.getApplication(), ReportServlet.class);
    localNewIntent.putExtra("sendType", 2);
    localNewIntent.putExtra("tag", "MsgOper");
    localNewIntent.putExtra("content", paramString);
    paramAppRuntime.startServlet(localNewIntent);
    if (QLog.isColorLevel()) {
      QLog.d("StatisticCollector", 2, "tag=MsgOper,content=" + paramString);
    }
  }
  
  public void d(Context paramContext)
  {
    if (paramContext != null)
    {
      paramContext = paramContext.toString();
      jdField_a_of_type_JavaUtilStack.remove(paramContext);
      b("onDestroy", paramContext);
    }
  }
  
  public void d(String paramString)
  {
    Map localMap = a();
    if ((paramString == null) || (localMap == null)) {
      return;
    }
    Iterator localIterator = localMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      if ((String)localMap.get(str) == null) {
        localMap.put(str, "");
      }
    }
    UserAction.setUserID(paramString);
    if (QLog.isColorLevel()) {
      QLog.d("StatisticCollector", 2, "report End_Info:" + localMap.toString());
    }
    paramString = new RdmReq();
    eventName = "End_Info";
    elapse = -1L;
    size = 0L;
    isSucceed = true;
    isRealTime = true;
    isMerge = false;
    params = localMap;
    try
    {
      paramString = MsfMsgUtil.getRdmReportMsg(MsfServiceSdk.get().getMsfServiceName(), paramString);
      paramString.setAppId(AppSetting.jdField_a_of_type_Int);
      paramString.setTimeout(30000L);
      MsfServiceSdk.get().sendMsg(paramString);
      return;
    }
    catch (Exception paramString)
    {
      paramString.printStackTrace();
    }
  }
  
  @Deprecated
  public void d(AppRuntime paramAppRuntime, String paramString)
  {
    NewIntent localNewIntent = new NewIntent(paramAppRuntime.getApplication(), ReportServlet.class);
    localNewIntent.putExtra("sendType", 2);
    localNewIntent.putExtra("tag", "P_CliOper");
    localNewIntent.putExtra("content", paramString);
    paramAppRuntime.startServlet(localNewIntent);
    if (QLog.isColorLevel()) {
      QLog.d("StatisticCollector", 2, "tag=P_CliOper,content=" + paramString);
    }
  }
  
  public void e(String paramString)
  {
    if (paramString == null) {}
    long l1;
    long l2;
    long l3;
    do
    {
      return;
      SharedPreferences localSharedPreferences = jdField_a_of_type_AndroidContentContext.getSharedPreferences("mobileQQ", 0);
      if (jdField_c_of_type_Long == 0L) {
        jdField_c_of_type_Long = localSharedPreferences.getLong("Statistics_time_" + paramString, System.currentTimeMillis());
      }
      l1 = System.currentTimeMillis() - jdField_c_of_type_Long;
      if (!g)
      {
        l2 = localSharedPreferences.getLong("fg_duration_" + paramString, 0L);
        l3 = l2 + l1;
        if (QLog.isColorLevel()) {
          QLog.d("StatisticCollector", 2, "save fg: " + l3 + " fs:" + l2 + " spend:" + l1);
        }
        localSharedPreferences.edit().putLong("fg_duration_" + paramString, l3).commit();
        return;
      }
      l2 = localSharedPreferences.getLong("bg_duration_" + paramString, 0L);
      l3 = l2 + l1;
      localSharedPreferences.edit().putLong("bg_duration_" + paramString, l3).commit();
    } while (!QLog.isColorLevel());
    QLog.d("StatisticCollector", 2, "save _--bg--_: " + l3 + " bs:" + l2 + " spend:" + l1);
  }
  
  public void e(AppRuntime paramAppRuntime, String paramString)
  {
    if ((paramAppRuntime == null) || (paramString == null)) {
      return;
    }
    a(paramAppRuntime, paramString, 1, "", "", "");
  }
  
  public void f(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("StatisticCollector", 2, "uin:" + paramString + "  cc:" + System.currentTimeMillis());
    }
    jdField_a_of_type_AndroidContentContext.getSharedPreferences("mobileQQ", 0).edit().putLong("Statistics_time_" + paramString, System.currentTimeMillis()).commit();
  }
}
