package com.tencent.mobileqq.app.automator;

import android.os.Process;
import android.os.SystemClock;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.TraceUtils;

public class AsyncStep
  implements Runnable
{
  public static final int a = 2;
  protected static final long a = 30000L;
  protected static final String a = "QQInitHandler";
  public static final int b = 4;
  public static final int c = 5;
  public static final int d = 6;
  public static final int e = 7;
  public static final int f = 8;
  private static final int j = 1;
  private static final int k = 3;
  protected Automator a;
  protected IResultListener a;
  private Object a;
  protected boolean a;
  protected long b;
  protected String b;
  protected volatile int g;
  protected int h;
  protected int i;
  
  public AsyncStep()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    g = 1;
    jdField_b_of_type_Long = 30000L;
    h = -1;
    i = 0;
    jdField_a_of_type_JavaLangObject = new Object();
    jdField_a_of_type_Boolean = true;
  }
  
  private boolean a()
  {
    for (;;)
    {
      int m;
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        m = g;
        if (m != 2) {}
      }
      try
      {
        jdField_a_of_type_JavaLangObject.wait(jdField_b_of_type_Long);
        if (QLog.isColorLevel()) {
          QLog.d("QQInitHandler", 2, jdField_b_of_type_JavaLangString + " waitResult " + g + " " + i);
        }
        if (g == 3)
        {
          g = 2;
          continue;
          localObject2 = finally;
          throw localObject2;
        }
      }
      catch (InterruptedException localInterruptedException)
      {
        for (;;)
        {
          localInterruptedException.printStackTrace();
        }
        if (g == 2)
        {
          if (!jdField_a_of_type_Boolean) {}
          g = 5;
          Automator localAutomator = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator;
          e += 1;
        }
        else if ((g == 6) || (g == 5))
        {
          m = i;
          i = (m - 1);
          if (m > 0)
          {
            g = 1;
            return true;
          }
        }
      }
    }
    return false;
  }
  
  private boolean b()
  {
    return (jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.e) || (NetConnInfoCenter.socketConnState == 4) || (NetConnInfoCenter.socketConnState == 2) || (NetworkUtil.e(BaseApplicationImpl.a));
  }
  
  public int a()
  {
    if (QLog.isColorLevel()) {
      QLog.e("QQInitHandler", 2, jdField_b_of_type_JavaLangString + " AsyncStep.doStep()");
    }
    return 7;
  }
  
  public void a() {}
  
  public void a(int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, jdField_b_of_type_JavaLangString + " setResult " + paramInt + ", when " + g + ", " + jdField_a_of_type_Boolean);
    }
    if ((jdField_a_of_type_Boolean) && (paramInt == 4)) {
      return;
    }
    if (paramInt == 6)
    {
      ??? = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator;
      e += 1;
    }
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        if (paramInt > g)
        {
          if ((g == 2) && (paramInt == 4) && (!jdField_a_of_type_Boolean))
          {
            i += 1;
            jdField_a_of_type_Boolean = true;
            g = 2;
          }
        }
        else
        {
          jdField_a_of_type_JavaLangObject.notifyAll();
          return;
        }
      }
      g = paramInt;
      if (g == 2) {
        jdField_a_of_type_Boolean = b();
      }
    }
  }
  
  public final void a(long paramLong)
  {
    if (QLog.isColorLevel())
    {
      ??? = new StringBuilder(64);
      ((StringBuilder)???).append(jdField_b_of_type_JavaLangString);
      ((StringBuilder)???).append(" updateTimeout ");
      ((StringBuilder)???).append(paramLong);
      ((StringBuilder)???).append(", when ");
      ((StringBuilder)???).append(g);
      QLog.d("QQInitHandler", 2, ((StringBuilder)???).toString());
    }
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      if (3 > g) {
        g = 3;
      }
      jdField_b_of_type_Long = paramLong;
      jdField_a_of_type_JavaLangObject.notifyAll();
      return;
    }
  }
  
  public void b() {}
  
  public final void run()
  {
    long l;
    if (g == 1)
    {
      l = 0L;
      TraceUtils.a(4096L, jdField_b_of_type_JavaLangString, Process.myTid());
      if (QLog.isColorLevel())
      {
        l = SystemClock.uptimeMillis();
        QLog.d("QQInitHandler", 2, jdField_b_of_type_JavaLangString + " begin with " + g);
      }
    }
    try
    {
      a();
      do
      {
        a(a());
      } while (a());
      b();
      return;
    }
    catch (Throwable localThrowable)
    {
      QLog.e("QQInitHandler", 1, "", localThrowable);
      a(8);
      return;
    }
    finally
    {
      if (QLog.isColorLevel()) {
        QLog.d("QQInitHandler", 2, jdField_b_of_type_JavaLangString + " cost: " + (SystemClock.uptimeMillis() - l));
      }
      TraceUtils.b(4096L, jdField_b_of_type_JavaLangString, Process.myTid());
      if (jdField_a_of_type_ComTencentMobileqqAppAutomatorIResultListener != null) {
        jdField_a_of_type_ComTencentMobileqqAppAutomatorIResultListener.a(this, g);
      }
    }
  }
}
