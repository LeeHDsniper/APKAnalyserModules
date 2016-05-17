import android.content.Intent;
import android.os.Bundle;
import com.tencent.mobileqq.activity.phone.PhoneMatchActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.loginwelcome.LoginWelcomeManager;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;

public class lzg
  extends ContactBindObserver
{
  public lzg(PhoneMatchActivity paramPhoneMatchActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, int paramInt)
  {
    if (a.a != null)
    {
      a.app.unRegistObserver(a.a);
      a.a = null;
    }
    a.b();
    if (paramBoolean)
    {
      if (a.a != null)
      {
        a.app.unRegistObserver(a.a);
        a.a = null;
      }
      if (a.getIntent().getExtras().containsKey("b_t_contacts")) {
        LoginWelcomeManager.a(a.app).a(a, false, true);
      }
      a.finish();
      return;
    }
    a.a("更新失败，请稍后重试。");
  }
}
