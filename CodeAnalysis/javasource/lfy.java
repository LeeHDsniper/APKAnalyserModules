import android.view.View;
import com.tencent.biz.eqq.CrmUtils;
import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

class lfy
  implements ActionSheet.OnButtonClickListener
{
  lfy(lfw paramLfw, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
    switch (paramInt)
    {
    default: 
      return;
    }
    CrmUtils.a(jdField_a_of_type_Lfw.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_Lfw.a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_Lfw.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, "IvrAIOTopButtonEngineFalse");
    ReportController.b(jdField_a_of_type_Lfw.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004861", "0X8004861", 0, 0, "", "", "", "");
  }
}
