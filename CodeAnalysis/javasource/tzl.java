import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.push.BadgeUtilImpl;
import com.tencent.qphone.base.util.QLog;

public final class tzl
  implements Runnable
{
  public tzl()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      if (!BadgeUtilImpl.isEnabled(BaseApplicationImpl.a)) {
        BadgeUtilImpl.disableBadge(BaseApplicationImpl.a);
      }
      return;
    }
    catch (Exception localException)
    {
      while (!QLog.isColorLevel()) {}
      QLog.e("BadgeUtilImpl", 2, "disableBadge mobileqq", localException);
    }
  }
}
