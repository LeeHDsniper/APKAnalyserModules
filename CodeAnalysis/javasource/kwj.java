import android.app.Activity;
import android.view.View;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

class kwj
  implements ActionSheet.OnButtonClickListener
{
  kwj(kwh paramKwh, ActionSheet paramActionSheet)
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
    String str;
    if (jdField_a_of_type_Kwh.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1006)
    {
      str = jdField_a_of_type_Kwh.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
      paramView = null;
    }
    for (;;)
    {
      ChatActivityUtils.a(jdField_a_of_type_Kwh.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (Activity)jdField_a_of_type_Kwh.a.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_Kwh.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, paramView, jdField_a_of_type_Kwh.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, str, true, jdField_a_of_type_Kwh.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b, true, true, null, "from_internal");
      str = ChatActivityUtils.a(jdField_a_of_type_Kwh.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      paramView = str;
      if (str == null) {
        paramView = "";
      }
      ReportController.b(jdField_a_of_type_Kwh.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Two_call", "Two_call_launch", 0, 0, "13", paramView, "", "");
      ReportController.b(jdField_a_of_type_Kwh.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005974", "0X8005974", 0, 0, "", "", "", "");
      return;
      paramView = jdField_a_of_type_Kwh.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
      str = null;
    }
  }
}
