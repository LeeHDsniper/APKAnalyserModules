import android.view.View;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.app.BizTroopHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

class kxm
  implements ActionSheet.OnButtonClickListener
{
  kxm(kxl paramKxl, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
    switch (paramInt)
    {
    }
    do
    {
      return;
    } while (jdField_a_of_type_Kxl.jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 3000);
    try
    {
      long l = Long.valueOf(jdField_a_of_type_Kxl.jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).longValue();
      paramView = (BizTroopHandler)jdField_a_of_type_Kxl.jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(22);
      if (paramView != null) {
        paramView.b(l);
      }
      ReportController.b(jdField_a_of_type_Kxl.jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_discuss", "", "grey", "Clk", 0, 0, "", String.valueOf(jdField_a_of_type_Kxl.jdField_a_of_type_Int), "", "");
      return;
    }
    catch (NumberFormatException paramView) {}
  }
}
