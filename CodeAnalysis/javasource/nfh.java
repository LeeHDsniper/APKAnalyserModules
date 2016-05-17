import android.os.HandlerThread;
import android.os.SystemClock;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.ThreadExcutor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.qphone.base.util.QLog;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;
import mqq.os.MqqHandler;

class nfh
  implements RejectedExecutionHandler
{
  private static MqqHandler jdField_a_of_type_MqqOsMqqHandler;
  private long jdField_a_of_type_Long;
  
  public nfh()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Long = -1L;
  }
  
  private static MqqHandler a()
  {
    if (jdField_a_of_type_MqqOsMqqHandler == null)
    {
      HandlerThread localHandlerThread = ThreadExcutor.a().a("Rejected_Handler", 0);
      localHandlerThread.start();
      jdField_a_of_type_MqqOsMqqHandler = new MqqHandler(localHandlerThread.getLooper());
    }
    return jdField_a_of_type_MqqOsMqqHandler;
  }
  
  public void rejectedExecution(Runnable paramRunnable, ThreadPoolExecutor paramThreadPoolExecutor)
  {
    if (QLog.isColorLevel()) {
      QLog.d("TM.global", 2, "rejectedExecution:" + paramRunnable.toString() + " " + paramThreadPoolExecutor.toString());
    }
    if (jdField_a_of_type_Long == -1L) {
      jdField_a_of_type_Long = SystemClock.uptimeMillis();
    }
    ThreadExcutor.e += 1;
    if ((SystemClock.uptimeMillis() - jdField_a_of_type_Long < 1000L) && (ThreadExcutor.e > 5))
    {
      QLog.e("TM.global", 1, "rejectedExecution may undermine fluency:");
      ThreadExcutor.e = 0;
      jdField_a_of_type_Long = -1L;
      StatisticCollector.a(BaseApplicationImpl.a()).a("", "sp_reject_exception_report", false, 0L, 0L, null, "", false);
    }
    for (;;)
    {
      a().post(paramRunnable);
      return;
      if (SystemClock.uptimeMillis() - jdField_a_of_type_Long > 1000L)
      {
        ThreadExcutor.e = 0;
        jdField_a_of_type_Long = -1L;
      }
    }
  }
}
