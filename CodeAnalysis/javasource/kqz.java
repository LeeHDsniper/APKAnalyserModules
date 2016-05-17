import android.content.Context;
import android.view.View;
import com.tencent.av.app.PstnSessionInfo;
import com.tencent.av.utils.PstnUtils;
import com.tencent.av.utils.VideoActionSheet;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.PlusPanelUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.FriendChatPie;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.LBSHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.dating.DatingUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.jumplightalk.AIOJumpLightalkConfig;
import com.tencent.mobileqq.jumplightalk.JumpLightalkUtil;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public final class kqz
  implements ActionSheet.OnButtonClickListener
{
  public kqz(VideoActionSheet paramVideoActionSheet, int[] paramArrayOfInt, int paramInt, QQAppInterface paramQQAppInterface, Context paramContext, PstnSessionInfo paramPstnSessionInfo, SessionInfo paramSessionInfo, BaseChatPie paramBaseChatPie, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    jdField_a_of_type_ComTencentAvUtilsVideoActionSheet.dismiss();
    switch (jdField_a_of_type_ArrayOfInt[paramInt])
    {
    default: 
    case 4: 
    case 1: 
    case 2: 
      do
      {
        do
        {
          do
          {
            return;
            if ((jdField_a_of_type_Int == 1) || (jdField_a_of_type_Int == 2))
            {
              ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentAvAppPstnSessionInfo, 0);
              ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006406", "0X8006406", 6, 0, "", "", "", "");
              return;
            }
          } while (jdField_a_of_type_Int != 5);
          PstnUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, 1, 3);
          return;
          if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1001)
          {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005150", "0X8005150", 0, 0, "", "", "", "");
            if (!LBSHandler.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
            {
              jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.c(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().getString(2131371197));
              ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005154", "0X8005154", 0, 0, "", "", "", "");
            }
          }
          else if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1010) && (!DatingUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
          {
            jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.c(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().getString(2131371197));
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80049C8", "0X80049C8", 0, 0, "", "", "", "");
            return;
          }
          PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, true, jdField_a_of_type_JavaLangString, null);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004861", "0X8004861", 0, 0, "", "", "", "");
        } while (jdField_a_of_type_ArrayOfInt[3] != 3);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005B03", "0X8005B03", 0, 0, "", "", "", "");
        return;
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1001)
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005151", "0X8005151", 0, 0, "", "", "", "");
          if (!LBSHandler.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
          {
            jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.c(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().getString(2131371198));
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005155", "0X8005155", 0, 0, "", "", "", "");
          }
        }
        else if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1010) && (!DatingUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
        {
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.c(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().getString(2131371198));
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80049C8", "0X80049C8", 0, 0, "", "", "", "");
          return;
        }
        PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, false, jdField_a_of_type_JavaLangString, null);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004C09", "0X8004C09", 0, 0, "", "", "", "");
      } while (jdField_a_of_type_ArrayOfInt[3] != 3);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005B04", "0X8005B04", 0, 0, "", "", "", "");
      return;
    }
    if (JumpLightalkUtil.a(jdField_a_of_type_AndroidContentContext))
    {
      paramView = null;
      PhoneContact localPhoneContact = ((PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if (localPhoneContact != null) {
        paramView = mobileNo;
      }
      JumpLightalkUtil.a(jdField_a_of_type_AndroidContentContext, paramView, "10001", "com.tencent.mobileqq", "", "0", "0");
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005B02", "0X8005B02", 0, 1, "", "", "", "");
    }
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005B02", "0X8005B02", 0, 0, "", "", "", "");
      return;
      JumpLightalkUtil.a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie).a().h);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005B02", "0X8005B02", 0, 2, "", "", "", "");
    }
  }
}
