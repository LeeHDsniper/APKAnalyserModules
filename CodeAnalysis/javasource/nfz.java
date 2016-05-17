import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public final class nfz
  extends Thread
{
  public nfz()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    com.tencent.mobileqq.app.ThreadManager.d = true;
    QLog.i("TM.global", 2, "QQ Runtime ShutDown");
  }
}
