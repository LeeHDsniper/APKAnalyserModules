import com.tencent.mobileqq.activity.phone.SettingActivity2;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;

class lzo
  extends ContactBindObserver
{
  lzo(lzn paramLzn)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void c(boolean paramBoolean)
  {
    a.a.a.b();
    a.a.a.app.unRegistObserver(this);
    if (paramBoolean)
    {
      a.a.a.a.a(true, true);
      a.a.a.setResult(4002);
      a.a.a.finish();
    }
  }
}
