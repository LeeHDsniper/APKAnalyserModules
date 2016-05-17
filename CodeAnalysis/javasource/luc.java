import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.contact.troop.TroopActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import java.util.HashMap;

public class luc
  implements View.OnClickListener
{
  public luc(TroopActivity paramTroopActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    boolean bool = false;
    switch (paramView.getId())
    {
    default: 
      a.b();
      return;
    case 2131297035: 
      if (a.a != null)
      {
        paramView = new Intent();
        if (!a.a.isEmpty()) {
          bool = true;
        }
        paramView.putExtra("isDataChanged", bool);
        a.setResult(-1, paramView);
      }
      a.onBackPressed();
      return;
    }
    ReportController.b(a.app, "P_CliOper", "Grp_contacts", "", "Grp_contactlist", "Clk_right", 0, 0, "", "", "", "");
    if (a.a())
    {
      a.b();
      return;
    }
    ReportController.b(a.app, "CliOper", "", "", "Grp", "Clk_grplist_plus", 0, 0, "", "", "", "");
    a.a();
  }
}
