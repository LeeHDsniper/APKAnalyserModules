import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import cooperation.troop.TroopOrgProxyActivity;

public class lkt
  implements View.OnClickListener
{
  public lkt(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = new Intent();
    TroopInfo localTroopInfo = ((TroopManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    if ((localTroopInfo != null) && (localTroopInfo.hasOrgs()))
    {
      paramView.putExtra("troopUin", a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
      paramView.putExtra("memUin", a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      TroopOrgProxyActivity.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, paramView, "com.tencent.mobileqq.troop.org.activity.TroopOrgEditPersonalInfoActivity", 0);
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_work", "", "edit_data", "Clk_blue", 0, 0, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "0", "", "");
      return;
    }
    paramView = new Intent(a.a(), QQBrowserActivity.class);
    paramView.putExtra("url", "http://qqweb.qq.com/m/qun/team/index.html?_wv=1027&_bid=2230&src=2&gc=" + a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    paramView.putExtra("webStyle", "noBottomBar");
    paramView.putExtra("startOpenPageTime", System.currentTimeMillis());
    a.a().startActivity(paramView);
  }
}
