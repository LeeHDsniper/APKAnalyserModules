import android.os.Handler;
import com.tencent.mobileqq.activity.phone.BindNumberActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;

public class lxr
  extends ContactBindObserver
{
  public lxr(BindNumberActivity paramBindNumberActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void b(boolean paramBoolean)
  {
    super.b(paramBoolean);
    if (paramBoolean) {
      BindNumberActivity.a(a).sendEmptyMessage(3);
    }
    for (;;)
    {
      a.app.unRegistObserver(BindNumberActivity.a(a));
      BindNumberActivity.a(a, null);
      return;
      a.b();
      a.b(2131368362);
    }
  }
}
