package com.tencent.mobileqq.app;

import android.os.Looper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.UnifiedMonitor;
import mqq.os.MqqMessageQueue;
import mqq.util.AbstractUnifiedMonitor.ThreadMonitorCallback;
import mzh;
import mzi;
import nfy;

public class LooperMonitorHelper
{
  public static int a = 0;
  private static final String jdField_a_of_type_JavaLangString = "AutoMonitor";
  private static AbstractUnifiedMonitor.ThreadMonitorCallback jdField_a_of_type_MqqUtilAbstractUnifiedMonitor$ThreadMonitorCallback = new mzh();
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 100;
  }
  
  public LooperMonitorHelper() {}
  
  public static void a()
  {
    if (!UnifiedMonitor.a().whetherReportDuringThisStartup(0)) {
      return;
    }
    int i = UnifiedMonitor.a().getThreshold(0);
    UnifiedMonitor.a().setMonitoredThread(0, Looper.getMainLooper().getThread(), jdField_a_of_type_MqqUtilAbstractUnifiedMonitor$ThreadMonitorCallback);
    mzi localMzi = new mzi(0);
    localMzi.a(i, false);
    Looper.getMainLooper().setMessageLogging(localMzi);
    MqqMessageQueue.getSubMainThreadQueue().setMessageLogging(localMzi);
  }
  
  public static void b()
  {
    if (!UnifiedMonitor.a().whetherReportDuringThisStartup(4)) {
      return;
    }
    int i = UnifiedMonitor.a().getThreshold(4);
    UnifiedMonitor.a().setMonitoredThread(4, ThreadManager.b(), jdField_a_of_type_MqqUtilAbstractUnifiedMonitor$ThreadMonitorCallback);
    nfy localNfy = new nfy(4, "SubLooper");
    localNfy.a(i, false);
    ThreadManager.b().setMessageLogging(localNfy);
  }
  
  public static void c()
  {
    if (!UnifiedMonitor.a().whetherReportDuringThisStartup(5)) {
      return;
    }
    int i = UnifiedMonitor.a().getThreshold(5);
    UnifiedMonitor.a().setMonitoredThread(5, ThreadManager.a(), jdField_a_of_type_MqqUtilAbstractUnifiedMonitor$ThreadMonitorCallback);
    nfy localNfy = new nfy(5, "FileLooper");
    localNfy.a(i, false);
    ThreadManager.a().setMessageLogging(localNfy);
  }
  
  public static void d()
  {
    if (!UnifiedMonitor.a().whetherReportDuringThisStartup(6))
    {
      ThreadExcutor.a = false;
      return;
    }
    ThreadExcutor.a = true;
    ThreadExcutor.c = UnifiedMonitor.a().getThreshold(6);
  }
}
