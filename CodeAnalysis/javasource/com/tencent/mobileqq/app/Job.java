package com.tencent.mobileqq.app;

import android.os.SystemClock;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;

public class Job
  extends WeakReference
  implements Comparable, Runnable
{
  private static final String jdField_b_of_type_JavaLangString = "Job";
  public int a;
  public long a;
  public ThreadExcutor.IThreadListener a;
  public Runnable a;
  public String a;
  private boolean a;
  public int b;
  public long b;
  private boolean jdField_b_of_type_Boolean;
  public long c;
  private boolean c;
  public long d;
  private boolean d;
  public long e;
  public long f;
  
  Job(Object paramObject, Runnable paramRunnable, boolean paramBoolean)
  {
    super(paramObject);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Long = 0L;
    jdField_a_of_type_Int = 0;
    jdField_b_of_type_Long = 0L;
    jdField_c_of_type_Long = -1L;
    jdField_d_of_type_Long = -1L;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = true;
    jdField_d_of_type_Boolean = false;
    e = -1L;
    f = -1L;
    jdField_b_of_type_Int = -1;
    if (paramObject != null) {
      jdField_b_of_type_Boolean = true;
    }
    jdField_a_of_type_JavaLangRunnable = paramRunnable;
    jdField_a_of_type_Boolean = paramBoolean;
  }
  
  Job(Object paramObject, String paramString, int paramInt, Runnable paramRunnable, ThreadExcutor.IThreadListener paramIThreadListener, boolean paramBoolean)
  {
    super(paramObject);
    jdField_a_of_type_Long = 0L;
    jdField_a_of_type_Int = 0;
    jdField_b_of_type_Long = 0L;
    jdField_c_of_type_Long = -1L;
    jdField_d_of_type_Long = -1L;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = true;
    jdField_d_of_type_Boolean = false;
    e = -1L;
    f = -1L;
    jdField_b_of_type_Int = -1;
    if (paramObject != null) {
      jdField_b_of_type_Boolean = true;
    }
    jdField_a_of_type_JavaLangString = paramString;
    jdField_a_of_type_Int = paramInt;
    jdField_a_of_type_JavaLangRunnable = paramRunnable;
    jdField_a_of_type_ComTencentMobileqqAppThreadExcutor$IThreadListener = paramIThreadListener;
    jdField_b_of_type_Long = SystemClock.uptimeMillis();
    jdField_a_of_type_Boolean = paramBoolean;
  }
  
  public int a(Job paramJob)
  {
    if (jdField_a_of_type_Int > jdField_a_of_type_Int) {
      return -1;
    }
    return 1;
  }
  
  public boolean a()
  {
    Object localObject;
    if (jdField_a_of_type_Boolean) {
      if (jdField_b_of_type_Boolean)
      {
        localObject = get();
        if (localObject == null) {}
      }
    }
    for (;;)
    {
      try
      {
        Field localField = jdField_a_of_type_JavaLangRunnable.getClass().getDeclaredField("this$0");
        localField.setAccessible(true);
        localField.set(jdField_a_of_type_JavaLangRunnable, localObject);
        jdField_c_of_type_Boolean = true;
        jdField_d_of_type_Boolean = true;
        return jdField_c_of_type_Boolean;
      }
      catch (NoSuchFieldException localNoSuchFieldException)
      {
        jdField_c_of_type_Boolean = false;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("Job", 2, jdField_a_of_type_JavaLangString + localNoSuchFieldException + "shouldRun is false");
        continue;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        jdField_c_of_type_Boolean = false;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("Job", 2, jdField_a_of_type_JavaLangString + localIllegalArgumentException + "shouldRun is false");
        continue;
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        jdField_c_of_type_Boolean = false;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("Job", 2, jdField_a_of_type_JavaLangString + localIllegalAccessException + "shouldRun is false");
        continue;
      }
      if (QLog.isColorLevel()) {
        QLog.d("Job", 2, jdField_a_of_type_JavaLangString + " never run, becuse outer object is retrieve already");
      }
      jdField_c_of_type_Boolean = false;
      continue;
      jdField_c_of_type_Boolean = true;
      continue;
      jdField_c_of_type_Boolean = true;
    }
  }
  
  public boolean b()
  {
    return jdField_c_of_type_Boolean;
  }
  
  public void clear() {}
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      do
      {
        return true;
        if (paramObject == null) {
          return false;
        }
        if (getClass() != paramObject.getClass()) {
          return false;
        }
        paramObject = (Job)paramObject;
        if (jdField_a_of_type_JavaLangRunnable != null) {
          break;
        }
      } while (jdField_a_of_type_JavaLangRunnable == null);
      return false;
    } while (jdField_a_of_type_JavaLangRunnable.equals(jdField_a_of_type_JavaLangRunnable));
    return false;
  }
  
  public int hashCode()
  {
    if (jdField_a_of_type_JavaLangRunnable == null) {}
    for (int i = 0;; i = jdField_a_of_type_JavaLangRunnable.hashCode()) {
      return i + 31;
    }
  }
  
  public void run()
  {
    if (jdField_c_of_type_Boolean) {
      jdField_a_of_type_JavaLangRunnable.run();
    }
    while (!QLog.isColorLevel()) {
      return;
    }
    QLog.d("Job", 2, jdField_a_of_type_JavaLangString + " shouldRun is false");
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(256);
    localStringBuilder.append(" cost=").append(jdField_c_of_type_Long).append(", ").append(jdField_a_of_type_JavaLangString).append("|pool-").append(jdField_b_of_type_Int).append("|t-id=").append(jdField_a_of_type_Long).append("|priority=").append(jdField_a_of_type_Int).append("|wait=").append(jdField_d_of_type_Long).append("|postCost=").append(f);
    return localStringBuilder.toString();
  }
}
