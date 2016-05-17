package com.tencent.mobileqq.app;

import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.lang.reflect.Field;
import java.util.Timer;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import mqq.os.MqqHandler;
import nfz;
import nga;
import ngb;
import ngc;

public class ThreadManager
{
  private static Handler jdField_a_of_type_AndroidOsHandler;
  private static HandlerThread jdField_a_of_type_AndroidOsHandlerThread;
  public static final String a = "TM.global";
  private static Timer jdField_a_of_type_JavaUtilTimer;
  private static Executor jdField_a_of_type_JavaUtilConcurrentExecutor = new ThreadPoolExecutor(5, 9, 1L, TimeUnit.SECONDS, new LinkedBlockingQueue(256), new ngb());
  private static volatile MqqHandler jdField_a_of_type_MqqOsMqqHandler;
  public static boolean a = false;
  private static HandlerThread jdField_b_of_type_AndroidOsHandlerThread;
  public static final String b = "AutoMonitor";
  private static volatile MqqHandler jdField_b_of_type_MqqOsMqqHandler;
  public static boolean b = false;
  protected static final String c = "sp_reject_exception_report";
  private static volatile MqqHandler c;
  public static final boolean c = false;
  private static final String d = "ap_reject_exception_report";
  public static volatile boolean d;
  public static final boolean e = false;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    d = false;
    c();
    d();
  }
  
  public ThreadManager() {}
  
  public static HandlerThread a(String paramString, int paramInt)
  {
    return ThreadExcutor.a().a(paramString, paramInt);
  }
  
  public static Looper a()
  {
    return a().getLooper();
  }
  
  public static String a()
  {
    return ThreadExcutor.a().a();
  }
  
  public static Thread a()
  {
    if (jdField_b_of_type_AndroidOsHandlerThread == null) {
      a();
    }
    return jdField_b_of_type_AndroidOsHandlerThread;
  }
  
  public static Thread a(Runnable paramRunnable, String paramString, int paramInt)
  {
    return ThreadExcutor.a().a(paramRunnable, paramString, paramInt);
  }
  
  public static Timer a()
  {
    if (jdField_a_of_type_JavaUtilTimer == null) {}
    try
    {
      jdField_a_of_type_JavaUtilTimer = new ngc("QQ_Timer");
      return jdField_a_of_type_JavaUtilTimer;
    }
    finally {}
  }
  
  public static Executor a()
  {
    return Executors.newSingleThreadExecutor(new nga());
  }
  
  public static Executor a(ThreadPoolParams paramThreadPoolParams)
  {
    return ThreadExcutor.a().a(paramThreadPoolParams);
  }
  
  public static MqqHandler a()
  {
    if (c == null) {}
    try
    {
      if (c == null)
      {
        jdField_b_of_type_AndroidOsHandlerThread = a("QQ_FILE_RW", 0);
        jdField_b_of_type_AndroidOsHandlerThread.start();
        c = new MqqHandler(jdField_b_of_type_AndroidOsHandlerThread.getLooper());
      }
      return c;
    }
    finally {}
  }
  
  public static void a()
  {
    if (QLog.isColorLevel()) {
      QLog.i("TM.global", 2, "ThreadManager init");
    }
    ThreadExcutor.a();
  }
  
  public static void a(Runnable paramRunnable, int paramInt, ThreadExcutor.IThreadListener paramIThreadListener, boolean paramBoolean)
  {
    ThreadExcutor.a().a(paramInt, paramRunnable, paramIThreadListener, paramBoolean);
  }
  
  public static void a(Runnable paramRunnable, ThreadExcutor.IThreadListener paramIThreadListener, boolean paramBoolean)
  {
    ThreadExcutor.a().a(paramRunnable, paramIThreadListener, paramBoolean);
  }
  
  public static boolean a(Runnable paramRunnable)
  {
    return ThreadExcutor.a().a(paramRunnable);
  }
  
  public static Looper b()
  {
    return b().getLooper();
  }
  
  public static Thread b()
  {
    if (jdField_a_of_type_AndroidOsHandlerThread == null) {
      b();
    }
    return jdField_a_of_type_AndroidOsHandlerThread;
  }
  
  public static Executor b()
  {
    return jdField_a_of_type_JavaUtilConcurrentExecutor;
  }
  
  public static MqqHandler b()
  {
    if (jdField_b_of_type_MqqOsMqqHandler == null) {}
    try
    {
      if (jdField_b_of_type_MqqOsMqqHandler == null)
      {
        jdField_a_of_type_AndroidOsHandlerThread = a("QQ_SUB", 0);
        jdField_a_of_type_AndroidOsHandlerThread.start();
        jdField_b_of_type_MqqOsMqqHandler = new MqqHandler(jdField_a_of_type_AndroidOsHandlerThread.getLooper());
      }
      return jdField_b_of_type_MqqOsMqqHandler;
    }
    finally {}
  }
  
  public static void b()
  {
    ThreadExcutor.a().a();
  }
  
  public static void b(Runnable paramRunnable)
  {
    b().post(paramRunnable);
  }
  
  public static void b(Runnable paramRunnable, int paramInt, ThreadExcutor.IThreadListener paramIThreadListener, boolean paramBoolean)
  {
    ThreadExcutor.a().b(paramInt, paramRunnable, paramIThreadListener, paramBoolean);
  }
  
  public static Looper c()
  {
    if (jdField_a_of_type_AndroidOsHandler == null) {}
    try
    {
      HandlerThread localHandlerThread = a("Recent_Handler", 0);
      localHandlerThread.start();
      jdField_a_of_type_AndroidOsHandler = new Handler(localHandlerThread.getLooper());
      return jdField_a_of_type_AndroidOsHandler.getLooper();
    }
    finally {}
  }
  
  public static MqqHandler c()
  {
    if (jdField_a_of_type_MqqOsMqqHandler == null) {}
    try
    {
      if (jdField_a_of_type_MqqOsMqqHandler == null) {
        jdField_a_of_type_MqqOsMqqHandler = new MqqHandler(Looper.getMainLooper(), null, true);
      }
      return jdField_a_of_type_MqqOsMqqHandler;
    }
    finally {}
  }
  
  private static void c()
  {
    Runtime.getRuntime().addShutdownHook(new nfz());
  }
  
  public static void c(Runnable paramRunnable)
  {
    a().post(paramRunnable);
  }
  
  private static void d()
  {
    Object localObject;
    if (Build.VERSION.SDK_INT >= 11) {
      localObject = AsyncTask.THREAD_POOL_EXECUTOR;
    }
    for (;;)
    {
      if ((localObject instanceof ThreadPoolExecutor)) {
        ((ThreadPoolExecutor)localObject).setRejectedExecutionHandler(new ThreadManager.ShowQueueAbortPolicy());
      }
      return;
      try
      {
        localObject = AsyncTask.class.getDeclaredField("sExecutor");
        ((Field)localObject).setAccessible(true);
        localObject = (Executor)((Field)localObject).get(null);
      }
      catch (Exception localException)
      {
        if (QLog.isColorLevel()) {
          QLog.e("TM.global", 2, localException.getMessage(), localException);
        }
        ThreadPoolExecutor localThreadPoolExecutor = new ThreadPoolExecutor(1, 1, 0L, TimeUnit.SECONDS, new LinkedBlockingQueue());
      }
    }
  }
  
  public static void d(Runnable paramRunnable)
  {
    a(paramRunnable, 5, null, false);
  }
}
