import android.os.Message;
import com.tencent.mobileqq.activity.contact.addcontact.AddContactsView;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import java.util.List;

public class lpw
  implements Runnable
{
  public lpw(AddContactsView paramAddContactsView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    List localList = ((FriendsManager)a.a.getManager(50)).c();
    localList = AddContactsView.a(a, localList);
    if ((localList != null) && (localList.size() > 0)) {}
    for (int i = localList.size();; i = 0)
    {
      AddContactsView.a(a).obtainMessage(1, 5, 0, localList).sendToTarget();
      if (i != 0)
      {
        ReportController.b(a.a, "CliOper", "", "", "0X8004E3E", "0X8004E3E", 0, 0, "", "", "", "");
        a.c = true;
      }
      AddContactsView.a(a).obtainMessage(4, i, 1).sendToTarget();
      return;
    }
  }
}
