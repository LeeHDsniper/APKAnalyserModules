import android.content.Intent;
import com.tencent.mobileqq.activity.TroopAssisSettingActivity;
import com.tencent.mobileqq.activity.contact.addcontact.AddContactsActivity;
import com.tencent.mobileqq.activity.contact.troop.TroopActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.data.TroopCreateLogic;
import com.tencent.widget.PopupMenuDialog.MenuItem;
import com.tencent.widget.PopupMenuDialog.OnClickActionListener;

public class lub
  implements PopupMenuDialog.OnClickActionListener
{
  public lub(TroopActivity paramTroopActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(PopupMenuDialog.MenuItem paramMenuItem)
  {
    switch (a)
    {
    default: 
    case 0: 
      do
      {
        return;
        ReportController.b(a.app, "P_CliOper", "Grp_contacts", "", "Grp_contactlist", "Clk_right_create", 0, 0, "", "", "", "");
        ReportController.b(a.app, "CliOper", "", "", "0X8006622", "0X8006622", 0, 0, "", "", "", "");
        paramMenuItem = (TroopCreateLogic)a.app.getManager(31);
      } while (paramMenuItem == null);
      paramMenuItem.a(a, 0);
      return;
    case 1: 
      ReportController.b(a.app, "P_CliOper", "Grp_contacts", "", "Grp_contactlist", "Clk_right_join", 0, 0, "", "", "", "");
      ReportController.b(a.app, "CliOper", "", "", "Grp", "grplist_plus_join", 47, 0, "", "", "", "");
      AddContactsActivity.a(a, 1);
      return;
    case 2: 
      ReportController.b(a.app, "P_CliOper", "Grp_contacts", "", "Grp_contactlist", "Clk_right_msgset", 0, 0, "", "", "", "");
      ReportController.b(a.app, "CliOper", "", "", "Grp", "grplist_plus_setting", 0, 0, "", "", "", "");
      paramMenuItem = new Intent(a, TroopAssisSettingActivity.class);
      a.startActivity(paramMenuItem);
      return;
    }
    TroopActivity.b(a);
  }
}
