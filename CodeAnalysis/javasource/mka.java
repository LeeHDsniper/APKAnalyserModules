import SecurityAccountServer.RespondQueryQQBindingStat;
import com.tencent.mobileqq.activity.selectmember.ContactsInnerFrame;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;

public class mka
  extends ContactBindObserver
{
  public mka(ContactsInnerFrame paramContactsInnerFrame)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    a.a.unRegistObserver(this);
    switch (ContactsInnerFrame.a(a).d())
    {
    case 5: 
    default: 
      ContactsInnerFrame.c(a);
      return;
    case 0: 
    case 4: 
    case 6: 
      ContactsInnerFrame.a(a);
      return;
    case 1: 
    case 2: 
      ContactsInnerFrame.b(a);
      return;
    }
    if (aa).a().lastUsedFlag == 2L)
    {
      ContactsInnerFrame.a(a);
      return;
    }
    ContactsInnerFrame.b(a);
  }
}
