import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.concurrent.ThreadFactory;

public final class ngb
  implements ThreadFactory
{
  public ngb()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public Thread newThread(Runnable paramRunnable)
  {
    if (QLog.isColorLevel()) {
      QLog.d("TM.global", 2, "new NetExcutor5Thread");
    }
    return new Thread(paramRunnable, "NetExcutor5Thread");
  }
}
