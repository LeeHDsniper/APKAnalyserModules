import com.tencent.mobileqq.activity.contact.troop.BaseTroopView;
import com.tencent.mobileqq.activity.contact.troop.TroopActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.widget.RedDotTextView;
import com.tencent.mobileqq.widget.TabBarView;
import com.tencent.mobileqq.widget.TabBarView.OnTabChangeListener;
import com.tencent.util.MqqWeakReferenceHandler;

public class lua
  implements TabBarView.OnTabChangeListener
{
  public lua(TroopActivity paramTroopActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    if (a.jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView != null) {
      a.jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView.c();
    }
    if (a.j != 2)
    {
      switch (paramInt2)
      {
      default: 
        ReportController.b(a.app, "P_CliOper", "Grp_contacts", "", "Grp_contactlist", "Clk_mygrp", 0, 0, "", "", "", "");
        ReportController.b(a.app, "CliOper", "", "", "0X8006620", "0X8006620", 0, 0, "", "", "", "");
        a.i = 0;
      }
      for (;;)
      {
        a.a(a.i);
        a.jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.sendEmptyMessage(1234);
        TroopActivity.a(a, paramInt2);
        return;
        ReportController.b(a.app, "P_CliOper", "Grp_contacts", "", "Grp_contactlist", "Clk_mygrp", 0, 0, "", "", "", "");
        ReportController.b(a.app, "CliOper", "", "", "0X8006620", "0X8006620", 0, 0, "", "", "", "");
        a.i = 0;
        continue;
        ReportController.b(a.app, "P_CliOper", "Grp_contacts", "", "discuss", "contact_discuss_tab", 0, 0, "", "", "", "");
        ReportController.b(a.app, "CliOper", "", "", "0X8006621", "0X8006621", 0, 0, "", "", "", "");
        a.i = 1;
      }
    }
    switch (paramInt2)
    {
    default: 
      if (!a.jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(0).a()) {
        break;
      }
    }
    for (String str = "0";; str = "1")
    {
      ReportController.b(a.app, "P_CliOper", "Grp_contacts", "", "Grp_contactlist", "Clk_grpnotice", 0, 0, "", str, "", "");
      ReportController.b(a.app, "P_CliOper", "Grp_contacts", "", "notice", "enter_verify", 0, 0, "", "", "", "");
      a.i = 0;
      break;
      if (a.jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(0).a()) {}
      for (str = "0";; str = "1")
      {
        ReportController.b(a.app, "P_CliOper", "Grp_contacts", "", "Grp_contactlist", "Clk_grpnotice", 0, 0, "", str, "", "");
        ReportController.b(a.app, "P_CliOper", "Grp_contacts", "", "notice", "enter_verify", 0, 0, "", "", "", "");
        a.i = 0;
        break;
      }
      if (a.jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(1).a()) {}
      for (str = "0";; str = "1")
      {
        ReportController.b(a.app, "P_CliOper", "Grp_contacts", "", "Grp_contactlist", "Clk_grprecom", 0, 0, "", str, "", "");
        ReportController.b(a.app, "P_CliOper", "Grp_contacts", "", "notice", "enter_recom", 0, 0, "", "", "", "");
        a.i = 1;
        break;
      }
    }
  }
}
