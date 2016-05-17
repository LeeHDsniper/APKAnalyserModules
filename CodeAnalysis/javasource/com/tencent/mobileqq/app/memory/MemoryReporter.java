package com.tencent.mobileqq.app.memory;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.os.Process;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.MemoryConfigs;
import com.tencent.mobileqq.app.MemoryManager;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class MemoryReporter
  implements Handler.Callback
{
  public static final int a = 86400000;
  private static MemoryReporter jdField_a_of_type_ComTencentMobileqqAppMemoryMemoryReporter = null;
  private static final String jdField_a_of_type_JavaLangString = "MemoryReporter";
  private static final int jdField_b_of_type_Int = 0;
  private static final String jdField_b_of_type_JavaLangString = "memory_reporter";
  private static final String jdField_c_of_type_JavaLangString = "MemoryReporter";
  private static final String d = "sp_item_memory_last_report_time";
  private static final String e = "sp_key_last_shot_time";
  private static final String f = "sp_key_sharp_pss_";
  private static final String g = "sp_key_sharp_heap_";
  private static final String h = "sp_key_leak_objs_";
  private static final String i = "HeapMax";
  private static final String j = "SystemTotal";
  private static final String k = "SystemThresold";
  private static final String l = "osVersion";
  private static final String m = "resolution";
  private static final String n = "SharpHeap";
  private static final String o = "SharpPss";
  private static final String p = "leaks";
  private long jdField_a_of_type_Long;
  private Handler jdField_a_of_type_AndroidOsHandler;
  private HashMap jdField_a_of_type_JavaUtilHashMap = new HashMap();
  public boolean a;
  private long jdField_b_of_type_Long;
  private boolean jdField_b_of_type_Boolean;
  private int jdField_c_of_type_Int = 0;
  private long jdField_c_of_type_Long = System.currentTimeMillis();
  private boolean jdField_c_of_type_Boolean;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private MemoryReporter()
  {
    jdField_a_of_type_Boolean = false;
    float f1 = ab;
    SharedPreferences localSharedPreferences = BaseApplicationImpl.a().getSharedPreferences("memory_reporter", 0);
    long l1 = localSharedPreferences.getLong("sp_key_last_shot_time", 0L);
    if (Math.abs(System.currentTimeMillis() - l1) >= 86400000L) {
      if (f1 >= Math.random())
      {
        jdField_a_of_type_Boolean = true;
        localSharedPreferences.edit().putLong("sp_key_last_shot_time", System.currentTimeMillis()).commit();
      }
    }
    for (;;)
    {
      if (jdField_a_of_type_Boolean) {
        jdField_a_of_type_AndroidOsHandler = new Handler(ThreadManager.a(), this);
      }
      return;
      jdField_a_of_type_Boolean = true;
    }
  }
  
  public static MemoryReporter a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppMemoryMemoryReporter == null) {}
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqAppMemoryMemoryReporter == null) {
        jdField_a_of_type_ComTencentMobileqqAppMemoryMemoryReporter = new MemoryReporter();
      }
      return jdField_a_of_type_ComTencentMobileqqAppMemoryMemoryReporter;
    }
    finally {}
  }
  
  private void b()
  {
    long l1 = MemoryManager.a(Process.myPid());
    if (l1 > jdField_a_of_type_Long)
    {
      jdField_b_of_type_Boolean = true;
      jdField_a_of_type_Long = l1;
    }
    l1 = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
    if (l1 > jdField_b_of_type_Long)
    {
      jdField_c_of_type_Boolean = true;
      jdField_b_of_type_Long = l1;
    }
    jdField_c_of_type_Int += 1;
    if ((jdField_c_of_type_Int >= 12) && ((jdField_c_of_type_Boolean) || (jdField_b_of_type_Boolean)))
    {
      d();
      jdField_c_of_type_Int = 0;
    }
  }
  
  private void c()
  {
    SharedPreferences localSharedPreferences = BaseApplicationImpl.a().getSharedPreferences("memory_reporter", 0);
    long l1 = localSharedPreferences.getLong("sp_item_memory_last_report_time", 0L);
    Object localObject1;
    HashMap localHashMap;
    Iterator localIterator;
    Object localObject2;
    StringBuilder localStringBuilder1;
    StringBuilder localStringBuilder2;
    if ((Math.abs(System.currentTimeMillis() - l1) >= 86400000L) || (!jdField_a_of_type_Boolean))
    {
      localObject1 = localSharedPreferences.getAll();
      localHashMap = new HashMap();
      localIterator = ((Map)localObject1).entrySet().iterator();
      localObject2 = new ArrayList();
      localObject1 = new StringBuilder();
      localStringBuilder1 = new StringBuilder();
      localStringBuilder2 = new StringBuilder();
    }
    for (;;)
    {
      Map.Entry localEntry;
      String str1;
      if (localIterator.hasNext())
      {
        localEntry = (Map.Entry)localIterator.next();
        str1 = (String)localEntry.getKey();
        if (str1.startsWith("sp_key_sharp_heap_"))
        {
          ((StringBuilder)localObject1).append(String.valueOf(localEntry.getValue()));
          ((StringBuilder)localObject1).append("|");
          ((ArrayList)localObject2).add(str1);
          continue;
        }
        if (str1.startsWith("sp_key_sharp_pss_"))
        {
          localStringBuilder1.append(String.valueOf(localEntry.getValue()));
          localStringBuilder1.append("|");
          ((ArrayList)localObject2).add(str1);
          continue;
        }
        if (!str1.startsWith("sp_key_leak_objs_")) {
          continue;
        }
      }
      try
      {
        String str2 = str1.substring("sp_key_leak_objs_".length());
        localStringBuilder2.append(str2.substring(str2.indexOf("_") + 1));
        localStringBuilder2.append(":");
        localStringBuilder2.append(String.valueOf(localEntry.getValue()));
        localStringBuilder2.append("|");
        ((ArrayList)localObject2).add(str1);
        continue;
        if (((ArrayList)localObject2).size() > 0)
        {
          localIterator = ((ArrayList)localObject2).iterator();
          while (localIterator.hasNext())
          {
            localObject2 = (String)localIterator.next();
            localSharedPreferences.edit().remove((String)localObject2).commit();
          }
          if (((StringBuilder)localObject1).length() > 0) {
            localHashMap.put("SharpHeap", ((StringBuilder)localObject1).toString());
          }
          if (localStringBuilder1.length() > 0) {
            localHashMap.put("SharpPss", localStringBuilder1.toString());
          }
          if (localStringBuilder2.length() > 0) {
            localHashMap.put("leaks", localStringBuilder2.toString());
          }
          localHashMap.put("SystemTotal", String.valueOf(DeviceInfoUtil.c()));
          localHashMap.put("SystemThresold", String.valueOf(DeviceInfoUtil.e()));
          localHashMap.put("HeapMax", String.valueOf(Runtime.getRuntime().maxMemory()));
          localHashMap.put("osVersion", Build.VERSION.RELEASE);
          localHashMap.put("resolution", DeviceInfoUtil.l());
          StatisticCollector.a(BaseApplicationImpl.a()).a(null, "MemoryReporter", true, 0L, 0L, localHashMap, null);
        }
        localSharedPreferences.edit().putLong("sp_item_memory_last_report_time", System.currentTimeMillis()).commit();
        return;
      }
      catch (Exception localException)
      {
        for (;;) {}
      }
    }
  }
  
  private void d()
  {
    SharedPreferences localSharedPreferences = BaseApplicationImpl.a().getSharedPreferences("memory_reporter", 0);
    if (jdField_b_of_type_Boolean)
    {
      localSharedPreferences.edit().putString("sp_key_sharp_pss_" + jdField_c_of_type_Long, String.valueOf(jdField_a_of_type_Long)).commit();
      jdField_b_of_type_Boolean = false;
    }
    if (jdField_c_of_type_Boolean)
    {
      localSharedPreferences.edit().putString("sp_key_sharp_heap_" + jdField_c_of_type_Long, String.valueOf(jdField_b_of_type_Long)).commit();
      jdField_c_of_type_Boolean = false;
    }
  }
  
  public void a()
  {
    c();
    if (jdField_a_of_type_Boolean) {
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(0);
    }
  }
  
  public void a(String paramString)
  {
    SharedPreferences localSharedPreferences;
    if (jdField_a_of_type_Boolean)
    {
      localSharedPreferences = BaseApplicationImpl.a().getSharedPreferences("memory_reporter", 0);
      if (!jdField_a_of_type_JavaUtilHashMap.containsKey(paramString)) {
        break label117;
      }
      jdField_a_of_type_JavaUtilHashMap.put(paramString, Integer.valueOf(((Integer)jdField_a_of_type_JavaUtilHashMap.get(paramString)).intValue() + 1));
    }
    for (;;)
    {
      localSharedPreferences.edit().putString("sp_key_leak_objs_" + jdField_c_of_type_Long + "_" + paramString, String.valueOf(jdField_a_of_type_JavaUtilHashMap.get(paramString))).commit();
      return;
      label117:
      jdField_a_of_type_JavaUtilHashMap.put(paramString, Integer.valueOf(1));
    }
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    for (;;)
    {
      return true;
      b();
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(0, 5000L);
    }
  }
}
