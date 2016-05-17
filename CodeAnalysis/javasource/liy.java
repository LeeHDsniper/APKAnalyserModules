import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsStructMsg;

public class liy
  implements View.OnClickListener
{
  public liy(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (a.jdField_a_of_type_ComTencentMobileqqStructmsgAbsStructMsg != null) {
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8004EFC", "0X8004EFC", 0, 0, "", "", "" + a.jdField_a_of_type_ComTencentMobileqqStructmsgAbsStructMsg.msgId, "");
    }
    a.m();
  }
}
