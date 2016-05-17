import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.PlusPanelUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.StrangerChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lkn
  implements View.OnClickListener
{
  public lkn(StrangerChatPie paramStrangerChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    com.tencent.mobileqq.activity.aio.AIOUtils.l = true;
    int i;
    switch (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a)
    {
    default: 
      i = 0;
    }
    for (;;)
    {
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Two_call", "Clk_aio_right", 0, 0, String.valueOf(i), "", "", "");
      PlusPanelUtils.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, true, null, a);
      return;
      i = 1;
      continue;
      i = 2;
      continue;
      i = 3;
    }
  }
}
