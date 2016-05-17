import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.ChatItemBuilder;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.QQWalletMsgItemBuilder;
import com.tencent.mobileqq.app.IndividualRedPacketManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageForQQWalletMsg;
import com.tencent.mobileqq.data.QQWalletRedPacketMsg;
import com.tencent.mobileqq.data.QQWalletTransferMsg;
import com.tencent.mobileqq.data.QQWalletTransferMsgElem;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;

public class kzj
  implements View.OnClickListener
{
  public kzj(QQWalletMsgItemBuilder paramQQWalletMsgItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (QQWalletMsgItemBuilder.a(a)) {}
    label511:
    label809:
    label854:
    label1037:
    for (;;)
    {
      return;
      long l = System.currentTimeMillis();
      if (a.a(a.jdField_a_of_type_Long, l))
      {
        a.jdField_a_of_type_Long = l;
        MessageForQQWalletMsg localMessageForQQWalletMsg = (MessageForQQWalletMsg)aa;
        Object localObject1 = a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
        if (localMessageForQQWalletMsg != null)
        {
          boolean bool = QQWalletMsgItemBuilder.a(a, localMessageForQQWalletMsg);
          QQWalletTransferMsgElem localQQWalletTransferMsgElem;
          Object localObject3;
          Object localObject2;
          if ((!bool) && (mQQWalletTransferMsg != null))
          {
            localQQWalletTransferMsgElem = mQQWalletTransferMsg.elem;
            ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Vip_pay_mywallet", "", "transferaccountmsg", "show", 0, 0, "" + mQQWalletTransferMsg.templateId, "", "", "");
            localObject3 = null;
            localObject2 = localObject1;
            localObject1 = localObject3;
          }
          for (;;)
          {
            if (localQQWalletTransferMsgElem == null) {
              break label1037;
            }
            int i;
            if (TextUtils.isEmpty(actionsPriority))
            {
              QQWalletMsgItemBuilder.a(a, paramView.getContext(), linkUrl);
              return;
              if ((bool) && (mQQWalletTransferMsg != null))
              {
                localQQWalletTransferMsgElem = mQQWalletTransferMsg.elem;
                localObject2 = (TextView)paramView.findViewById(2131302558);
                ((TextView)localObject2).setVisibility(0);
                ((TextView)localObject2).setText("已拆开");
                paramView.findViewById(2131302561).setVisibility(8);
                mQQWalletRedPacketMsg = new QQWalletRedPacketMsg();
                mQQWalletRedPacketMsg.elem = mQQWalletTransferMsg.elem;
                msgtype = 63511;
                mQQWalletRedPacketMsg.authkey = "";
                mQQWalletRedPacketMsg.redPacketId = "";
                mQQWalletRedPacketMsg.redtype = 0;
                mQQWalletRedPacketMsg.templateId = 0;
                mQQWalletRedPacketMsg.isOpened = true;
                mQQWalletTransferMsg = null;
                msgData = localMessageForQQWalletMsg.getBytes();
                a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, uniseq, msgData);
                localObject2 = localObject1;
                localObject1 = null;
                continue;
              }
              if ((bool) && (mQQWalletRedPacketMsg != null))
              {
                if ((a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 0) || (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1000) || (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1004) || (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1001) || (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1008))
                {
                  i = 1;
                  localObject2 = localObject1;
                  if (i != 0)
                  {
                    localObject2 = localObject1;
                    if (!localMessageForQQWalletMsg.isSend()) {
                      localObject2 = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
                    }
                  }
                  localQQWalletTransferMsgElem = mQQWalletRedPacketMsg.elem;
                  localObject1 = mQQWalletRedPacketMsg.authkey;
                  msgtype = 63511;
                  mQQWalletRedPacketMsg = mQQWalletRedPacketMsg;
                  mQQWalletRedPacketMsg.isOpened = true;
                  msgData = localMessageForQQWalletMsg.getBytes();
                  a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, uniseq, msgData);
                  if ((QQWalletMsgItemBuilder.a(a) == null) || (!QQWalletMsgItemBuilder.a(a).c()) || (customizeBg == null)) {
                    break label809;
                  }
                }
                for (i = 1;; i = 0)
                {
                  if ((i == 0) && ((mQQWalletRedPacketMsg.redtype == 1) || ((mQQWalletRedPacketMsg.redtype == 2) && (!localMessageForQQWalletMsg.isSend()))))
                  {
                    localObject3 = (TextView)paramView.findViewById(2131302558);
                    ((TextView)localObject3).setVisibility(0);
                    ((TextView)localObject3).setText("已拆开");
                    paramView.findViewById(2131302561).setVisibility(8);
                  }
                  ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Vip_pay_mywallet", "", "transferaccountmsg", "show", 0, 0, "" + mQQWalletRedPacketMsg.templateId, "", "", "");
                  break;
                  i = 0;
                  break label511;
                }
              }
            }
            else
            {
              localObject3 = actionsPriority.split("\\|");
              int j = 0;
              i = 0;
              while (j < localObject3.length)
              {
                if (!TextUtils.isEmpty(localObject3[j])) {
                  break label854;
                }
                j += 1;
              }
              break;
              try
              {
                k = Integer.valueOf(localObject3[j]).intValue();
                if (k == 1)
                {
                  if (QQWalletMsgItemBuilder.a(a, paramView.getContext(), linkUrl)) {
                    break;
                  }
                  i = -1;
                }
              }
              catch (Exception localException)
              {
                int k;
                do
                {
                  do
                  {
                    for (;;)
                    {
                      if (QLog.isDevelopLevel()) {
                        localException.printStackTrace();
                      }
                      k = i;
                      if (QLog.isColorLevel())
                      {
                        QLog.d(ChatItemBuilder.jdField_a_of_type_JavaLangString, 2, "QQWalletMsgItemBuilder failed to convert String:" + localObject3[j] + " to Interger,", localException);
                        k = i;
                      }
                    }
                    if (k != 2) {
                      break;
                    }
                  } while (!QQWalletMsgItemBuilder.b(a, paramView.getContext(), jumpUrl));
                  return;
                } while ((k != 3) || (!QQWalletMsgItemBuilder.a(a, paramView.getContext(), nativeAndroid, (String)localObject1, (String)localObject2, localMessageForQQWalletMsg, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo)));
                return;
              }
            }
            localObject2 = localObject1;
            localObject1 = null;
            localQQWalletTransferMsgElem = null;
          }
        }
      }
    }
  }
}
