import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.phone.ContactListView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.activity.ContactsTroopActivity;

public class lye
  implements View.OnClickListener
{
  public lye(ContactListView paramContactListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = new Intent(a.getContext(), ContactsTroopActivity.class);
    a.b(paramView, 1001);
    ReportController.b(a.a, "CliOper", "", "", "0X8005B38", "0X8005B38", 0, 0, "", "", "", "");
  }
}
