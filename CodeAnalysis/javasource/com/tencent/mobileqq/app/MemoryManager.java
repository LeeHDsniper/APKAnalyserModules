package com.tencent.mobileqq.app;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.os.Build.VERSION;
import android.os.Debug.MemoryInfo;
import android.os.Process;
import android.support.v4.util.MQLruCache;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import mye;
import mzj;
import mzk;
import mzl;

public class MemoryManager
{
  private static final byte jdField_a_of_type_Byte = 1;
  private static final long jdField_a_of_type_Long = 1048576L;
  private static MemoryManager jdField_a_of_type_ComTencentMobileqqAppMemoryManager;
  public static final String a = "Q.Memory.MemoryManager";
  private static List jdField_a_of_type_JavaUtilList = null;
  private static final byte jdField_b_of_type_Byte = 2;
  private static long jdField_b_of_type_Long = 0L;
  public static final String b = "com.tencent.process.exit";
  private static List jdField_b_of_type_JavaUtilList = null;
  public static final String c = "MemoryInfomation";
  private static List c = null;
  public static final String d = "MemoryAlertAutoClear";
  private Object jdField_a_of_type_JavaLangObject = new Object();
  private mzk jdField_a_of_type_Mzk = null;
  private mzl jdField_a_of_type_Mzl = null;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqAppMemoryManager = null;
    jdField_b_of_type_Long = 0L;
  }
  
  private MemoryManager() {}
  
  public static long a()
  {
    if (jdField_b_of_type_Long > 0L) {
      return jdField_b_of_type_Long;
    }
    long l1 = DeviceInfoUtil.c();
    long l2 = DeviceInfoUtil.d();
    long l3 = (3L * l1 + 7L * l2) / 10L;
    long l4 = DeviceInfoUtil.e();
    if (l3 <= 157286400L) {
      jdField_b_of_type_Long = Math.min(25165824L, l4);
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.Memory.MemoryManager", 2, "getAvailClassSize, availClassSize=" + jdField_b_of_type_Long / 1048576L + "M, totalMemSize=" + l1 / 1048576L + "M, remainMemSize=" + l2 / 1048576L + "M, availMemSize=" + l3 / 1048576L + "M, classMemSize=" + l4 / 1048576L + "M");
      }
      return jdField_b_of_type_Long;
      if (l3 <= 262144000L) {
        jdField_b_of_type_Long = Math.min(37748736L, l4);
      } else if (l3 <= 419430400L) {
        jdField_b_of_type_Long = Math.min(67108864L, l4);
      } else if (l3 <= 524288000L) {
        jdField_b_of_type_Long = Math.min(134217728L, l4);
      } else {
        jdField_b_of_type_Long = Math.min(268435456L, l4);
      }
    }
  }
  
  public static long a(int paramInt)
  {
    try
    {
      Debug.MemoryInfo[] arrayOfMemoryInfo = ((ActivityManager)BaseApplicationImpl.getContext().getSystemService("activity")).getProcessMemoryInfo(new int[] { paramInt });
      if ((arrayOfMemoryInfo != null) && (arrayOfMemoryInfo.length > 0))
      {
        int i = arrayOfMemoryInfo[0].getTotalPss();
        return i * 1024L;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.Memory.MemoryManager", 2, "getMemory ex pid=" + paramInt, localException);
      }
    }
    return 62914560L;
  }
  
  public static MemoryManager a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppMemoryManager == null) {}
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqAppMemoryManager == null) {
        jdField_a_of_type_ComTencentMobileqqAppMemoryManager = new MemoryManager();
      }
      return jdField_a_of_type_ComTencentMobileqqAppMemoryManager;
    }
    finally {}
  }
  
  private mzk a()
  {
    if (jdField_a_of_type_Mzk == null)
    {
      jdField_a_of_type_Mzk = new mzk(this);
      jdField_a_of_type_Mzk.a();
    }
    return jdField_a_of_type_Mzk;
  }
  
  public void a()
  {
    b();
    c();
  }
  
  public void a(long paramLong1, long paramLong2)
  {
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      mzk localMzk = a();
      jdField_a_of_type_Long += paramLong2;
      jdField_b_of_type_Long += paramLong1;
      jdField_a_of_type_Int += 1;
      localMzk.c();
      return;
    }
  }
  
  public void a(Context paramContext, QQAppInterface paramQQAppInterface)
  {
    if ((paramQQAppInterface == null) || (i)) {}
    while (!ab) {
      return;
    }
    paramQQAppInterface.a(new mzj(paramQQAppInterface, paramContext, 2));
  }
  
  protected void b()
  {
    Object localObject1 = (ActivityManager)BaseApplicationImpl.getContext().getSystemService("activity");
    if (jdField_a_of_type_Mzl == null)
    {
      jdField_a_of_type_Mzl = new mzl(this);
      jdField_a_of_type_Mzl.a();
    }
    if (jdField_a_of_type_Mzl.jdField_b_of_type_Long == 0L) {
      jdField_a_of_type_Mzl.jdField_b_of_type_Long = DeviceInfoUtil.c();
    }
    if (jdField_a_of_type_Mzl.jdField_c_of_type_Long == 0L) {
      jdField_a_of_type_Mzl.jdField_c_of_type_Long = DeviceInfoUtil.e();
    }
    long l3 = DeviceInfoUtil.d();
    long l4 = a(Process.myPid());
    localObject1 = ((ActivityManager)localObject1).getRunningAppProcesses();
    long l1;
    Object localObject2;
    if (localObject1 != null)
    {
      localObject1 = ((List)localObject1).iterator();
      for (l1 = 0L;; l1 += a(pid))
      {
        l2 = l1;
        if (!((Iterator)localObject1).hasNext()) {
          break;
        }
        localObject2 = (ActivityManager.RunningAppProcessInfo)((Iterator)localObject1).next();
        String str = processName;
        if ((!str.startsWith("com.tencent.mobileqq")) || (str.equals("com.tencent.mobileqq"))) {
          break label1238;
        }
      }
    }
    long l2 = 0L;
    if ((l3 < 0L) || (l4 < 0L) || (l2 < 0L)) {}
    do
    {
      return;
      if (jdField_a_of_type_Mzl.jdField_a_of_type_Long == 0L) {
        jdField_a_of_type_Mzl.jdField_a_of_type_Long = System.currentTimeMillis();
      }
      localObject1 = jdField_a_of_type_Mzl;
      d = (l3 + d);
      localObject1 = jdField_a_of_type_Mzl;
      e = (l2 + e);
      localObject1 = jdField_a_of_type_Mzl;
      f += l4;
      localObject1 = jdField_a_of_type_Mzl;
      jdField_a_of_type_Int += 1;
      try
      {
        localObject1 = BaseApplicationImpl.a;
        localObject2 = jdField_a_of_type_Mzl;
        g += ((MQLruCache)localObject1).maxSize();
        localObject2 = jdField_a_of_type_Mzl;
        h += ((MQLruCache)localObject1).size();
        localObject2 = jdField_a_of_type_Mzl;
        jdField_c_of_type_Int += ((MQLruCache)localObject1).hitCount();
        localObject2 = jdField_a_of_type_Mzl;
        i = jdField_b_of_type_Int;
        jdField_b_of_type_Int = (((MQLruCache)localObject1).missCount() + i);
        l1 = System.currentTimeMillis();
        if (l1 - jdField_a_of_type_Mzl.jdField_a_of_type_Long <= 86400000L) {
          break label1040;
        }
        i = jdField_a_of_type_Mzl.jdField_a_of_type_Int;
        localObject1 = new HashMap();
        l2 = jdField_a_of_type_Mzl.jdField_b_of_type_Long / 1024L;
        if (l2 <= 0L) {
          throw new IllegalStateException("sysTotalMemory illegal");
        }
      }
      catch (IllegalStateException localIllegalStateException)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.Memory.MemoryManager", 2, "reportMemoryInfo exception", localIllegalStateException);
        }
        jdField_a_of_type_Mzl.b();
        jdField_a_of_type_Mzl.c();
        return;
        localIllegalStateException.put("sysTotalMemory", String.valueOf(l2));
        l2 = jdField_a_of_type_Mzl.jdField_c_of_type_Long / 1024L;
        if (l2 > 0L) {
          break;
        }
        throw new IllegalStateException("sysClassMemory illegal");
      }
      catch (Exception localException) {}
    } while (!QLog.isColorLevel());
    QLog.d("Q.Memory.MemoryManager", 2, "reportMemoryInfo exception", localException);
    return;
    localException.put("sysClassMemory", String.valueOf(l2));
    l2 = jdField_a_of_type_Mzl.d / (i * 1024);
    if (l2 <= 0L) {
      throw new IllegalStateException("sysAvailableMemory illegal");
    }
    localException.put("sysAvailableMemory", String.valueOf(l2));
    l2 = jdField_a_of_type_Mzl.e / (i * 1024);
    if (l2 < 0L) {
      throw new IllegalStateException("qqOtherUsedMemory illegal");
    }
    localException.put("qqOtherUsedMemory", String.valueOf(l2));
    l2 = jdField_a_of_type_Mzl.f / (i * 1024);
    if (l2 <= 0L) {
      throw new IllegalStateException("qqUsedMemory illegal");
    }
    localException.put("qqUsedMemory", String.valueOf(l2));
    l2 = jdField_a_of_type_Mzl.g / (i * 1024);
    if (l2 < 0L) {
      throw new IllegalStateException("imageCacheMax illegal");
    }
    localException.put("imageCacheMax", String.valueOf(l2));
    l2 = jdField_a_of_type_Mzl.h / (i * 1024);
    if (l2 < 0L) {
      throw new IllegalStateException("imageCacheUsed illegal");
    }
    localException.put("imageCacheUsed", String.valueOf(l2));
    l2 = jdField_a_of_type_Mzl.jdField_c_of_type_Int / i;
    if (l2 < 0L) {
      throw new IllegalStateException("imageHitCount illegal");
    }
    localException.put("imageHitCount", String.valueOf(l2));
    if (jdField_a_of_type_Mzl.jdField_c_of_type_Int + jdField_a_of_type_Mzl.jdField_b_of_type_Int != 0) {}
    for (int i = jdField_a_of_type_Mzl.jdField_c_of_type_Int * 100 / (jdField_a_of_type_Mzl.jdField_c_of_type_Int + jdField_a_of_type_Mzl.jdField_b_of_type_Int);; i = 0)
    {
      l2 = i;
      if (l2 < 0L) {
        throw new IllegalStateException("imageHitRate illegal");
      }
      localException.put("imageHitRate", String.valueOf(l2));
      localException.put("guardConfigId", mye.a().a());
      localException.put("memoryConfigId", aa);
      localException.put("osVersion", Build.VERSION.RELEASE);
      localException.put("resolution", DeviceInfoUtil.l());
      StatisticCollector.a(BaseApplicationImpl.a()).a(null, "actMemory", true, 0L, 0L, localException, null);
      jdField_a_of_type_Mzl.jdField_a_of_type_Long = l1;
      jdField_a_of_type_Mzl.b();
      label1040:
      if (QLog.isColorLevel()) {
        QLog.d("Q.Memory.MemoryManager", 2, "reportMemoryInfo, startTime=" + jdField_a_of_type_Mzl.jdField_a_of_type_Long + ", statCount=" + jdField_a_of_type_Mzl.jdField_a_of_type_Int + ", sysTotalMemory=" + jdField_a_of_type_Mzl.jdField_b_of_type_Long + ", sysAvailableMemory=" + jdField_a_of_type_Mzl.d + ", qqOtherUsedMemory=" + jdField_a_of_type_Mzl.e + ", qqUsedMemory=" + jdField_a_of_type_Mzl.f + ",imageCacheMax=" + jdField_a_of_type_Mzl.g + ",imageCacheUsed=" + jdField_a_of_type_Mzl.h + ",imageHitCount=" + jdField_a_of_type_Mzl.jdField_c_of_type_Int + ",imageHitTotal=" + (jdField_a_of_type_Mzl.jdField_c_of_type_Int + jdField_a_of_type_Mzl.jdField_b_of_type_Int));
      }
      jdField_a_of_type_Mzl.c();
      return;
      label1238:
      break;
    }
  }
  
  public void b(long paramLong1, long paramLong2)
  {
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      mzk localMzk = a();
      jdField_c_of_type_Long += paramLong2;
      d += paramLong1;
      jdField_b_of_type_Int += 1;
      localMzk.c();
      return;
    }
  }
  
  protected void c()
  {
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      localMzk = a();
      l1 = System.currentTimeMillis();
      long l2 = e;
      if (l1 - l2 > 86400000L) {}
      for (;;)
      {
        try
        {
          i = jdField_a_of_type_Int;
          j = jdField_b_of_type_Int;
          HashMap localHashMap = new HashMap();
          localHashMap.put("sysTotalMemory", String.valueOf(DeviceInfoUtil.c() / 1024L));
          if (i != 0) {
            continue;
          }
          str = "0";
          localHashMap.put("lowWarningMemory", str);
          if (i != 0) {
            continue;
          }
          str = "0";
          localHashMap.put("lowRemainMemory", str);
          localHashMap.put("lowMemoryCount", String.valueOf(i));
          if (j != 0) {
            continue;
          }
          str = "0";
          localHashMap.put("clearWarningMemory", str);
          if (j != 0) {
            continue;
          }
          str = "0";
          localHashMap.put("clearRemainMemory", str);
          localHashMap.put("clearCount", String.valueOf(j));
          StatisticCollector.a(BaseApplicationImpl.a()).a(null, "LowMemoryStat", true, 0L, 0L, localHashMap, null);
          if (QLog.isColorLevel()) {
            QLog.d("Q.Memory.MemoryManager", 2, "reportLowMemory, sysTotalMemory=" + String.valueOf(DeviceInfoUtil.c() / 1024L) + ", lowWarningMemory=" + jdField_b_of_type_Long + ", lowRemainMemory=" + jdField_a_of_type_Long + ", lowMemoryCount=" + i + ", clearWarningMemory=" + d + ", clearRemainMemory=" + jdField_c_of_type_Long + ",clearCount=" + j);
          }
        }
        catch (Exception localException)
        {
          int i;
          int j;
          String str;
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.d("Q.Memory.MemoryManager", 2, "reportMemoryInfo exception", localException);
          localMzk.b();
          e = l1;
          continue;
          localObject1 = finally;
          throw localObject1;
        }
        finally
        {
          localMzk.b();
          e = l1;
        }
        localMzk.c();
        return;
        str = String.valueOf(jdField_b_of_type_Long / (i * 1024));
        continue;
        str = String.valueOf(jdField_a_of_type_Long / (i * 1024));
        continue;
        str = String.valueOf(d / (j * 1024));
      }
      l2 = jdField_c_of_type_Long / (j * 1024);
      str = String.valueOf(l2);
    }
  }
}
