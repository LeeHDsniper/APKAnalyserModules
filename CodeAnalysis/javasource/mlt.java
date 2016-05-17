import SecurityAccountServer.RespondQueryQQBindingStat;
import com.tencent.mobileqq.activity.selectmember.PhoneContactTabView;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;

public class mlt
  extends ContactBindObserver
{
  public mlt(PhoneContactTabView paramPhoneContactTabView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    a.a.unRegistObserver(this);
    switch (PhoneContactTabView.a(a).d())
    {
    case 5: 
    default: 
      PhoneContactTabView.b(a);
      return;
    case 6: 
      a.d();
      return;
    case 0: 
    case 1: 
    case 2: 
    case 4: 
      PhoneContactTabView.a(a);
      return;
    }
    if (aa).a().lastUsedFlag == 2L)
    {
      a.d();
      return;
    }
    PhoneContactTabView.a(a);
  }
}
