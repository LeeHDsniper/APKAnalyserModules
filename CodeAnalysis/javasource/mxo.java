import com.tencent.mobileqq.app.CoreService;
import com.tencent.mobileqq.app.GuardManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mxo
  extends myg
{
  private String b;
  
  public mxo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = null;
  }
  
  protected void a(String paramString)
  {
    b = paramString;
  }
  
  protected void b(String paramString)
  {
    super.b(paramString);
    b = paramString;
    CoreService.a();
    a.f();
  }
  
  protected void d(String paramString)
  {
    a.a(4, b);
  }
}
