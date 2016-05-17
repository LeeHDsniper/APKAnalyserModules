import com.tencent.av.service.LBSInfo;
import com.tencent.mobileqq.activity.contact.addcontact.AddContactsView;
import com.tencent.mobileqq.app.LBSObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lpt
  extends LBSObserver
{
  public lpt(AddContactsView paramAddContactsView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, LBSInfo paramLBSInfo)
  {
    if (paramBoolean) {
      a.a = paramLBSInfo.a();
    }
    if ((a.a == null) || (a.a.length != 4)) {
      a.a = new String[] { "-1", "-1", "-1", "-1" };
    }
    a.d();
  }
}
