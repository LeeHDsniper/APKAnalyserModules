import android.view.View;
import android.view.View.OnClickListener;
import android.widget.LinearLayout;
import com.tencent.biz.pubaccount.PublicAccountManager;
import com.tencent.biz.ui.CustomMenuBar;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class ljh
  implements View.OnClickListener
{
  public ljh(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    com.tencent.mobileqq.activity.aio.AIOUtils.l = true;
    a.jdField_a_of_type_ComTencentBizUiCustomMenuBar.setVisibility(8);
    if (PublicAccountChatPie.a(a) != null) {
      PublicAccountChatPie.b(a).setVisibility(0);
    }
    if (a.e != null) {
      a.e.setVisibility(0);
    }
    if (a.f != null) {
      a.f.setVisibility(0);
    }
    if (a.jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.b(a.a()) != 0) {
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005EC5", "0X8005EC5", 0, 0, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "", "", "");
    }
  }
}
