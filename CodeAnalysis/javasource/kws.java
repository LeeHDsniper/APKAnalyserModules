import android.app.Activity;
import android.view.View;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

class kws
  implements ActionSheet.OnButtonClickListener
{
  kws(kwq paramKwq, ActionSheet paramActionSheet)
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
    ChatActivityUtils.a(jdField_a_of_type_Kwq.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (Activity)jdField_a_of_type_Kwq.a.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_Kwq.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_Kwq.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_Kwq.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, null, true, jdField_a_of_type_Kwq.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b, true, true, null, "from_internal");
    ReportController.b(jdField_a_of_type_Kwq.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005974", "0X8005974", 0, 0, "", "", "", "");
  }
}
