package com.tencent.mobileqq.startup.step;

import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.memory.MemoryReporter;
import com.tencent.mobileqq.memoryleak.LeakInspector;
import java.lang.ref.WeakReference;
import rds;

public class InitLeakInspector
  extends Step
{
  public static final String a = "LeakInspector";
  
  public InitLeakInspector() {}
  
  private static void b(String paramString1, String paramString2, WeakReference paramWeakReference)
  {
    MemoryReporter.a().a(paramString1);
    if (!AppSetting.j) {}
  }
  
  protected boolean a()
  {
    LeakInspector.a(ThreadManager.b(), new rds());
    return true;
  }
}
