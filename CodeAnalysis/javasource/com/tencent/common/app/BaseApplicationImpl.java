package com.tencent.common.app;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v4.util.MQLruCache;
import android.text.TextUtils;
import android.text.format.Time;
import android.util.DisplayMetrics;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.JumpActivity;
import com.tencent.mobileqq.app.FontSettingManager;
import com.tencent.mobileqq.app.InjectUtils;
import com.tencent.mobileqq.app.SystemClassLoaderInjector;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.cooperation.ApkUtils;
import com.tencent.mobileqq.startup.director.StartupDirector;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.statistics.UEC;
import com.tencent.mqq.shared_file_accessor.SharedPreferencesProxyManager;
import com.tencent.qphone.base.util.MD5;
import com.tencent.qphone.base.util.QLog;
import cooperation.qzone.util.PerfTracer;
import hcr;
import hcs;
import hct;
import hcu;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import mqq.app.AppActivity;
import mqq.app.AppRuntime;
import mqq.app.MobileQQ;
import mqq.os.MqqHandler;
import mqq.util.WeakReference;

public class BaseApplicationImpl
  extends MobileQQ
{
  public static int a = 0;
  public static long a = 0L;
  public static MQLruCache a;
  public static BaseApplicationImpl a;
  public static StartupDirector a;
  public static String a;
  public static MqqHandler a;
  public static boolean a = false;
  public static final int b = -1;
  public static long b = 0L;
  public static String b;
  public static boolean b = false;
  public static final int c = 1;
  public static long c = 0L;
  public static String c;
  public static boolean c = false;
  public static final int d = 2;
  private static final long d = 10000L;
  public static String d;
  public static boolean d = false;
  public static final int e = 3;
  public static final String e = "com.tencent.mobileqq.broadcast.qq";
  public static boolean e = true;
  public static final int f = 4;
  public static final String f = "com.tencent.process.exit";
  public static final int g = 5;
  public static final String g = "hotpatch";
  public static final int h = 6;
  public static final String h = "/data/data/com.tencent.mobileqq/files/hotpatch/";
  public static int i = 0;
  public static final String i = "sp_dex_patch";
  public static final int j = 5;
  public static String j;
  private static final int k = 3;
  public static String k;
  private static final String l = "BaseApplicationImpl";
  private Intent a;
  private String m = null;
  private String n = null;
  private String o = null;
  private String p = null;
  
  static
  {
    jdField_a_of_type_JavaLangString = "";
    jdField_b_of_type_JavaLangString = "";
    jdField_c_of_type_JavaLangString = "";
    jdField_d_of_type_JavaLangString = "";
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_Long = 0L;
    jdField_b_of_type_Long = 0L;
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Long = 0L;
    jdField_c_of_type_Boolean = false;
    jdField_d_of_type_Boolean = false;
    i = -1;
    j = "";
    k = "";
  }
  
  public BaseApplicationImpl()
  {
    jdField_a_of_type_AndroidContentIntent = null;
  }
  
  public static BaseApplicationImpl a()
  {
    return jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl;
  }
  
  public static String a(ArrayList paramArrayList, boolean paramBoolean)
  {
    Time localTime = new Time();
    localTime.setToNow();
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("com.tencent.process.exit");
    localStringBuilder.append(year).append(month + 1).append(monthDay);
    localStringBuilder.append(hour);
    int i1;
    if (paramBoolean)
    {
      i1 = minute - 1;
      localStringBuilder.append(i1);
      if (paramArrayList != null) {
        break label140;
      }
    }
    label140:
    for (paramArrayList = "null";; paramArrayList = paramArrayList.toString())
    {
      localStringBuilder.append(paramArrayList);
      paramArrayList = MD5.toMD5(localStringBuilder.toString());
      return MD5.toMD5(paramArrayList + localStringBuilder.toString());
      i1 = minute;
      break;
    }
  }
  
  private void a(Context paramContext)
  {
    long l1 = System.currentTimeMillis();
    try
    {
      paramContext = InjectUtils.a(this, paramContext);
      QLog.d("BaseApplicationImpl", 1, processName + ", injectHackDex=" + paramContext + ", cost=" + (System.currentTimeMillis() - l1) + " ms.");
      return;
    }
    catch (Throwable paramContext)
    {
      QLog.d("BaseApplicationImpl", 1, "injectHackDex throwable=" + paramContext.toString());
      paramContext.printStackTrace();
    }
  }
  
  private void a(Context paramContext, boolean paramBoolean, int paramInt1, int paramInt2)
  {
    paramContext = new hcs(this, paramContext, paramInt1, paramInt2);
    if (paramBoolean)
    {
      ThreadManager.a(paramContext, 5, null, true);
      return;
    }
    paramContext.run();
  }
  
  private void a(Context paramContext, boolean paramBoolean, int paramInt, String paramString)
  {
    paramContext = new hct(this, paramContext, paramInt, paramString);
    if (paramBoolean)
    {
      ThreadManager.b().postDelayed(paramContext, 10000L);
      return;
    }
    paramContext.run();
  }
  
  public Intent a()
  {
    if ((m != null) && (n != null) && (o != null) && (p != null))
    {
      jdField_a_of_type_AndroidContentIntent = new Intent("mqq.intent.action.PCACTIVE_TIPS");
      jdField_a_of_type_AndroidContentIntent.putExtra("Message", n);
      jdField_a_of_type_AndroidContentIntent.putExtra("uin", m);
      jdField_a_of_type_AndroidContentIntent.putExtra("lButton", o);
      jdField_a_of_type_AndroidContentIntent.putExtra("rButton", p);
      jdField_a_of_type_AndroidContentIntent.addFlags(268435456);
      return jdField_a_of_type_AndroidContentIntent;
    }
    return null;
  }
  
  public String a()
  {
    return m;
  }
  
  public AppRuntime a()
  {
    return waitAppRuntime(null);
  }
  
  public void a()
  {
    super.onCreate();
  }
  
  public void a(Context paramContext, boolean paramBoolean)
  {
    int i1 = 0;
    long l1 = System.currentTimeMillis();
    SharedPreferences localSharedPreferences;
    try
    {
      localSharedPreferences = paramContext.getSharedPreferences("sp_dex_patch", 4);
      boolean bool1 = localSharedPreferences.getBoolean("enable", false);
      QLog.d("BaseApplicationImpl", 1, "injectPatchDex enable=" + bool1 + ", isStartup=" + paramBoolean);
      if (!bool1) {
        break label797;
      }
      localObject1 = localSharedPreferences.getString("process", "");
      boolean bool2 = TextUtils.isEmpty((CharSequence)localObject1);
      if (!bool2)
      {
        localObject1 = ((String)localObject1).split(";");
        i2 = localObject1.length;
        bool1 = bool2;
        if (i1 < i2)
        {
          localObject2 = localObject1[i1];
          if (!processName.equals(localObject2)) {
            break label798;
          }
          bool1 = true;
        }
        if (!bool1)
        {
          QLog.d("BaseApplicationImpl", 1, "injectPatchDex process not match.");
          return;
        }
      }
      if (!"201932".equals(localSharedPreferences.getString("revision", "")))
      {
        QLog.d("BaseApplicationImpl", 1, "injectPatchDex revision not match.");
        return;
      }
    }
    catch (Throwable paramContext)
    {
      QLog.d("BaseApplicationImpl", 1, "injectPatchDex throwable=" + paramContext.toString());
      paramContext.printStackTrace();
      return;
    }
    Object localObject1 = localSharedPreferences.getString("appVersion", "");
    if ((TextUtils.isEmpty((CharSequence)localObject1)) || (!((String)localObject1).equals(ApkUtils.a(paramContext) + "." + ApkUtils.a(paramContext))))
    {
      QLog.d("BaseApplicationImpl", 1, "injectPatchDex app version not match.");
      return;
    }
    localObject1 = localSharedPreferences.getString("sysVersion", "");
    if ((!TextUtils.isEmpty((CharSequence)localObject1)) && (!((String)localObject1).contains(String.valueOf(Build.VERSION.SDK_INT))))
    {
      QLog.d("BaseApplicationImpl", 1, "injectPatchDex system version not match.");
      return;
    }
    localObject1 = localSharedPreferences.getString("deviceInfo", "");
    if ((!TextUtils.isEmpty((CharSequence)localObject1)) && ((!((String)localObject1).contains(Build.BRAND)) || (!((String)localObject1).contains(Build.MODEL))))
    {
      QLog.d("BaseApplicationImpl", 1, "injectPatchDex device not match.");
      return;
    }
    localObject1 = localSharedPreferences.getString("name", "");
    if (TextUtils.isEmpty((CharSequence)localObject1))
    {
      QLog.d("BaseApplicationImpl", 1, "injectPatchDex patch name is empty.");
      return;
    }
    Object localObject2 = "/data/data/com.tencent.mobileqq/files/hotpatch/" + (String)localObject1;
    Object localObject3 = new File((String)localObject2);
    if ((localObject3 == null) || (!((File)localObject3).exists()))
    {
      QLog.d("BaseApplicationImpl", 1, "injectPatchDex patch file not exist.");
      return;
    }
    long l2 = localSharedPreferences.getLong("size", 0L);
    if ((l2 <= 0L) || (((File)localObject3).length() != l2))
    {
      QLog.d("BaseApplicationImpl", 1, "injectPatchDex patch size not match.");
      return;
    }
    if (!localSharedPreferences.getBoolean("verify", false))
    {
      QLog.d("BaseApplicationImpl", 1, "injectPatchDex patch verify failed.");
      return;
    }
    int i2 = localSharedPreferences.getInt("installFailCount", 0);
    if (i2 >= 3)
    {
      QLog.d("BaseApplicationImpl", 1, "injectPatchDex install fail many times.");
      return;
    }
    localObject3 = localSharedPreferences.getString("crashKey", "");
    i1 = localSharedPreferences.getInt("patchCrashCount", 0);
    if ((!TextUtils.isEmpty((CharSequence)localObject3)) && (i1 >= 5))
    {
      QLog.d("BaseApplicationImpl", 1, "injectPatchDex patch crash many times.");
      return;
    }
    l2 = System.currentTimeMillis();
    for (;;)
    {
      try
      {
        j = SystemClassLoaderInjector.a(this, (String)localObject2, null, false);
        if (!"Success".equals(j)) {
          break label805;
        }
        i1 = 500;
        k = (String)localObject1;
        e = paramBoolean;
      }
      catch (Throwable localThrowable)
      {
        j = "Inject patch failed as throwable";
        QLog.d("BaseApplicationImpl", 1, "Inject patch throwable=" + localThrowable.toString());
        localThrowable.printStackTrace();
        i1 = 502;
        continue;
      }
      QLog.d("BaseApplicationImpl", 1, "injectPatchDex result=" + j + ", total cost time: " + (System.currentTimeMillis() - l1) + " ms, inject cost time: " + (System.currentTimeMillis() - l2) + " ms.");
      a(paramContext, paramBoolean, i1, i2);
      a(paramContext, paramBoolean, i1, (String)localObject1);
      return;
      label797:
      return;
      label798:
      i1 += 1;
      break;
      label805:
      i1 = 501;
    }
  }
  
  public void a(Intent paramIntent)
  {
    try
    {
      super.sendBroadcast(paramIntent);
      return;
    }
    catch (Throwable paramIntent)
    {
      QLog.e("mqq", 1, "", paramIntent);
    }
  }
  
  public void a(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    m = paramString1;
    n = paramString2;
    o = paramString3;
    p = paramString4;
  }
  
  public void addOtherTypeActivity(Activity paramActivity)
  {
    otherTypeActivitys.add(new WeakReference(paramActivity));
    StatisticCollector.a(this).a(paramActivity);
  }
  
  protected void attachBaseContext(Context paramContext)
  {
    super.attachBaseContext(paramContext);
    String str = getProcessName();
    if ("com.tencent.mobileqq".equals(str))
    {
      i = 1;
      if (i != 1) {
        break label184;
      }
    }
    label184:
    for (long l1 = 3000L;; l1 = 0L)
    {
      QLog.init("com.tencent.mobileqq", str, "V 6.3.3.2755", l1);
      a(paramContext);
      a(paramContext, true);
      paramContext = getResources();
      if (paramContext != null)
      {
        FontSettingManager.a.setTo(paramContext.getDisplayMetrics());
        FontSettingManager.a(this, null, false);
      }
      return;
      if (str.endsWith("MSF"))
      {
        i = 4;
        break;
      }
      if (str.endsWith("qzone"))
      {
        i = 2;
        break;
      }
      if (str.endsWith("web"))
      {
        i = 3;
        break;
      }
      if (str.endsWith("nearby"))
      {
        i = 5;
        break;
      }
      if (str.endsWith("lola"))
      {
        i = 6;
        break;
      }
      i = -1;
      break;
    }
  }
  
  public AppRuntime createRuntime(String paramString)
  {
    return AppInterfaceFactory.a(this, paramString);
  }
  
  public Object getAppData(String paramString)
  {
    if (paramString == null) {}
    while (!"channel_id".equals(paramString)) {
      return null;
    }
    return "2017";
  }
  
  public int getAppId(String paramString)
  {
    return AppSetting.a;
  }
  
  public String getBootBroadcastName(String paramString)
  {
    if (paramString.equals("com.tencent.mobileqq")) {
      return "com.tencent.mobileqq.broadcast.qq";
    }
    if (paramString.equals("com.tencent.mobileqq:video")) {
      return "com.tencent.av.ui.VChatActivity";
    }
    return "";
  }
  
  public SharedPreferences getSharedPreferences(String paramString, int paramInt)
  {
    return SharedPreferencesProxyManager.getInstance().getProxy(paramString, paramInt);
  }
  
  public SharedPreferences getSystemSharedPreferences(String paramString, int paramInt)
  {
    return super.getSharedPreferences(paramString, paramInt);
  }
  
  public boolean isNeedMSF(String paramString)
  {
    return !paramString.endsWith("lola");
  }
  
  public boolean onActivityCreate(Object paramObject, Intent paramIntent)
  {
    if (jdField_a_of_type_ComTencentMobileqqStartupDirectorStartupDirector != null)
    {
      if ((startComponentInfo == null) && (paramObject != null)) {
        startComponentInfo = paramObject.toString();
      }
      return jdField_a_of_type_ComTencentMobileqqStartupDirectorStartupDirector.a(paramObject, paramIntent);
    }
    return false;
  }
  
  public void onActivityFocusChanged(AppActivity paramAppActivity, boolean paramBoolean)
  {
    if (jdField_a_of_type_ComTencentMobileqqStartupDirectorStartupDirector != null) {
      jdField_a_of_type_ComTencentMobileqqStartupDirectorStartupDirector.a(paramAppActivity, paramBoolean);
    }
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    paramConfiguration = getResources();
    if (paramConfiguration != null)
    {
      FontSettingManager.a.setTo(paramConfiguration.getDisplayMetrics());
      FontSettingManager.a(this, null, true);
    }
  }
  
  public void onCreate()
  {
    if (jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl != null) {}
    do
    {
      return;
      jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl = this;
      SharedPreferencesProxyManager.getInstance().init(this);
      if (i == 2)
      {
        StartupDirector.e = true;
        PerfTracer.a("App_onCreate");
      }
      if (Build.VERSION.SDK_INT >= 15) {
        registerActivityLifecycleCallbacks(new UEC());
      }
      jdField_a_of_type_ComTencentMobileqqStartupDirectorStartupDirector = StartupDirector.a(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl);
    } while (!StartupDirector.e);
    PerfTracer.b("App_onCreate");
  }
  
  public Intent registerReceiver(BroadcastReceiver paramBroadcastReceiver, IntentFilter paramIntentFilter)
  {
    try
    {
      paramBroadcastReceiver = super.registerReceiver(paramBroadcastReceiver, paramIntentFilter);
      return paramBroadcastReceiver;
    }
    catch (Exception paramBroadcastReceiver)
    {
      if (QLog.isColorLevel()) {
        QLog.d("mqq", 2, "", paramBroadcastReceiver);
      }
    }
    return null;
  }
  
  public void removeOtherTypeActivity(Activity paramActivity)
  {
    otherTypeActivitys.remove(new WeakReference(paramActivity));
    StatisticCollector.a(this).d(paramActivity);
  }
  
  public void reportPCActive(String paramString, int paramInt)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("param_retryIndex", Integer.toString(paramInt));
    localHashMap.put("param_uin", paramString);
    StatisticCollector.a(a()).a(paramString, "PcActiveSucc", true, 0L, 0L, localHashMap, "", true);
    jdField_a_of_type_MqqOsMqqHandler.postDelayed(new hcr(this, paramInt, paramString), 10000L);
    ReportController.b(null, "CliOper", "", "", "0X8004974", "0X8004974", 0, 0, "", "", "", "");
  }
  
  public void sendBroadcast(Intent paramIntent)
  {
    int i2 = 0;
    int i1;
    if (paramIntent == null) {
      i1 = i2;
    }
    for (;;)
    {
      if (i1 == 0) {
        a(paramIntent);
      }
      return;
      String str = paramIntent.getAction();
      i1 = i2;
      if (str != null) {
        if (!str.startsWith("com.tencent.process."))
        {
          i1 = i2;
          if (!str.equals("com.tencent.qq.syncQQMessage")) {}
        }
        else
        {
          i1 = 1;
          ThreadManager.b().post(new hcu(this, paramIntent));
        }
      }
    }
  }
  
  public void startActivity(Intent paramIntent)
  {
    try
    {
      JumpActivity.a(paramIntent);
      super.startActivity(paramIntent);
      return;
    }
    catch (Exception paramIntent) {}
  }
  
  public void startActivity(Intent paramIntent, Bundle paramBundle)
  {
    try
    {
      JumpActivity.a(paramIntent);
      super.startActivity(paramIntent, paramBundle);
      return;
    }
    catch (Exception paramIntent) {}
  }
}
