import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.QQWalletMsgItemBuilder;
import com.tencent.mobileqq.activity.qwallet.PasswdRedBagInfo;
import com.tencent.mobileqq.activity.qwallet.PasswdRedBagManager;
import com.tencent.mobileqq.activity.qwallet.report.VACDReportUtil;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForQQWalletMsg;
import com.tencent.mobileqq.data.QQWalletRedPacketMsg;
import com.tencent.mobileqq.data.QQWalletTransferMsgElem;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class kzm
  implements View.OnClickListener
{
  public kzm(QQWalletMsgItemBuilder paramQQWalletMsgItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getTag() == null) {}
    do
    {
      PasswdRedBagManager localPasswdRedBagManager;
      PasswdRedBagInfo localPasswdRedBagInfo;
      do
      {
        do
        {
          return;
          paramView = getTagmQQWalletRedPacketMsg;
          localPasswdRedBagManager = (PasswdRedBagManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(124);
          if (!AnonymousChatHelper.a().a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a)) {
            break;
          }
          localPasswdRedBagManager.e(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
        } while (!QLog.isColorLevel());
        QLog.d(PasswdRedBagManager.a, 2, "current is in Anonymous, dont show passwdredbag tips");
        return;
        localPasswdRedBagInfo = localPasswdRedBagManager.a(redPacketId);
        if ((localPasswdRedBagInfo == null) || ((!a) && (!b) && (!c))) {
          break;
        }
        localPasswdRedBagManager.c(redPacketId);
        long l = VACDReportUtil.a(null, "qqwallet", "graphb", "pwd.click", "msgType=6", 0, null);
        localPasswdRedBagManager.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, localPasswdRedBagInfo, l);
        localPasswdRedBagManager.a(redPacketId, true);
      } while (!QLog.isColorLevel());
      QLog.d(PasswdRedBagManager.a, 2, "click open passwdredbag, isPasswdRedBagOpen=" + a + ",isPasswdRedBagFinish=" + b + ",isPasswdRedBagOverDue=" + c);
      return;
      if (a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie != null) {
        a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.b(redPacketId, elem.title);
      }
      localPasswdRedBagManager.a(redPacketId, false);
    } while (!QLog.isColorLevel());
    QLog.d(PasswdRedBagManager.a, 2, "show passwdredbag tips = " + elem.title);
  }
}
