import android.os.Looper;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.os.MqqMessageQueue;
import mqq.util.AbstractUnifiedMonitor.ThreadMonitorCallback;

public final class mzh
  implements AbstractUnifiedMonitor.ThreadMonitorCallback
{
  public mzh()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onThreadMonitorEnd(int paramInt)
  {
    if (paramInt == 0)
    {
      Looper.getMainLooper().setMessageLogging(null);
      MqqMessageQueue.getSubMainThreadQueue().setMessageLogging(null);
    }
    do
    {
      return;
      if (paramInt == 4)
      {
        ThreadManager.b().setMessageLogging(null);
        return;
      }
    } while (paramInt != 5);
    ThreadManager.a().setMessageLogging(null);
  }
}
