import android.text.Editable;
import android.text.SpannableString;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.text.AtTroopMemberSpan;
import com.tencent.widget.XEditTextEx;
import com.tencent.widget.XPanelContainer;

public class lmc
  implements Runnable
{
  public lmc(TroopChatPie paramTroopChatPie, boolean paramBoolean, String paramString1, String paramString2, int paramInt)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int i;
    if (jdField_a_of_type_Boolean)
    {
      i = TroopChatPie.c(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie).getSelectionStart();
      TroopChatPie.d(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie).getEditableText().delete(i - 1, i);
    }
    SpannableString localSpannableString = AtTroopMemberSpan.a(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_JavaLangString, b, jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie.t(), TroopChatPie.e(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie), true);
    if ((localSpannableString == null) || (localSpannableString.length() == 0)) {}
    do
    {
      return;
      int j = TroopChatPie.f(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie).getSelectionStart();
      i = j;
      if (j < 0) {
        i = 0;
      }
      TroopChatPie.g(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie).getEditableText().insert(i, localSpannableString);
      TroopChatPie.c(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie).a(1);
      if (jdField_a_of_type_Int == 1)
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_AIO", "", "AIOchat", "Press_AIOhead_sendatmsg", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
        return;
      }
    } while (jdField_a_of_type_Int != 4);
    if ((jdField_a_of_type_JavaLangString != null) && (jdField_a_of_type_JavaLangString.equalsIgnoreCase("0")))
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_AIO", "", "AIOchat", "Clk_atallmber_sendatallmsg", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
      return;
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_AIO", "", "AIOchat", "Input_atmber_sendatmsg", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
  }
}
