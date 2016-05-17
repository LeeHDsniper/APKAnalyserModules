package com.tencent.mobileqq.trick;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningTaskInfo;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Process;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.GuardManager;
import com.tencent.mobileqq.app.MemoryConfigs;
import com.tencent.mobileqq.app.MemoryManager;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import mqq.os.MqqHandler;
import rmp;
import rmq;

public class TrickHelper
{
  private static TrickHelper jdField_a_of_type_ComTencentMobileqqTrickTrickHelper;
  private static final String jdField_a_of_type_JavaLangString = "TrickHelper";
  public static boolean a;
  public static boolean b = true;
  private BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver = null;
  private Runnable jdField_a_of_type_JavaLangRunnable = new rmp(this);
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqTrickTrickHelper = null;
    jdField_a_of_type_Boolean = false;
  }
  
  private TrickHelper() {}
  
  public static TrickHelper a()
  {
    if (jdField_a_of_type_ComTencentMobileqqTrickTrickHelper == null) {}
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqTrickTrickHelper == null) {
        jdField_a_of_type_ComTencentMobileqqTrickTrickHelper = new TrickHelper();
      }
      return jdField_a_of_type_ComTencentMobileqqTrickTrickHelper;
    }
    finally {}
  }
  
  private boolean a()
  {
    Object localObject = ((ActivityManager)BaseApplicationImpl.getContext().getSystemService("activity")).getRunningTasks(1);
    if ((localObject != null) && (((List)localObject).size() > 0))
    {
      localObject = get0topActivity.getClassName();
      if (QLog.isColorLevel()) {
        QLog.d("TrickHelper", 2, "top=" + (String)localObject);
      }
      if (ClassNameHelper.a().contains(localObject))
      {
        if (GuardManager.a.b())
        {
          c();
          GuardManager.a.d();
        }
        return true;
      }
      return false;
    }
    return false;
  }
  
  private void c()
  {
    try
    {
      long l1 = System.currentTimeMillis();
      if ((l1 > GuardManager.d) && (GuardManager.d != 0L))
      {
        long l2 = GuardManager.d;
        long l3 = MemoryManager.a(Process.myPid()) / 1024L;
        long l4 = DeviceInfoUtil.e() / 1024L;
        long l5 = DeviceInfoUtil.c() / 1024L;
        StatisticCollector localStatisticCollector = StatisticCollector.a(BaseApplication.getContext());
        HashMap localHashMap = new HashMap();
        localHashMap.put("osVersion", Build.VERSION.RELEASE);
        localHashMap.put("deviceName", Build.MANUFACTURER + "_" + Build.MODEL);
        localHashMap.put("time", String.valueOf((l1 - l2) / 1000L));
        localHashMap.put("qqUsedMemory", String.valueOf(l3));
        localHashMap.put("sysClassMemory", String.valueOf(l4));
        localHashMap.put("sysTotalMemory", String.valueOf(l5));
        localStatisticCollector.a("", "MemoryTrick", true, 0L, 0L, localHashMap, "");
      }
      return;
    }
    catch (Exception localException)
    {
      while (!QLog.isColorLevel()) {}
      QLog.d("TrickHelper", 2, "report err", localException);
    }
  }
  
  public void a()
  {
    IntentFilter localIntentFilter;
    if (!jdField_a_of_type_Boolean)
    {
      boolean bool = ajdField_a_of_type_Boolean;
      if (QLog.isColorLevel()) {
        QLog.d("TrickHelper", 2, "startTrick enable=" + bool);
      }
      if (bool)
      {
        b = true;
        ThreadManager.a().removeCallbacks(jdField_a_of_type_JavaLangRunnable);
        ThreadManager.a().postDelayed(jdField_a_of_type_JavaLangRunnable, 2000L);
        if (jdField_a_of_type_AndroidContentBroadcastReceiver == null)
        {
          jdField_a_of_type_AndroidContentBroadcastReceiver = new rmq(this, null);
          localIntentFilter = new IntentFilter();
          localIntentFilter.addAction("android.intent.action.SCREEN_OFF");
          localIntentFilter.addAction("android.intent.action.SCREEN_ON");
        }
      }
    }
    try
    {
      BaseApplicationImpl.a.registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, localIntentFilter);
      jdField_a_of_type_Boolean = true;
      return;
    }
    catch (Throwable localThrowable)
    {
      for (;;) {}
    }
  }
  
  public void b()
  {
    if (jdField_a_of_type_Boolean)
    {
      boolean bool = ajdField_a_of_type_Boolean;
      if (QLog.isColorLevel()) {
        QLog.d("TrickHelper", 2, "stopTrick enable=" + bool);
      }
      if (bool)
      {
        b = false;
        ThreadManager.a().removeCallbacks(jdField_a_of_type_JavaLangRunnable);
        if (jdField_a_of_type_AndroidContentBroadcastReceiver == null) {}
      }
    }
    try
    {
      BaseApplicationImpl.a.unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
      jdField_a_of_type_AndroidContentBroadcastReceiver = null;
      jdField_a_of_type_Boolean = false;
      return;
    }
    catch (Throwable localThrowable)
    {
      for (;;) {}
    }
  }
}
