import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.photo.MediaScanner;
import com.tencent.mobileqq.activity.photo.PeakService;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mar
  implements Runnable
{
  public mar(PeakService paramPeakService)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (QLog.isColorLevel()) {
      QLog.d("PeakService", 2, "peak service start MediaScanner.doScan()");
    }
    MediaScanner.a(BaseApplicationImpl.getContext()).a();
  }
}
