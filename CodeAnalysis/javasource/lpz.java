import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.contact.addcontact.AddContactsView;
import com.tencent.mobileqq.activity.contact.addcontact.AddContactsView.MayKnowAdapter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.WeakReference;
import java.util.List;

public class lpz
  extends Handler
{
  private WeakReference a;
  
  public lpz(AddContactsView paramAddContactsView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new WeakReference(paramAddContactsView);
  }
  
  public void handleMessage(Message paramMessage)
  {
    boolean bool2 = true;
    AddContactsView localAddContactsView = (AddContactsView)a.get();
    if (localAddContactsView == null) {}
    do
    {
      return;
      List localList;
      switch (what)
      {
      default: 
        return;
      case 1: 
        localList = (List)obj;
        AddContactsView.a(localAddContactsView).b(localList);
        AddContactsView.a(localAddContactsView, arg1);
        AddContactsView.a(localAddContactsView).notifyDataSetChanged();
        return;
      case 2: 
        localList = (List)obj;
        AddContactsView.a(localAddContactsView).a(localList);
        AddContactsView.a(localAddContactsView, arg1);
        AddContactsView.a(localAddContactsView).notifyDataSetChanged();
        return;
      case 3: 
        AddContactsView.a(localAddContactsView, arg1);
        AddContactsView.a(localAddContactsView).notifyDataSetChanged();
        return;
      }
    } while (AddContactsView.a(localAddContactsView) == 2);
    boolean bool1;
    if (arg1 < AddContactsView.a())
    {
      bool1 = true;
      if (arg2 != 1) {
        break label196;
      }
    }
    for (;;)
    {
      AddContactsView.a(localAddContactsView, bool1, bool2, null);
      return;
      bool1 = false;
      break;
      label196:
      bool2 = false;
    }
  }
}
