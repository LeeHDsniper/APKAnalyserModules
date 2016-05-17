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
import com.tencent.mobileqq.troop.logic.TroopFeedsCenterLogic;
import com.tencent.mobileqq.troop.utils.TroopBindPublicAccountMgr;

public class lmh
  implements View.OnClickListener
{
  public lmh(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = (TroopManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
    TroopBindPublicAccountMgr localTroopBindPublicAccountMgr = (TroopBindPublicAccountMgr)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(131);
    if ((paramView != null) && (localTroopBindPublicAccountMgr != null))
    {
      paramView = paramView.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
      if ((paramView != null) && (associatePubAccount > 0L))
      {
        paramView = String.format("http://buluo.qq.com/mobile/pub_history/main.html?puin=%1$s&_wv=1027", new Object[] { Long.valueOf(associatePubAccount) });
        Intent localIntent = new Intent(a.a(), QQBrowserActivity.class);
        localIntent.putExtra("url", paramView);
        a.a().startActivity(localIntent);
        if (localTroopBindPublicAccountMgr.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a)) {}
        for (paramView = "Clk_red";; paramView = "Clk_unred")
        {
          ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_public", "", "oper", paramView, 0, 0, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "", "", "");
          localTroopBindPublicAccountMgr.d(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
          if (a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic != null) {
            a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.f(false);
          }
          return;
        }
      }
    }
    com.tencent.mobileqq.activity.aio.AIOUtils.l = true;
    if (a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic == null) {
      a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic = new TroopFeedsCenterLogic(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, TroopChatPie.a(a), TroopChatPie.a(a), a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips, a.K);
    }
    a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.a();
  }
}
