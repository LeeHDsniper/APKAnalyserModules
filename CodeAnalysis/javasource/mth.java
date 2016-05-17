import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.ShakeListener;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.os.MqqHandler;

public class mth
  extends ShakeListener
{
  private mth()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    BaseActivity localBaseActivity = BaseActivity.sTopActivity;
    if (localBaseActivity == null) {
      return;
    }
    ThreadManager.b().post(new mti(this, localBaseActivity));
  }
}
