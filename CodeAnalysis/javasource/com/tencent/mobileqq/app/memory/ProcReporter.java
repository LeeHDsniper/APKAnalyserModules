package com.tencent.mobileqq.app.memory;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class ProcReporter
{
  private static ProcReporter jdField_a_of_type_ComTencentMobileqqAppMemoryProcReporter = null;
  public static final String a = "proc_max_count";
  public static final String b = "proc_report_time";
  private static final String c = "ProcReporter";
  private static final String d = "proc_reporter";
  int jdField_a_of_type_Int = 0;
  private int b = 0;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private ProcReporter()
  {
    SharedPreferences localSharedPreferences = BaseApplicationImpl.a().getSharedPreferences("proc_reporter", 0);
    b = localSharedPreferences.getInt("proc_max_count", 0);
    long l1 = localSharedPreferences.getLong("proc_report_time", 0L);
    long l2 = System.currentTimeMillis();
    if (l1 == 0L) {
      localSharedPreferences.edit().putLong("proc_report_time", l2).commit();
    }
    while ((Math.abs(l2 - l1) <= 86400000L) || (b <= 2)) {
      return;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("param_FailCode", "" + b);
    StatisticCollector.a(BaseApplicationImpl.a()).a(null, "ProcReporter", true, 0L, b, localHashMap, null);
    b = 0;
    localSharedPreferences.edit().putLong("proc_report_time", l2).putInt("proc_max_count", 0).commit();
  }
  
  public static ProcReporter a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppMemoryProcReporter == null) {}
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqAppMemoryProcReporter == null) {
        jdField_a_of_type_ComTencentMobileqqAppMemoryProcReporter = new ProcReporter();
      }
      return jdField_a_of_type_ComTencentMobileqqAppMemoryProcReporter;
    }
    finally {}
  }
  
  public void a()
  {
    int i = 0;
    jdField_a_of_type_Int += 1;
    if (jdField_a_of_type_Int % 3 == 0) {}
    for (;;)
    {
      try
      {
        Iterator localIterator = ((ActivityManager)BaseApplicationImpl.a().getSystemService("activity")).getRunningAppProcesses().iterator();
        if (localIterator.hasNext())
        {
          if (nextprocessName.startsWith("com.tencent.mobileqq")) {
            i += 1;
          }
        }
        else
        {
          if (i > b)
          {
            b = i;
            BaseApplicationImpl.a().getSharedPreferences("proc_reporter", 0).edit().putInt("proc_max_count", i).commit();
          }
          return;
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return;
      }
    }
  }
}
