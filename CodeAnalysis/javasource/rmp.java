import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.trick.TrickHelper;
import com.tencent.qphone.base.util.QLog;
import mqq.os.MqqHandler;

public class rmp
  implements Runnable
{
  public rmp(TrickHelper paramTrickHelper)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (QLog.isColorLevel()) {
      QLog.d("TrickHelper", 2, "Runnable tricking=" + TrickHelper.a + ",needCheck=" + TrickHelper.b);
    }
    if ((TrickHelper.b) && (!TrickHelper.a(a))) {
      ThreadManager.a().postDelayed(this, 2000L);
    }
  }
}
