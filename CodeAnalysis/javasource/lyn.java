import android.os.Message;
import com.tencent.mobileqq.activity.phone.ContactListView;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.NetworkUtil;
import java.lang.ref.WeakReference;
import java.util.List;
import mqq.os.MqqHandler;

public class lyn
  extends MqqHandler
{
  private WeakReference a;
  
  public lyn(ContactListView paramContactListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new WeakReference(paramContactListView);
  }
  
  public void handleMessage(Message paramMessage)
  {
    ContactListView localContactListView = (ContactListView)a.get();
    if (localContactListView == null) {}
    do
    {
      return;
      switch (what)
      {
      case 4: 
      default: 
        throw new RuntimeException("Unknown message: " + what);
      case 2: 
        if ((ContactListView.b(localContactListView)) && (!jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.d()))
        {
          localContactListView.g();
          ContactListView.a(localContactListView, false);
        }
        localContactListView.j();
        return;
      case 3: 
        localContactListView.j();
      }
    } while (NetworkUtil.e(localContactListView.getContext()));
    localContactListView.i();
    localContactListView.a("网络不可用，请稍候重试.");
    return;
    b = ((List)obj);
    jdField_a_of_type_Lyi.notifyDataSetChanged();
    return;
    ContactListView.a(localContactListView);
    return;
    ContactListView.b(localContactListView, ((Boolean)obj).booleanValue());
  }
}
