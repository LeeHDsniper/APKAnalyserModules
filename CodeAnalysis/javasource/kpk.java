import com.tencent.mobileqq.activity.aio.AIOReporterGetDeviceInfo;
import com.tencent.mobileqq.activity.aio.AIOTimeReporter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.utils.StartupTracker;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;

public class kpk
  implements Runnable
{
  public kpk(AIOTimeReporter paramAIOTimeReporter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    AIOReporterGetDeviceInfo localAIOReporterGetDeviceInfo = AIOReporterGetDeviceInfo.a();
    AIOTimeReporter.a(a, localAIOReporterGetDeviceInfo.a());
    if (StartupTracker.a <= 0L)
    {
      AIOTimeReporter.a(a);
      return;
    }
    String str = "";
    switch (AIOTimeReporter.a(a))
    {
    default: 
      return;
    case 1: 
      switch (a)
      {
      }
      for (;;)
      {
        StatisticCollector.a(BaseApplication.getContext()).a(null, str, true, StartupTracker.a, 0L, null, "");
        if (QLog.isDevelopLevel()) {
          QLog.d(a.a, 4, "reportAIOTime: " + str + " cost : " + StartupTracker.a);
        }
        AIOTimeReporter.a(a);
        return;
        if (!AIOTimeReporter.a(a).equalsIgnoreCase("0"))
        {
          str = AIOTimeReporter.a();
        }
        else
        {
          str = AIOTimeReporter.b();
          continue;
          if (!AIOTimeReporter.a(a).equalsIgnoreCase("0")) {
            str = AIOTimeReporter.c();
          } else {
            str = AIOTimeReporter.d();
          }
        }
      }
    case 2: 
      switch (a)
      {
      }
      for (;;)
      {
        break;
        if (!AIOTimeReporter.a(a).equalsIgnoreCase("0"))
        {
          str = AIOTimeReporter.e();
        }
        else
        {
          str = AIOTimeReporter.f();
          continue;
          if (!AIOTimeReporter.a(a).equalsIgnoreCase("0")) {
            str = AIOTimeReporter.g();
          } else {
            str = AIOTimeReporter.h();
          }
        }
      }
    }
    switch (a)
    {
    }
    for (;;)
    {
      break;
      if (!AIOTimeReporter.a(a).equalsIgnoreCase("0"))
      {
        str = AIOTimeReporter.i();
      }
      else
      {
        str = AIOTimeReporter.j();
        continue;
        if (!AIOTimeReporter.a(a).equalsIgnoreCase("0")) {
          str = AIOTimeReporter.k();
        } else {
          str = AIOTimeReporter.l();
        }
      }
    }
  }
}
