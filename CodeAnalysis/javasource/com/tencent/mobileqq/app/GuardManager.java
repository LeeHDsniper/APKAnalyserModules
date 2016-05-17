package com.tencent.mobileqq.app;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.Application;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.os.Process;
import android.os.SystemClock;
import android.text.TextUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.memory.ProcReporter;
import com.tencent.mobileqq.cooperation.ApkUtils;
import com.tencent.mobileqq.hitrate.PreloadProcHitMgr;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.startup.step.StartService;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.statistics.StatisticHitRateCollector;
import com.tencent.mobileqq.trick.TrickHelper;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import mqq.app.AppRuntime;
import mqq.app.Foreground;
import mtb;
import mtc;
import mxn;
import mxo;
import mye;
import myf;
import myg;
import mzf;
import mzg;
import ncf;

public class GuardManager
  extends BroadcastReceiver
  implements Handler.Callback
{
  private static final int A = 3;
  private static final int B = 4;
  private static final int C = 5;
  private static final int D = 6;
  private static final int E = 7;
  public static GuardManager a;
  public static final String a = "com.tencent.plugin.state.change";
  public static final String b = "key_plugin_state";
  public static final int c = 0;
  static final String jdField_c_of_type_JavaLangString = "GuardManager";
  private static final boolean jdField_c_of_type_Boolean = true;
  public static final int d = 1;
  public static long d = 0L;
  public static int e = -1;
  public static final String e = "guardmgr_qzone_bg_time";
  public static final int f = 0;
  protected static final String f = "fake_p_msg";
  public static final int g = 1;
  protected static final String g = "trick_p_msg";
  public static final int h = 2;
  private static final String h = "com.tencent.process.stopping";
  protected static final int i = 12000;
  private static final String i = "com.tencent.process.starting";
  protected static final int j = 1;
  private static final String j = "20140619";
  protected static final int k = 3;
  protected static final int l = 50;
  protected static final int m = 2;
  protected static final int n = 15;
  protected static final int o = 5;
  public static final int p = 6;
  public static final int q = 0;
  public static final int r = 1;
  public static int s = 5;
  public static final int t = 1;
  public static final int u = 6;
  public static final int v = 0;
  private static final int x = 101;
  private static final int y = 1;
  private static final int z = 2;
  public int a;
  public long a;
  private Application jdField_a_of_type_AndroidAppApplication;
  private BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver;
  private Handler jdField_a_of_type_AndroidOsHandler;
  Random jdField_a_of_type_JavaUtilRandom;
  private myg jdField_a_of_type_Myg = null;
  private boolean jdField_a_of_type_Boolean;
  myg[] jdField_a_of_type_ArrayOfMyg = new myg[9];
  public long[][] a;
  public int b;
  long jdField_b_of_type_Long = 0L;
  private boolean jdField_b_of_type_Boolean;
  long jdField_c_of_type_Long;
  public String d;
  private int w = 0;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_d_of_type_Long = 0L;
  }
  
  public GuardManager(Application paramApplication, int paramInt)
  {
    jdField_a_of_type_Array2dOfLong = ((long[][])Array.newInstance(Long.TYPE, new int[] { 3, 15 }));
    jdField_a_of_type_Int = 0;
    jdField_b_of_type_Int = 0;
    jdField_a_of_type_Long = 0L;
    c = 0L;
    jdField_d_of_type_JavaLangString = null;
    jdField_a_of_type_AndroidAppApplication = paramApplication;
    jdField_a_of_type_AndroidOsHandler = new Handler(ThreadManager.a(), this);
    a(paramInt, null);
    paramApplication = new IntentFilter("com.tencent.process.stopping");
    paramApplication.addAction("com.tencent.process.starting");
    try
    {
      jdField_a_of_type_AndroidAppApplication.registerReceiver(this, paramApplication);
      if (jdField_a_of_type_AndroidContentBroadcastReceiver == null)
      {
        jdField_a_of_type_AndroidContentBroadcastReceiver = new myf(this);
        paramApplication = new IntentFilter();
        paramApplication.addAction("android.intent.action.SCREEN_OFF");
        paramApplication.addAction("android.intent.action.SCREEN_ON");
      }
      try
      {
        jdField_a_of_type_AndroidAppApplication.registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, paramApplication);
        Foreground.setReady();
        return;
      }
      catch (Throwable paramApplication)
      {
        for (;;) {}
      }
    }
    catch (Throwable paramApplication)
    {
      for (;;) {}
    }
  }
  
  public static int a()
  {
    int i1 = 3;
    String str;
    if (e == -1) {
      str = BaseApplicationImpl.a.getSharedPreferences("GuardManager", 0).getString("QZoneBgKillTick", String.valueOf(3));
    }
    try
    {
      int i2 = Integer.parseInt(str);
      i1 = i2;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
    e = i1;
    if (QLog.isColorLevel()) {
      QLog.d("GuardManager", 2, "getQZoneFgKillTick: " + e);
    }
    return e;
  }
  
  public static void a(String paramString)
  {
    try
    {
      e = Integer.parseInt(paramString);
      BaseApplicationImpl.a.getSharedPreferences("GuardManager", 0).edit().putString("QZoneBgKillTick", paramString).commit();
      if (QLog.isColorLevel()) {
        QLog.d("GuardManager", 2, "setQZoneBgKillTick: " + paramString);
      }
      return;
    }
    catch (Exception paramString) {}
  }
  
  myg a(int paramInt)
  {
    myg localMyg = jdField_a_of_type_ArrayOfMyg[paramInt];
    Object localObject = localMyg;
    if (localMyg == null) {
      switch (paramInt)
      {
      default: 
        throw new RuntimeException("WTF");
      case 2: 
        localObject = new mxn();
      }
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqAppGuardManager = this;
      s = paramInt;
      jdField_a_of_type_ArrayOfMyg[paramInt] = localObject;
      return localObject;
      localObject = new mxo();
      continue;
      localObject = new mtb();
      continue;
      localObject = new mtc();
      continue;
      localObject = new mzg();
      continue;
      localObject = new myg();
      continue;
      localObject = new mzf();
      continue;
      localObject = new ncf();
    }
  }
  
  public void a()
  {
    a(8, null);
    try
    {
      jdField_a_of_type_AndroidAppApplication.unregisterReceiver(this);
      if (jdField_a_of_type_AndroidContentBroadcastReceiver == null) {}
    }
    catch (Throwable localThrowable1)
    {
      try
      {
        do
        {
          jdField_a_of_type_AndroidAppApplication.unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
          jdField_a_of_type_AndroidContentBroadcastReceiver = null;
          jdField_a_of_type_AndroidOsHandler.removeMessages(5);
          CoreService.b();
          return;
          localThrowable1 = localThrowable1;
        } while (!QLog.isColorLevel());
        QLog.d("GuardManager", 2, "", localThrowable1);
      }
      catch (Throwable localThrowable2)
      {
        for (;;) {}
      }
    }
  }
  
  void a(int paramInt)
  {
    int i3 = (int)(System.currentTimeMillis() / 60000L);
    if (i3 == jdField_b_of_type_Int)
    {
      long[] arrayOfLong = jdField_a_of_type_Array2dOfLong[paramInt];
      paramInt = jdField_a_of_type_Int;
      arrayOfLong[paramInt] += 1L;
      return;
    }
    int i2;
    if ((i3 < jdField_b_of_type_Int) || (i3 - jdField_b_of_type_Int > 15))
    {
      i1 = 0;
      while (i1 < 3)
      {
        i2 = 0;
        while (i2 < 15)
        {
          jdField_a_of_type_Array2dOfLong[i1][i2] = 0L;
          i2 += 1;
        }
        i1 += 1;
      }
      jdField_b_of_type_Int = (i3 - 15);
      jdField_a_of_type_Int = 0;
    }
    int i4 = (i3 - jdField_b_of_type_Int) % 15;
    int i1 = 1;
    while (i1 <= i4)
    {
      i2 = 0;
      while (i2 < 3)
      {
        jdField_a_of_type_Array2dOfLong[i2][((jdField_a_of_type_Int + i1) % 15)] = 0L;
        i2 += 1;
      }
      i1 += 1;
    }
    jdField_b_of_type_Int = i3;
    jdField_a_of_type_Int = ((jdField_a_of_type_Int + i4) % 15);
    jdField_a_of_type_Array2dOfLong[paramInt][jdField_a_of_type_Int] = 1L;
  }
  
  public void a(int paramInt, Object paramObject)
  {
    if (Looper.myLooper() == ThreadManager.a())
    {
      if (QLog.isColorLevel()) {
        QLog.d("GuardManager", 2, "nextState: " + myg.jdField_a_of_type_ArrayOfJavaLangString[w] + ", " + myg.jdField_a_of_type_ArrayOfJavaLangString[paramInt] + ", " + paramObject);
      }
      if (w == 8) {
        return;
      }
      if (w != paramInt)
      {
        Message localMessage = jdField_a_of_type_AndroidOsHandler.obtainMessage(3, w, paramInt);
        jdField_a_of_type_AndroidOsHandler.sendMessageDelayed(localMessage, 1000L);
        jdField_a_of_type_Myg = a(paramInt);
        w = paramInt;
      }
      for (;;)
      {
        jdField_a_of_type_Myg.a(5, paramObject);
        return;
        if (paramInt == 0) {
          jdField_a_of_type_Myg = a(paramInt);
        }
      }
    }
    jdField_a_of_type_AndroidOsHandler.obtainMessage(6, paramInt, 0, paramObject).sendToTarget();
  }
  
  public void a(QQAppInterface paramQQAppInterface)
  {
    if ((jdField_a_of_type_Long == 0L) && (paramQQAppInterface != null) && (!TextUtils.isEmpty(paramQQAppInterface.getAccount())) && (jdField_a_of_type_Boolean)) {
      jdField_a_of_type_Long = SystemClock.uptimeMillis();
    }
  }
  
  public void a(String paramString, HashMap paramHashMap)
  {
    StatisticCollector localStatisticCollector = StatisticCollector.a(BaseApplication.getContext());
    paramHashMap.put("config", ajdField_a_of_type_JavaLangString);
    localStatisticCollector.a("", paramString, true, 0L, 0L, paramHashMap, "");
  }
  
  public void a(boolean paramBoolean)
  {
    if (jdField_a_of_type_Long == 0L) {}
    long l1;
    int i1;
    do
    {
      return;
      l1 = SystemClock.uptimeMillis();
      i1 = (int)((l1 - jdField_a_of_type_Long) / 1000L);
      if (QLog.isColorLevel()) {
        QLog.d("GuardManager", 2, "reportForeground(" + paramBoolean + "):[" + jdField_a_of_type_Long + " - " + l1 + " = " + i1 + "]");
      }
      if (i1 > 0)
      {
        Object localObject = new Date(NetConnInfoCenter.getServerTimeMillis());
        localObject = new SimpleDateFormat("yyyyMMdd", Locale.US).format((Date)localObject);
        ReportController.b((QQAppInterface)BaseApplicationImpl.a.a(), "CliOper", "", "", "Online_time", "Fe_time", 0, i1, 0, (String)localObject, "", "", "");
      }
      if (!paramBoolean) {
        break;
      }
    } while (i1 <= 0);
    jdField_a_of_type_Long = l1;
    return;
    jdField_a_of_type_Long = 0L;
  }
  
  public void a(boolean paramBoolean, String paramString)
  {
    PreloadProcHitMgr.b(paramString);
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramString);
    Intent localIntent = new Intent("com.tencent.process.exit");
    localIntent.putExtra("exit_type", 101);
    localIntent.putExtra("qq_mode_foreground", paramBoolean);
    localIntent.putStringArrayListExtra("procNameList", localArrayList);
    localIntent.putExtra("verify", BaseApplicationImpl.a(localArrayList, false));
    jdField_a_of_type_AndroidAppApplication.sendBroadcast(localIntent);
    if (QLog.isColorLevel()) {
      QLog.d("GuardManager", 2, "GmVersion= 20140619, app versioncode = " + ApkUtils.a(BaseApplicationImpl.getContext()) + ", toExitTargetProcess=" + paramString + " isForeground=" + paramBoolean);
    }
  }
  
  public void a(boolean paramBoolean, String... paramVarArgs)
  {
    ArrayList localArrayList2 = new ArrayList();
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList3 = new ArrayList();
    Object localObject = ((ActivityManager)jdField_a_of_type_AndroidAppApplication.getSystemService("activity")).getRunningAppProcesses();
    if (localObject != null)
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)((Iterator)localObject).next();
        String str1 = processName;
        if ((str1.startsWith("com.tencent.mobileqq")) && (str1.indexOf(':') != -1) && (!str1.endsWith(":MSF")))
        {
          int i3;
          int i2;
          int i1;
          if (paramVarArgs != null)
          {
            i3 = paramVarArgs.length;
            i2 = 0;
            i1 = 0;
          }
          for (;;)
          {
            if (i2 < i3)
            {
              String str2 = paramVarArgs[i2];
              if ((TextUtils.isEmpty(str2)) || (!str1.endsWith(str2))) {
                break label259;
              }
            }
            label259:
            for (i1 = 1;; i1 = 0)
            {
              if (i1 == 0) {
                break label264;
              }
              localArrayList3.add(str1);
              if (i1 != 0) {
                break;
              }
              if ((importance == 100) || ((importance == 200) && ((importance != 200) || (importanceReasonCode == 0)))) {
                break label273;
              }
              localArrayList1.add(str1);
              PreloadProcHitMgr.b(str1);
              if (!str1.endsWith(":qzone")) {
                break;
              }
              StatisticHitRateCollector.a().d(StatisticHitRateCollector.a());
              break;
            }
            label264:
            i2 += 1;
          }
          label273:
          localArrayList2.add(str1);
        }
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("GuardManager", 2, "GmVersion= 20140619, app versioncode = " + ApkUtils.a(BaseApplicationImpl.getContext()) + ", toExitProcess=" + localArrayList1 + ", forgroundProcess=" + localArrayList2 + ", exceptions:" + localArrayList3);
    }
    if (localArrayList1.size() > 0)
    {
      paramVarArgs = new Intent("com.tencent.process.exit");
      paramVarArgs.putExtra("exit_type", 101);
      paramVarArgs.putExtra("qq_mode_foreground", paramBoolean);
      paramVarArgs.putStringArrayListExtra("procNameList", localArrayList1);
      paramVarArgs.putExtra("verify", BaseApplicationImpl.a(localArrayList1, false));
      jdField_a_of_type_AndroidAppApplication.sendBroadcast(paramVarArgs);
    }
  }
  
  public boolean a()
  {
    int i1 = w;
    return (i1 == 6) || (i1 == 7) || (i1 == 5);
  }
  
  public void b()
  {
    if (QLog.isColorLevel()) {
      QLog.d("GuardManager", 2, "enterQQLSActivity");
    }
    jdField_b_of_type_Boolean = true;
    boolean bool = jdField_a_of_type_Boolean;
    jdField_a_of_type_Boolean = true;
    if ((!bool) && (jdField_a_of_type_Boolean))
    {
      Intent localIntent = new Intent("com.tencent.plugin.state.change");
      localIntent.putExtra("key_plugin_state", 1);
      BaseApplicationImpl.a().sendBroadcast(localIntent);
    }
    if (jdField_a_of_type_AndroidContentBroadcastReceiver != null) {}
    try
    {
      jdField_a_of_type_AndroidAppApplication.unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
      jdField_a_of_type_AndroidContentBroadcastReceiver = null;
      TrickHelper.a().b();
      a(false);
      return;
    }
    catch (Throwable localThrowable)
    {
      for (;;) {}
    }
  }
  
  public void b(int paramInt, Object paramObject)
  {
    jdField_a_of_type_AndroidOsHandler.obtainMessage(4, paramInt, 0, paramObject).sendToTarget();
  }
  
  public void b(boolean paramBoolean)
  {
    long l1 = MemoryManager.a(Process.myPid());
    a(0);
    int i1 = 0;
    int i2 = 0;
    int i3 = 0;
    while (i1 < 15)
    {
      i3 = (int)(i3 + jdField_a_of_type_Array2dOfLong[1][i1]);
      i2 = (int)(i2 + jdField_a_of_type_Array2dOfLong[0][i1]);
      i1 += 1;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("qqUsedMemory", String.valueOf(l1 / 1024L));
    localHashMap.put("resumeCount", String.valueOf(i3 * 1.0D / 15.0D));
    localHashMap.put("msgCount", String.valueOf(i2 * 1.0D / 15.0D));
    localHashMap.put("activeLevel", String.valueOf(mye.a().a(jdField_a_of_type_Array2dOfLong, jdField_a_of_type_Int, jdField_b_of_type_Int)));
    if (paramBoolean) {}
    for (String str = "actLiteActive";; str = "actFullActive")
    {
      a(str, localHashMap);
      return;
    }
  }
  
  public boolean b()
  {
    int i1 = w;
    return (i1 == 4) || (i1 == 6);
  }
  
  public void c()
  {
    if (QLog.isColorLevel()) {
      QLog.d("GuardManager", 2, "exitQQLSActivity");
    }
    jdField_b_of_type_Boolean = false;
    IntentFilter localIntentFilter;
    if (jdField_a_of_type_AndroidContentBroadcastReceiver == null)
    {
      jdField_a_of_type_AndroidContentBroadcastReceiver = new myf(this);
      localIntentFilter = new IntentFilter();
      localIntentFilter.addAction("android.intent.action.SCREEN_OFF");
      localIntentFilter.addAction("android.intent.action.SCREEN_ON");
    }
    try
    {
      jdField_a_of_type_AndroidAppApplication.registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, localIntentFilter);
      if ((jdField_a_of_type_Long == 0L) && (jdField_a_of_type_Boolean)) {
        jdField_a_of_type_Long = SystemClock.uptimeMillis();
      }
      return;
    }
    catch (Throwable localThrowable)
    {
      for (;;) {}
    }
  }
  
  public void c(boolean paramBoolean)
  {
    mye localMye = mye.a();
    AppRuntime localAppRuntime = BaseApplicationImpl.a.a();
    int i1 = jdField_a_of_type_Int;
    long l1 = jdField_b_of_type_Int | i1 << 8;
    int i2 = ac;
    if (paramBoolean) {}
    for (i1 = 1;; i1 = 0)
    {
      localAppRuntime.onGuardEvent(5, l1, i1 | i2 << 8);
      return;
    }
  }
  
  public void d()
  {
    jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(7);
  }
  
  public void e()
  {
    if (QLog.isColorLevel()) {
      QLog.d("GuardManager", 2, "startTimer");
    }
    jdField_a_of_type_AndroidOsHandler.removeMessages(5);
    jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(5, 12000L);
  }
  
  public void f()
  {
    if (QLog.isColorLevel()) {
      QLog.d("GuardManager", 2, "cancelTimer");
    }
    jdField_a_of_type_AndroidOsHandler.removeMessages(5);
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    for (;;)
    {
      return true;
      if (jdField_d_of_type_JavaLangString == null) {
        continue;
      }
      Object localObject1 = (String)obj;
      if (!TextUtils.equals(jdField_d_of_type_JavaLangString, (CharSequence)localObject1)) {
        continue;
      }
      jdField_d_of_type_JavaLangString = null;
      if (Foreground.sCountActivity > 0)
      {
        jdField_d_of_type_JavaLangString = "com.tencent.mobileqq";
        return true;
      }
      localObject1 = ((ActivityManager)BaseApplicationImpl.a().getSystemService("activity")).getRunningAppProcesses();
      label129:
      Object localObject2;
      if (localObject1 != null)
      {
        localObject1 = ((List)localObject1).iterator();
        if (((Iterator)localObject1).hasNext())
        {
          localObject2 = (ActivityManager.RunningAppProcessInfo)((Iterator)localObject1).next();
          if ((!processName.startsWith("com.tencent.mobileqq")) || (importance != 100) || (jdField_d_of_type_JavaLangString != null)) {
            break label347;
          }
          jdField_d_of_type_JavaLangString = processName;
          if (QLog.isColorLevel()) {
            QLog.d("GuardManager", 2, "GmVersion= 20140619, Fg= " + jdField_d_of_type_JavaLangString);
          }
        }
      }
      if (jdField_a_of_type_AndroidContentBroadcastReceiver != null) {}
      try
      {
        jdField_a_of_type_AndroidAppApplication.unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
        jdField_a_of_type_AndroidContentBroadcastReceiver = null;
        boolean bool = jdField_a_of_type_Boolean;
        jdField_a_of_type_Boolean = false;
        a(false);
        b(4, obj);
        if ((bool) && (!jdField_a_of_type_Boolean))
        {
          paramMessage = new Intent("com.tencent.plugin.state.change");
          paramMessage.putExtra("key_plugin_state", 0);
          BaseApplicationImpl.a().sendBroadcast(paramMessage);
        }
        TrickHelper.a().a();
        jdField_d_of_type_Long = System.currentTimeMillis();
        paramMessage = (QQAppInterface)BaseApplicationImpl.a.a();
        if (!paramMessage.isRunning()) {
          continue;
        }
        paramMessage.a(BaseApplicationImpl.a);
        return true;
        label347:
        if (jdField_d_of_type_JavaLangString == null) {
          break label129;
        }
        return true;
        jdField_d_of_type_JavaLangString = ((String)obj);
        if (jdField_a_of_type_AndroidContentBroadcastReceiver == null)
        {
          jdField_a_of_type_AndroidContentBroadcastReceiver = new myf(this);
          localObject1 = new IntentFilter();
          ((IntentFilter)localObject1).addAction("android.intent.action.SCREEN_OFF");
          ((IntentFilter)localObject1).addAction("android.intent.action.SCREEN_ON");
        }
        try
        {
          jdField_a_of_type_AndroidAppApplication.registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, (IntentFilter)localObject1);
          bool = jdField_a_of_type_Boolean;
          jdField_a_of_type_Boolean = true;
          localObject1 = (QQAppInterface)BaseApplicationImpl.a.a();
          a((QQAppInterface)localObject1);
          if ((!bool) && (jdField_a_of_type_Boolean))
          {
            localObject2 = new Intent("com.tencent.plugin.state.change");
            ((Intent)localObject2).putExtra("key_plugin_state", 1);
            BaseApplicationImpl.a().sendBroadcast((Intent)localObject2);
          }
          if (StartService.jdField_a_of_type_Boolean)
          {
            TrickHelper.a().b();
            MemoryManager.a().a(BaseApplicationImpl.a, (QQAppInterface)localObject1);
          }
          b(3, obj);
          try
          {
            ProcReporter.a().a();
            return true;
          }
          catch (Throwable paramMessage)
          {
            return true;
          }
          try
          {
            if (((arg2 == 2) || (arg2 == 3)) && ((arg1 == 4) || (arg1 == 5))) {
              BaseApplicationImpl.a.a().onGuardEvent(7, 0L, 0L);
            }
            if (jdField_a_of_type_JavaUtilRandom == null) {
              jdField_a_of_type_JavaUtilRandom = new Random();
            }
            if (jdField_a_of_type_JavaUtilRandom.nextInt(20000) != 0) {
              continue;
            }
            localObject1 = new HashMap();
            ((HashMap)localObject1).put("before", myg.jdField_a_of_type_ArrayOfJavaLangString[arg1]);
            ((HashMap)localObject1).put("after", myg.jdField_a_of_type_ArrayOfJavaLangString[arg2]);
            a("GM_guardChangeS", (HashMap)localObject1);
            return true;
          }
          catch (Throwable paramMessage)
          {
            return true;
          }
          int i1 = arg1;
          if (arg1 < 3) {
            a(i1);
          }
          jdField_a_of_type_Myg.a(i1, obj);
          return true;
          jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(5, 12000L);
          jdField_a_of_type_Myg.a();
          return true;
          if (!b()) {
            continue;
          }
          a(w + 1, "trick_p_msg");
          return true;
          a(arg1, obj);
          return true;
        }
        catch (Throwable localThrowable1)
        {
          for (;;) {}
        }
      }
      catch (Throwable localThrowable2)
      {
        for (;;) {}
      }
    }
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    String str;
    long l1;
    try
    {
      paramContext = paramIntent.getAction();
      str = paramIntent.getStringExtra("runningProcessName");
      l1 = paramIntent.getLongExtra("runningtime", 0L);
      if (QLog.isColorLevel()) {
        QLog.d("GuardManager", 2, paramContext + " received with " + str + " at " + l1 + ", when " + c + ", " + jdField_b_of_type_Long + ", QQLS:" + jdField_b_of_type_Boolean);
      }
      if (jdField_b_of_type_Boolean) {
        return;
      }
      if ("com.tencent.process.stopping".equals(paramContext))
      {
        if ((l1 < c) && (l1 >= c - 1000000L)) {
          return;
        }
        c = l1;
        paramContext = jdField_a_of_type_AndroidOsHandler.obtainMessage(1, str);
        jdField_a_of_type_AndroidOsHandler.sendMessageDelayed(paramContext, 50L);
        return;
      }
    }
    catch (Throwable paramContext)
    {
      QLog.d("GuardManager", 1, "", paramContext);
      return;
    }
    if (("com.tencent.process.starting".equals(paramContext)) && ((l1 >= jdField_b_of_type_Long) || (l1 < c - 1000000L)))
    {
      jdField_b_of_type_Long = l1;
      paramContext = jdField_a_of_type_AndroidOsHandler.obtainMessage(2, str);
      jdField_a_of_type_AndroidOsHandler.sendMessage(paramContext);
    }
  }
}
