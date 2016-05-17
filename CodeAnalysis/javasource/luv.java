import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.app.ConfigObserver;
import com.tencent.mobileqq.app.upgrade.UpgradeDetailWrapper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class luv
  extends ConfigObserver
{
  public luv(MainAssistObserver paramMainAssistObserver)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, UpgradeDetailWrapper paramUpgradeDetailWrapper)
  {
    MainAssistObserver.a(a, paramUpgradeDetailWrapper);
    a.f();
  }
}
