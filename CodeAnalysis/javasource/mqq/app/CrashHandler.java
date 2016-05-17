package mqq.app;

import com.tencent.qphone.base.util.QLog;

public class CrashHandler
  implements Thread.UncaughtExceptionHandler
{
  private boolean isCrahing;
  
  public CrashHandler() {}
  
  public void uncaughtException(Thread paramThread, Throwable paramThrowable)
  {
    try
    {
      if (isCrahing) {
        return;
      }
      isCrahing = true;
      paramThread = (MobileQQ)MobileQQ.getContext();
      if (paramThread != null)
      {
        String str = paramThread.getProcessName();
        QLog.e("crash", 1, str + " has crashed.", paramThrowable);
        paramThread.closeAllActivitys();
        QLog.flushLog();
        return;
      }
    }
    finally {}
  }
}
