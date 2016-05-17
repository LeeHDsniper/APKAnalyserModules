import com.tencent.mobileqq.activity.contact.addcontact.AddContactsView;
import com.tencent.mobileqq.app.ConditionSearchManager.IConfigListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lps
  implements ConditionSearchManager.IConfigListener
{
  public lps(AddContactsView paramAddContactsView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    if ((paramInt == 2) && (paramBoolean))
    {
      a.b = true;
      a.d();
    }
  }
}
