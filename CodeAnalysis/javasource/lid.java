import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.PlusPanelUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.NearbyChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lid
  implements View.OnClickListener
{
  public lid(NearbyChatPie paramNearbyChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    com.tencent.mobileqq.activity.aio.AIOUtils.l = true;
    if (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a == 1001) {
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800514F", "0X800514F", 0, 0, "", "", "", "");
    }
    for (;;)
    {
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Two_call", "Clk_aio_right", 0, 0, String.valueOf(0), "", "", "");
      PlusPanelUtils.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, true, null, a);
      return;
      if (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a == 1010) {
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80049C6", "0X80049C6", 0, 0, "", "", "", "");
      }
    }
  }
}
