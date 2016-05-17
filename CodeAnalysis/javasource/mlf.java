import com.tencent.mobileqq.activity.selectmember.PhoneContactSelectActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.qcall.PstnObserver;

public class mlf
  extends PstnObserver
{
  public mlf(PhoneContactSelectActivity paramPhoneContactSelectActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(String paramString, int paramInt1, int paramInt2)
  {
    if (a.a != null)
    {
      a.app.b(a.a);
      a.a = null;
    }
    a.finish();
  }
}
