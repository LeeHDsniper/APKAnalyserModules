import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.CoreService;
import com.tencent.mobileqq.app.GuardManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.app.AppRuntime;

public class mzg
  extends myg
{
  public mzg()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(String paramString)
  {
    GuardManager localGuardManager = a;
    if ("com.tencent.mobileqq".equals(paramString)) {}
    for (int i = 2;; i = 3)
    {
      localGuardManager.a(i, paramString);
      return;
    }
  }
  
  protected void b()
  {
    a.a(6, "fake_p_msg");
  }
  
  public void b(String paramString)
  {
    super.b(paramString);
    a.f();
    a.b(true);
    BaseApplicationImpl.a.a().onGuardEvent(4, aa, 0L);
    CoreService.b();
  }
}
