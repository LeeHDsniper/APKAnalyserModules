import com.tencent.mobileqq.activity.phone.BaseActivityView.IPhoneContext;
import com.tencent.mobileqq.activity.phone.PhoneInnerFrame;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;

public class lzd
  extends ContactBindObserver
{
  public lzd(PhoneInnerFrame paramPhoneInnerFrame)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (a.a)
    {
      a.b().a().unRegistObserver(this);
      a.g();
    }
  }
}
