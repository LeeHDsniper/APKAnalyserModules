import com.tencent.mobileqq.activity.contact.addcontact.AddContactsActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.widget.TabBarView.OnTabChangeListener;

public class lpp
  implements TabBarView.OnTabChangeListener
{
  public lpp(AddContactsActivity paramAddContactsActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    switch (paramInt2)
    {
    default: 
      return;
    case 0: 
      AddContactsActivity.a(a);
      ReportController.b(a.app, "CliOper", "", "", "0X8004BE9", "0X8004BE9", 0, 0, "", "", "", "");
      return;
    case 1: 
      AddContactsActivity.b(a);
      ReportController.b(a.app, "CliOper", "", "", "0X8004BEA", "0X8004BEA", 0, 0, "", "", "", "");
      ReportController.b(a.app, "P_CliOper", "Grp_find", "", "grptab", "exp", 0, 0, "", "", "", "");
      return;
    }
    AddContactsActivity.c(a);
    ReportController.b(a.app, "CliOper", "", "", "0X8004BEB", "0X8004BEB", 0, 0, "", "", "", "");
  }
}
