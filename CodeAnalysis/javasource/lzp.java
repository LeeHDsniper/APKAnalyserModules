import com.tencent.mobileqq.activity.phone.SettingActivity2;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;

public class lzp
  extends ContactBindObserver
{
  public lzp(SettingActivity2 paramSettingActivity2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, int paramInt)
  {
    if (a.c != null)
    {
      a.app.unRegistObserver(a.c);
      a.c = null;
    }
    a.b();
    if (paramBoolean)
    {
      if (a.c != null)
      {
        a.app.unRegistObserver(a.c);
        a.c = null;
      }
      a.a();
    }
  }
}
