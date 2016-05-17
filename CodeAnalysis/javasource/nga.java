import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.concurrent.ThreadFactory;

public final class nga
  implements ThreadFactory
{
  public nga()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public Thread newThread(Runnable paramRunnable)
  {
    if (QLog.isColorLevel()) {
      QLog.d("TM.global", 2, "serialExecutor_thread");
    }
    return new Thread(paramRunnable, "serialExecutor_thread");
  }
}
