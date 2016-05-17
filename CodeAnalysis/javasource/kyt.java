import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.ChatItemBuilder;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.PAMultiItemBuilder;
import com.tencent.mobileqq.activity.aio.item.PASingleItemBuilder;
import com.tencent.mobileqq.app.PublicAccountHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForPubAccount;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.data.PAMessage.Item;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.utils.TroopBindPublicAccountMgr;
import com.tencent.mobileqq.utils.JumpAction;
import com.tencent.mobileqq.utils.JumpParser;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;

public class kyt
  implements View.OnClickListener
{
  public kyt(PAMultiItemBuilder paramPAMultiItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    kyu localKyu = (kyu)paramView.getTag();
    paramView = AIOUtils.a(paramView);
    MessageForPubAccount localMessageForPubAccount;
    if ((paramView instanceof MessageForPubAccount))
    {
      localMessageForPubAccount = (MessageForPubAccount)paramView;
      if ((mPAMessage == null) || (mPAMessage.mMsgId <= 0L)) {}
    }
    for (long l = mPAMessage.mMsgId;; l = -1L)
    {
      if ((localKyu == null) || (!(paramView instanceof MessageForPubAccount))) {
        if (QLog.isColorLevel()) {
          QLog.d(ChatItemBuilder.a, 2, "PAMultiItemBuilder onClickListener holder = " + localKyu + ", msg = " + paramView);
        }
      }
      do
      {
        return;
        localMessageForPubAccount = (MessageForPubAccount)paramView;
        if ((mPAMessage != null) && (mPAMessage.items != null) && (!mPAMessage.items.isEmpty())) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.d(ChatItemBuilder.a, 2, "PAMultiItemBuilder onClickListener mPAMessage or items is empty !");
      return;
      PAMessage.Item localItem = (PAMessage.Item)mPAMessage.items.get(d);
      if ((a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface instanceof QQAppInterface)) {
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "mp_msg_msgpic_click", "aio_morpic_click", d + 1, 0, "", "", Long.toString(mPAMessage.mMsgId), "");
      }
      if (((a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface instanceof QQAppInterface)) && (istroop == 1))
      {
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_public", "", "oper", "Clk_all", 0, 0, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "", "", "");
        if (((TroopBindPublicAccountMgr)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(131)).a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, uniseq)) {
          ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_public", "", "oper", "top_one", 0, 0, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "", "", "");
        }
      }
      label406:
      JumpAction localJumpAction;
      int i;
      if (TextUtils.isEmpty(a_actionData))
      {
        paramView = actionData;
        if (TextUtils.isEmpty(paramView)) {
          break label935;
        }
        localJumpAction = JumpParser.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, paramView);
        if (localJumpAction != null) {
          break label715;
        }
        if (appId != 0L) {
          break label625;
        }
        i = 0;
        label450:
        if (i == 0) {
          break label659;
        }
        if (PASingleItemBuilder.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, nativeJumpString, appId, paramView)) {
          break label630;
        }
        PASingleItemBuilder.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, a, b, c, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, l);
        label538:
        PublicAccountHandler.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "Pb_account_lifeservice", "mp_msg_sys_35", "singlepic_allclick");
      }
      for (;;)
      {
        l = mPAMessage.mMsgId;
        if (l <= 0L) {
          break;
        }
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", frienduin, "mp_msg_sys_14", "msg_click", 0, 1, 0, Long.toString(l), "", "", "");
        return;
        paramView = a_actionData;
        break label406;
        label625:
        i = 1;
        break label450;
        label630:
        PublicAccountHandler.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "Pb_account_lifeservice", "mp_msg_sys_37", "singlepic_appclick");
        break label538;
        label659:
        PASingleItemBuilder.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, a, b, c, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, l);
        break label538;
        label715:
        if (TextUtils.isEmpty(localJumpAction.a()))
        {
          if (!PASingleItemBuilder.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, nativeJumpString, appId, paramView))
          {
            PASingleItemBuilder.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, a, b, c, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, l);
            break label538;
          }
          PublicAccountHandler.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "Pb_account_lifeservice", "mp_msg_sys_37", "singlepic_appclick");
          break label538;
        }
        if (!localJumpAction.b())
        {
          PASingleItemBuilder.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, a, b, c, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, l);
          break label538;
        }
        PublicAccountHandler.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "Pb_account_lifeservice", "mp_msg_sys_36", "singlepic_mqqclick");
        break label538;
        label935:
        PASingleItemBuilder.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, a, b, c, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, l);
      }
    }
  }
}
