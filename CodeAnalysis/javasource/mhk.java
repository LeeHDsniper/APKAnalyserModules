import android.view.View;
import com.tencent.mobileqq.activity.recent.RecentTroopMenuOption;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQProgressNotifier;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class mhk
  implements ActionSheet.OnButtonClickListener
{
  public mhk(RecentTroopMenuOption paramRecentTroopMenuOption, int paramInt, String paramString, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    if (!NetworkUtil.e(BaseApplication.getContext()))
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentTroopMenuOption.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressNotifier == null) {
        jdField_a_of_type_ComTencentMobileqqActivityRecentRecentTroopMenuOption.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressNotifier = new QQProgressNotifier(RecentTroopMenuOption.a(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentTroopMenuOption));
      }
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecentTroopMenuOption.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressNotifier.a(2, 2131368714, 1500);
    }
    try
    {
      if (jdField_a_of_type_ComTencentWidgetActionSheet != null) {
        jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
      }
      return;
      switch (paramInt)
      {
      default: 
        paramInt = -1;
      }
      while ((paramInt != jdField_a_of_type_Int) && (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentTroopMenuOption.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null))
      {
        jdField_a_of_type_ComTencentMobileqqActivityRecentRecentTroopMenuOption.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_JavaLangString, Integer.valueOf(paramInt));
        ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentTroopMenuOption.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_msg", "", "data_page", "Clk_setmsg", 0, 0, jdField_a_of_type_JavaLangString, String.valueOf(paramInt - 1), "", "");
        break;
        paramInt = 1;
        continue;
        paramInt = 4;
        continue;
        paramInt = 2;
        continue;
        paramInt = 3;
      }
    }
    catch (Exception paramView)
    {
      while (!QLog.isColorLevel()) {}
      QLog.i("RecentTroopMenuOption", 2, paramView.toString());
    }
  }
}
