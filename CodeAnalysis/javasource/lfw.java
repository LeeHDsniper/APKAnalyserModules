import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet;

public class lfw
  implements View.OnClickListener
{
  public lfw(BusinessCmrTmpChatPie paramBusinessCmrTmpChatPie, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    com.tencent.mobileqq.activity.aio.AIOUtils.l = true;
    ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildBusinessCmrTmpChatPie.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Two_call", "Clk_aio_right", 0, 0, String.valueOf(0), "", "", "");
    if (jdField_a_of_type_Boolean)
    {
      paramView = ActionSheet.a(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildBusinessCmrTmpChatPie.jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
      paramView.c(2131367815);
      paramView.d(2131366996);
      paramView.a(new lfx(this));
      paramView.a(new lfy(this, paramView));
      paramView.show();
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildBusinessCmrTmpChatPie.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80049E2", "0X80049E2", 0, 0, "", "", "", "");
    }
  }
}
