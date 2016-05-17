import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.ForwardFriendListActivity;
import com.tencent.mobileqq.activity.ForwardRecentActivity;
import com.tencent.mobileqq.activity.contact.newfriend.NewFriendActivity;
import com.tencent.mobileqq.activity.contact.troop.TroopActivity;
import com.tencent.mobileqq.activity.phone.PhoneFrameActivity;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.forward.ForwardAbility.ForwardAbilityType;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class ixx
  implements View.OnClickListener
{
  public ixx(ForwardRecentActivity paramForwardRecentActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    int m = 49;
    int k = 2;
    int i = paramView.getId();
    if (i == 2131300511)
    {
      ForwardRecentActivity.a(a, 10);
      return;
    }
    if (i == 2131297081)
    {
      if (a.jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption != null)
      {
        a.jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(false);
        com.tencent.mobileqq.app.PhoneContactManagerImp.f = false;
      }
      a.finish();
      return;
    }
    Intent localIntent = new Intent();
    localIntent.putExtra("call_by_forward", true);
    if (a.jdField_a_of_type_AndroidNetUri != null) {
      localIntent.setData(a.jdField_a_of_type_AndroidNetUri);
    }
    if (a.getIntent().getBooleanExtra("isFromShare", false))
    {
      localIntent.putExtras(a.jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a());
      localIntent.setAction(a.getIntent().getAction());
    }
    for (;;)
    {
      switch (paramView.getId())
      {
      default: 
        return;
      case 2131297647: 
        localIntent.putExtra("onlyOneSegement", true);
        localIntent.putExtra("_key_mode", 0);
        localIntent.putExtra("key_tab_mode", 1);
        localIntent.setClass(a, TroopActivity.class);
        a.startActivityForResult(localIntent, 20000);
        ReportController.b(a.app, "CliOper", "", "", "0X800404C", "0X800404C", 0, 0, "", "", "", "");
        return;
        localIntent.putExtras(a.getIntent().getExtras());
      }
    }
    paramView = new Intent(a, SelectMemberActivity.class);
    paramView.putExtra("param_type", 3000);
    paramView.putExtra("param_subtype", 0);
    paramView.putExtra("param_done_button_wording", a.getString(2131369840));
    paramView.putExtra("param_done_button_highlight_wording", a.getString(2131369841));
    paramView.putExtra("param_min", 2);
    paramView.putExtra("param_max", 49);
    a.startActivityForResult(paramView, 20003);
    ReportController.b(a.app, "CliOper", "", "", "0X80056AF", "0X80056AF", 0, 0, "", "", "", "");
    return;
    localIntent.setClass(a, PhoneFrameActivity.class);
    localIntent.putExtra("key_req_type", 2);
    a.startActivityForResult(localIntent, 20000);
    ReportController.b(a.app, "CliOper", "", "", "Two_call", "Tc_msg_cate", 0, 0, "1", "", "", "");
    ReportController.b(a.app, "CliOper", "", "", "0X800404B", "0X800404B", 0, 0, "", "", "", "");
    return;
    localIntent.putExtra("onlyOneSegement", true);
    localIntent.putExtra("_key_mode", 1);
    localIntent.putExtra("key_tab_mode", 1);
    localIntent.setClass(a, TroopActivity.class);
    a.startActivityForResult(localIntent, 20000);
    ReportController.b(a.app, "CliOper", "", "", "0X800404D", "0X800404D", 0, 0, "", "", "", "");
    return;
    ReportController.b(a.app, "CliOper", "", "", "Network_circle", "Forward_circle_clk", 0, 0, "", "", "", "");
    localIntent.setClass(a, NewFriendActivity.class);
    a.startActivityForResult(localIntent, 20000);
    return;
    localIntent.setClass(a, ForwardFriendListActivity.class);
    a.startActivityForResult(localIntent, 20000);
    ReportController.b(a.app, "CliOper", "", "", "Two_call", "Tc_msg_cate", 0, 0, "0", "", "", "");
    ReportController.b(a.app, "CliOper", "", "", "0X800404A", "0X800404A", 0, 0, "", "", "", "");
    return;
    paramView = new Bundle();
    paramView.putString("uin", String.valueOf("-1010"));
    paramView.putInt("uintype", -1);
    a.jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.e.intValue(), paramView);
    ReportController.b(a.app, "CliOper", "", "", "0X800404E", "0X800404E", 0, 0, "", "", "", "");
    return;
    int j;
    if (!a.jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.f())
    {
      j = 1;
      i = j;
      if (!a.jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.c))
      {
        i = j;
        if (!a.jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.d)) {
          i = 1;
        }
      }
      if (a.jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.b)) {
        break label1273;
      }
    }
    for (;;)
    {
      j = m;
      if (!a.jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.d)) {
        j = 1;
      }
      if (!a.jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.i)) {}
      for (boolean bool = true;; bool = false)
      {
        if (a.jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.b())
        {
          i = 1;
          j = 1;
        }
        paramView = new Intent(a, SelectMemberActivity.class);
        paramView.putExtra("param_type", 3000);
        paramView.putExtra("param_subtype", 0);
        paramView.putExtra("param_done_button_wording", a.getString(2131369842));
        paramView.putExtra("param_done_button_highlight_wording", a.getString(2131369843));
        paramView.putExtra("param_min", k);
        paramView.putExtra("param_max", j);
        paramView.putExtra("param_donot_need_contacts", bool);
        if (i != 0)
        {
          paramView.putExtra("param_donot_need_troop", true);
          paramView.putExtra("param_donot_need_discussion", true);
        }
        paramView.putExtra("param_entrance", 12);
        a.startActivityForResult(paramView, 20003);
        ReportController.b(a.app, "CliOper", "", "", "0X8005A10", "0X8005A10", 0, 0, "", "", "", "");
        return;
        j = 0;
        break;
        localIntent.setClass(a, TroopActivity.class);
        if (!a.jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.d))
        {
          localIntent.putExtra("onlyOneSegement", true);
          localIntent.putExtra("_key_mode", 0);
          localIntent.putExtra("key_tab_mode", 1);
        }
        for (;;)
        {
          a.startActivityForResult(localIntent, 20000);
          return;
          if (!a.jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.c))
          {
            localIntent.putExtra("onlyOneSegement", true);
            localIntent.putExtra("_key_mode", 1);
            localIntent.putExtra("key_tab_mode", 1);
          }
        }
      }
      label1273:
      k = 1;
    }
  }
}
