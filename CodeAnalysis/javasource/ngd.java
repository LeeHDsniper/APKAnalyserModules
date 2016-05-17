import android.os.SystemClock;
import com.tencent.mobileqq.app.Job;
import com.tencent.mobileqq.app.ThreadExcutor;
import com.tencent.mobileqq.app.ThreadExcutor.IThreadListener;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class ngd
  extends ThreadPoolExecutor
{
  private static nfh jdField_a_of_type_Nfh = new nfh();
  private LinkedBlockingQueue jdField_a_of_type_JavaUtilConcurrentLinkedBlockingQueue;
  private nfv jdField_a_of_type_Nfv;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ngd(int paramInt1, int paramInt2, long paramLong, BlockingQueue paramBlockingQueue, nco paramNco)
  {
    super(paramInt1, paramInt2, paramLong, TimeUnit.SECONDS, paramBlockingQueue, paramNco, jdField_a_of_type_Nfh);
  }
  
  public void a(Job paramJob)
  {
    if (paramJob == null) {
      throw new IllegalArgumentException();
    }
    if (jdField_a_of_type_ComTencentMobileqqAppThreadExcutor$IThreadListener != null) {
      jdField_a_of_type_ComTencentMobileqqAppThreadExcutor$IThreadListener.a();
    }
    execute(paramJob);
  }
  
  public void a(LinkedBlockingQueue paramLinkedBlockingQueue, nfv paramNfv)
  {
    jdField_a_of_type_Nfv = paramNfv;
    jdField_a_of_type_JavaUtilConcurrentLinkedBlockingQueue = paramLinkedBlockingQueue;
  }
  
  protected void afterExecute(Runnable paramRunnable, Throwable paramThrowable)
  {
    super.afterExecute(paramRunnable, paramThrowable);
    if (!(paramRunnable instanceof Job)) {}
    do
    {
      do
      {
        return;
        paramRunnable = (Job)paramRunnable;
      } while (!paramRunnable.b());
      paramRunnable.clear();
      paramThrowable = getQueue();
      if (paramThrowable.contains(paramRunnable)) {
        paramThrowable.remove(paramRunnable);
      }
      if (jdField_a_of_type_ComTencentMobileqqAppThreadExcutor$IThreadListener != null) {
        jdField_a_of_type_ComTencentMobileqqAppThreadExcutor$IThreadListener.c();
      }
      try
      {
        paramThrowable = jdField_a_of_type_JavaUtilConcurrentLinkedBlockingQueue.iterator();
        while (paramThrowable.hasNext())
        {
          WeakReference localWeakReference = (WeakReference)paramThrowable.next();
          Job localJob = (Job)localWeakReference.get();
          if ((localJob != null) && (localJob.equals(paramRunnable))) {
            jdField_a_of_type_JavaUtilConcurrentLinkedBlockingQueue.remove(localWeakReference);
          }
        }
        if (ThreadManager.b) {}
      }
      catch (Exception paramThrowable)
      {
        if (QLog.isColorLevel()) {
          QLog.e("TM.global", 2, "afterExecute remove job error.");
        }
        c = (SystemClock.uptimeMillis() - b);
        if ((c > ThreadExcutor.c) && (jdField_a_of_type_Nfv != null)) {
          jdField_a_of_type_Nfv.a(paramRunnable);
        }
      }
    } while ((!ThreadManager.a) || (!QLog.isDevelopLevel()));
    QLog.d("AutoMonitor", 4, "globalBgTask," + paramRunnable.toString());
  }
  
  public void b(Job paramJob)
  {
    a(paramJob);
  }
  
  protected void beforeExecute(Thread paramThread, Runnable paramRunnable)
  {
    if (!(paramRunnable instanceof Job)) {}
    Object localObject;
    do
    {
      return;
      localObject = (Job)paramRunnable;
    } while (!((Job)localObject).a());
    jdField_a_of_type_Long = paramThread.getId();
    d = (SystemClock.uptimeMillis() - b);
    if (jdField_a_of_type_ComTencentMobileqqAppThreadExcutor$IThreadListener != null) {
      jdField_a_of_type_ComTencentMobileqqAppThreadExcutor$IThreadListener.b();
    }
    try
    {
      localObject = new WeakReference(localObject);
      jdField_a_of_type_JavaUtilConcurrentLinkedBlockingQueue.put(localObject);
      super.beforeExecute(paramThread, paramRunnable);
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.e("TM.global", 2, "beforeExecute add job error.");
        }
      }
    }
  }
  
  public void execute(Runnable paramRunnable)
  {
    if ((ThreadManager.a) && (!(paramRunnable instanceof Job)) && (QLog.isDevelopLevel())) {
      QLog.d("TM.global", 4, "command must be Job.");
    }
    if (ThreadManager.d)
    {
      QLog.i("TM.global", 1, "pool has shutdonw.");
      return;
    }
    try
    {
      super.execute(paramRunnable);
      return;
    }
    catch (InternalError paramRunnable)
    {
      QLog.e("TM.global", 1, "java.lang.InternalError: Thread starting during runtime shutdown");
      paramRunnable.printStackTrace();
    }
  }
  
  protected void terminated()
  {
    if (jdField_a_of_type_Nfv != null) {
      jdField_a_of_type_Nfv.a();
    }
    super.terminated();
  }
}
