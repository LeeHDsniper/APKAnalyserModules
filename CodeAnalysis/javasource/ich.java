import com.tencent.mobileqq.activity.AuthDevUgActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.manager.VerifyDevLockManager.VerifyDevLockObserver;

public class ich
  extends VerifyDevLockManager.VerifyDevLockObserver
{
  public ich(AuthDevUgActivity paramAuthDevUgActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
