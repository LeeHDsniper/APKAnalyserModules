import com.tencent.mobileqq.app.CoreService;
import com.tencent.mobileqq.app.GuardManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ncf
  extends myg
{
  public ncf()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a()
  {
    super.a();
    if (b >= aa / 12000L)
    {
      CoreService.d();
      a.f();
      b = 0L;
    }
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
  
  protected void b(String paramString)
  {
    super.b(paramString);
    a.e();
    CoreService.c();
  }
}
