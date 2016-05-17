import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.PASingleItemBuilder;
import com.tencent.mobileqq.app.PublicAccountHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPubAccount;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.utils.TroopBindPublicAccountMgr;
import com.tencent.mobileqq.utils.JumpAction;
import com.tencent.mobileqq.utils.JumpParser;

public class kyv
  implements View.OnClickListener
{
  public kyv(PASingleItemBuilder paramPASingleItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    kyw localKyw = (kyw)AIOUtils.a(paramView);
    ChatMessage localChatMessage = jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    if ((localChatMessage instanceof MessageForPubAccount))
    {
      paramView = (MessageForPubAccount)localChatMessage;
      if ((mPAMessage == null) || (mPAMessage.mMsgId <= 0L)) {}
    }
    for (long l = mPAMessage.mMsgId;; l = -1L)
    {
      if (((a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface instanceof QQAppInterface)) && (istroop == 1))
      {
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_public", "", "oper", "Clk_all", 0, 0, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
        if (((TroopBindPublicAccountMgr)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(131)).a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, uniseq)) {
          ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_public", "", "oper", "top_one", 0, 0, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
        }
      }
      JumpAction localJumpAction;
      int i;
      if (TextUtils.isEmpty(f))
      {
        paramView = e;
        if (TextUtils.isEmpty(paramView)) {
          break label761;
        }
        localJumpAction = JumpParser.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, paramView);
        if (localJumpAction != null) {
          break label541;
        }
        if (jdField_a_of_type_Long != 0L) {
          break label451;
        }
        i = 0;
        label253:
        if (i == 0) {
          break label485;
        }
        if (PASingleItemBuilder.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_JavaLangString, jdField_a_of_type_Long, paramView)) {
          break label456;
        }
        PASingleItemBuilder.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_JavaLangString, b, c, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, l);
      }
      for (;;)
      {
        PublicAccountHandler.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "Pb_account_lifeservice", "mp_msg_sys_32", "singlepic_allclick");
        if ((localChatMessage instanceof MessageForPubAccount))
        {
          paramView = (MessageForPubAccount)localChatMessage;
          if ((mPAMessage != null) && (mPAMessage.mMsgId > 0L)) {
            ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", frienduin, "mp_msg_sys_14", "msg_click", 0, 1, 0, Long.toString(mPAMessage.mMsgId), "", "", "");
          }
        }
        return;
        paramView = f;
        break;
        label451:
        i = 1;
        break label253;
        label456:
        PublicAccountHandler.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "Pb_account_lifeservice", "mp_msg_sys_34", "singlepic_appclick");
        continue;
        label485:
        PASingleItemBuilder.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_JavaLangString, b, c, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, l);
        continue;
        label541:
        if (TextUtils.isEmpty(localJumpAction.a()))
        {
          if (!PASingleItemBuilder.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_JavaLangString, jdField_a_of_type_Long, paramView)) {
            PASingleItemBuilder.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_JavaLangString, b, c, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, l);
          } else {
            PublicAccountHandler.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "Pb_account_lifeservice", "mp_msg_sys_34", "singlepic_appclick");
          }
        }
        else if (!localJumpAction.b()) {
          PASingleItemBuilder.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_JavaLangString, b, c, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, l);
        } else {
          PublicAccountHandler.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "Pb_account_lifeservice", "mp_msg_sys_33", "singlepic_mqqclick");
        }
      }
      label761:
      PASingleItemBuilder.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_JavaLangString, b, c, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, l);
      return;
    }
  }
}
