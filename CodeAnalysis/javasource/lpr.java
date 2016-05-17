import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Message;
import com.tencent.mobileqq.activity.contact.addcontact.AddContactsView;
import com.tencent.mobileqq.activity.contact.addcontact.AddContactsView.MayKnowAdapter;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import java.util.List;

public class lpr
  extends FriendListObserver
{
  public lpr(AddContactsView paramAddContactsView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, Object paramObject)
  {
    if (paramBoolean1)
    {
      paramObject = (List)paramObject;
      paramObject = AddContactsView.a(a, paramObject);
      lpz localLpz = AddContactsView.a(a);
      int i;
      if (paramBoolean2)
      {
        i = 1;
        if (!paramBoolean3) {
          break label153;
        }
      }
      label153:
      for (int j = 5;; j = 1)
      {
        localLpz.obtainMessage(i, j, 0, paramObject).sendToTarget();
        if ((!a.c) && (paramObject != null) && (paramObject.size() > 0)) {
          ReportController.b(a.a, "CliOper", "", "", "0X8004E3E", "0X8004E3E", 0, 0, "", "", "", "");
        }
        a.a.getPreferences().edit().putLong("sp_get_mayknow_timestamp", System.currentTimeMillis()).commit();
        return;
        i = 2;
        break;
      }
    }
    AddContactsView.a(a, 3);
    AddContactsView.a(a).notifyDataSetChanged();
  }
}
