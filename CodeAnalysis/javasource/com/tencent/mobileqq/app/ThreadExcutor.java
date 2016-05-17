package com.tencent.mobileqq.app;

import android.os.Build.VERSION;
import android.os.HandlerThread;
import android.os.SystemClock;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.Iterator;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.SynchronousQueue;
import mqq.os.MqqHandler;
import nco;
import nfs;
import nft;
import nfu;
import nfv;
import nfw;
import nfx;
import ngd;

public class ThreadExcutor
{
  public static final int a = 5000;
  private static final ThreadExcutor jdField_a_of_type_ComTencentMobileqqAppThreadExcutor = new ThreadExcutor();
  private static volatile MqqHandler jdField_a_of_type_MqqOsMqqHandler;
  public static boolean a = false;
  public static final int b = 15;
  public static int c = 0;
  public static int e = 0;
  private static final int f = 1;
  private static final int g = 2;
  private static final int h = 5;
  private LinkedBlockingQueue jdField_a_of_type_JavaUtilConcurrentLinkedBlockingQueue = new LinkedBlockingQueue();
  private nco jdField_a_of_type_Nco = new nco("GlobalPool-L", 8);
  private nfv jdField_a_of_type_Nfv = new nft(this);
  private ngd jdField_a_of_type_Ngd;
  private nco jdField_b_of_type_Nco = new nco("GlobalPool-H", 5);
  private ngd jdField_b_of_type_Ngd;
  private nco jdField_c_of_type_Nco = new nco("GlobalPool-Download", 2);
  private ngd jdField_c_of_type_Ngd;
  public int d = 0;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_c_of_type_Int = 1000;
    jdField_a_of_type_Boolean = false;
    e = 0;
  }
  
  private ThreadExcutor()
  {
    ThreadManager.d = false;
    if (QLog.isColorLevel()) {
      QLog.i("TM.global", 2, "ThreadExcutor singleton construct");
    }
    b();
    a();
  }
  
  private Job a(int paramInt, Runnable paramRunnable, ThreadExcutor.IThreadListener paramIThreadListener, boolean paramBoolean)
  {
    Object localObject5 = null;
    Object localObject6 = null;
    Object localObject7 = null;
    localObject1 = null;
    Object localObject8 = paramRunnable.getClass();
    String str = ((Class)localObject8).getName();
    Object localObject3;
    if (paramBoolean)
    {
      localObject2 = localObject5;
      localObject3 = localObject6;
      localObject4 = localObject7;
    }
    try
    {
      localObject8 = ((Class)localObject8).getDeclaredField("this$0");
      localObject2 = localObject5;
      localObject3 = localObject6;
      localObject4 = localObject7;
      ((Field)localObject8).setAccessible(true);
      localObject2 = localObject5;
      localObject3 = localObject6;
      localObject4 = localObject7;
      localObject1 = ((Field)localObject8).get(paramRunnable);
      localObject2 = localObject1;
      localObject3 = localObject1;
      localObject4 = localObject1;
      ((Field)localObject8).set(paramRunnable, null);
    }
    catch (NoSuchFieldException localNoSuchFieldException)
    {
      for (;;)
      {
        if (!ThreadManager.b)
        {
          localObject1 = localObject2;
          if (!ThreadManager.jdField_a_of_type_Boolean) {}
        }
        else
        {
          localObject1 = localObject2;
          if (QLog.isColorLevel())
          {
            QLog.d("TM.global", 2, "NoSuchFieldException", localNoSuchFieldException);
            localObject1 = localObject2;
          }
        }
      }
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      for (;;)
      {
        if (!ThreadManager.b)
        {
          localObject1 = localNoSuchFieldException;
          if (!ThreadManager.jdField_a_of_type_Boolean) {}
        }
        else
        {
          localObject1 = localNoSuchFieldException;
          if (QLog.isColorLevel())
          {
            QLog.d("TM.global", 2, "IllegalArgumentException", localIllegalArgumentException);
            localObject1 = localNoSuchFieldException;
          }
        }
      }
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      for (;;)
      {
        if (!ThreadManager.b)
        {
          localObject1 = localObject4;
          if (!ThreadManager.jdField_a_of_type_Boolean) {}
        }
        else
        {
          localObject1 = localObject4;
          if (QLog.isColorLevel())
          {
            QLog.d("TM.global", 2, "IllegalAccessException", localIllegalAccessException);
            localObject1 = localObject4;
          }
        }
      }
    }
    return new Job(localObject1, str, paramInt, paramRunnable, paramIThreadListener, paramBoolean);
  }
  
  private Job a(Runnable paramRunnable)
  {
    return a(0, paramRunnable, null, false);
  }
  
  public static ThreadExcutor a()
  {
    return jdField_a_of_type_ComTencentMobileqqAppThreadExcutor;
  }
  
  private MqqHandler a()
  {
    if (jdField_a_of_type_MqqOsMqqHandler == null)
    {
      HandlerThread localHandlerThread = a("QQ_DISPATCHER", 0);
      localHandlerThread.start();
      jdField_a_of_type_MqqOsMqqHandler = new MqqHandler(localHandlerThread.getLooper());
    }
    return jdField_a_of_type_MqqOsMqqHandler;
  }
  
  private boolean a(Job paramJob)
  {
    return jdField_b_of_type_Ngd.remove(paramJob);
  }
  
  private void b()
  {
    if (jdField_a_of_type_Ngd == null)
    {
      jdField_a_of_type_Ngd = new nfx(new SynchronousQueue(true), jdField_a_of_type_Nco);
      jdField_a_of_type_Ngd.a(jdField_a_of_type_JavaUtilConcurrentLinkedBlockingQueue, jdField_a_of_type_Nfv);
    }
    if (jdField_b_of_type_Ngd == null)
    {
      jdField_b_of_type_Ngd = new nfw(new LinkedBlockingQueue(15), jdField_b_of_type_Nco);
      jdField_b_of_type_Ngd.a(jdField_a_of_type_JavaUtilConcurrentLinkedBlockingQueue, jdField_a_of_type_Nfv);
      if (Build.VERSION.SDK_INT > 8) {
        jdField_b_of_type_Ngd.allowCoreThreadTimeOut(true);
      }
    }
    if (jdField_c_of_type_Ngd == null)
    {
      jdField_c_of_type_Ngd = new nfs(new LinkedBlockingQueue(128), jdField_c_of_type_Nco);
      jdField_c_of_type_Ngd.a(jdField_a_of_type_JavaUtilConcurrentLinkedBlockingQueue, jdField_a_of_type_Nfv);
      if (Build.VERSION.SDK_INT > 8) {
        jdField_c_of_type_Ngd.allowCoreThreadTimeOut(true);
      }
    }
  }
  
  private boolean b(Job paramJob)
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentLinkedBlockingQueue.iterator();
    while (localIterator.hasNext())
    {
      Job localJob = (Job)((WeakReference)localIterator.next()).get();
      if ((localJob != null) && (localJob.equals(paramJob))) {
        return true;
      }
    }
    return false;
  }
  
  private boolean c(Job paramJob)
  {
    Iterator localIterator = jdField_b_of_type_Ngd.getQueue().iterator();
    long l = SystemClock.uptimeMillis();
    while (localIterator.hasNext())
    {
      Job localJob = (Job)localIterator.next();
      e = (l - jdField_b_of_type_Long);
      if ((jdField_a_of_type_Int <= jdField_a_of_type_Int) && (e >= 5000L))
      {
        if (jdField_a_of_type_Nfv != null) {
          jdField_a_of_type_Nfv.b(localJob);
        }
        int i = jdField_b_of_type_Ngd.getCorePoolSize() + 1;
        if (i < 256) {
          jdField_b_of_type_Ngd.setCorePoolSize(i);
        }
      }
    }
    return false;
  }
  
  public HandlerThread a(String paramString, int paramInt)
  {
    return new HandlerThread(paramString, paramInt);
  }
  
  String a()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("\n").append(jdField_a_of_type_Ngd.toString());
    localStringBuilder.append("\n").append(jdField_b_of_type_Ngd.toString());
    localStringBuilder.append("\n").append(jdField_c_of_type_Ngd.toString());
    Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentLinkedBlockingQueue.iterator();
    while (localIterator.hasNext())
    {
      Job localJob = (Job)((WeakReference)localIterator.next()).get();
      if (localJob != null) {
        localStringBuilder.append("\nrunning job: " + localJob.toString());
      }
    }
    return localStringBuilder.toString();
  }
  
  Thread a(Runnable paramRunnable, String paramString, int paramInt)
  {
    paramRunnable = new Thread(paramRunnable, paramString);
    paramRunnable.setPriority(paramInt);
    return paramRunnable;
  }
  
  Executor a(ThreadPoolParams paramThreadPoolParams)
  {
    ThreadPoolParams localThreadPoolParams = paramThreadPoolParams;
    if (paramThreadPoolParams == null) {
      localThreadPoolParams = new ThreadPoolParams();
    }
    paramThreadPoolParams = new nco(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int);
    paramThreadPoolParams = new ngd(jdField_b_of_type_Int, jdField_c_of_type_Int, d, jdField_a_of_type_JavaUtilConcurrentBlockingQueue, paramThreadPoolParams);
    paramThreadPoolParams.a(jdField_a_of_type_JavaUtilConcurrentLinkedBlockingQueue, jdField_a_of_type_Nfv);
    if (Build.VERSION.SDK_INT > 8) {
      paramThreadPoolParams.allowCoreThreadTimeOut(true);
    }
    return paramThreadPoolParams;
  }
  
  void a() {}
  
  void a(int paramInt, Runnable paramRunnable, ThreadExcutor.IThreadListener paramIThreadListener, boolean paramBoolean)
  {
    if (paramRunnable == null) {
      throw new IllegalArgumentException();
    }
    if (paramInt >= 8)
    {
      a(paramRunnable, paramIThreadListener, paramBoolean);
      return;
    }
    paramRunnable = new nfu(this, a(paramInt, paramRunnable, paramIThreadListener, paramBoolean));
    jdField_a_of_type_MqqOsMqqHandler.post(paramRunnable);
  }
  
  void a(Runnable paramRunnable, ThreadExcutor.IThreadListener paramIThreadListener, boolean paramBoolean)
  {
    if (paramRunnable == null) {
      throw new IllegalArgumentException();
    }
    paramRunnable = a(10, paramRunnable, paramIThreadListener, paramBoolean);
    jdField_b_of_type_Int = 1;
    jdField_a_of_type_Ngd.b(paramRunnable);
  }
  
  boolean a(Runnable paramRunnable)
  {
    if (paramRunnable == null) {
      try
      {
        throw new IllegalArgumentException();
      }
      catch (Exception paramRunnable)
      {
        QLog.d("TM.global", 2, "remove task error happen!");
      }
    }
    do
    {
      do
      {
        return false;
        paramRunnable = a(paramRunnable);
        if (!b(paramRunnable)) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.d("TM.global", 2, "cannot do it!-remove -in running queue");
      return false;
      if (a(paramRunnable))
      {
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("TM.global", 2, "remove in Blocking queue successfully.");
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("TM.global", 2, "remove in Blocking queue error.");
    return false;
    return true;
  }
  
  void b(int paramInt, Runnable paramRunnable, ThreadExcutor.IThreadListener paramIThreadListener, boolean paramBoolean)
  {
    if (paramRunnable == null) {
      throw new IllegalArgumentException();
    }
    paramRunnable = a(paramInt, paramRunnable, paramIThreadListener, paramBoolean);
    jdField_b_of_type_Int = 5;
    jdField_c_of_type_Ngd.a(paramRunnable);
  }
}
