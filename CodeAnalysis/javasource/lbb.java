import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.item.StructingMsgItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageForTroopNotification;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsShareMsg;
import com.tencent.mobileqq.vipgift.VipGiftManager;

public class lbb
  implements View.OnClickListener
{
  public lbb(StructingMsgItemBuilder paramStructingMsgItemBuilder, AbsShareMsg paramAbsShareMsg, long paramLong, View.OnClickListener paramOnClickListener, MessageForStructing paramMessageForStructing)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (jdField_a_of_type_ComTencentMobileqqStructmsgAbsShareMsg.mMsgServiceID == 70) {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.a, "P_CliOper", "Grp_talk", "", "obj", "Clk_talk", 0, 0, jdField_a_of_type_ComTencentMobileqqStructmsgAbsShareMsg.uin, "", "", "");
    }
    com.tencent.mobileqq.activity.aio.AIOUtils.l = true;
    if (StructingMsgItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder)) {
      return;
    }
    if ((((VipGiftManager)jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.a.getManager(75)).b(jdField_a_of_type_Long)) && (jdField_a_of_type_ComTencentMobileqqStructmsgAbsShareMsg.mMsgServiceID == 38)) {
      label99:
      if (jdField_a_of_type_ComTencentMobileqqDataMessageForStructing.istroop == 7100)
      {
        paramView = jdField_a_of_type_ComTencentMobileqqStructmsgAbsShareMsg.mContentTitle;
        if (TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqStructmsgAbsShareMsg.mContentTitle)) {
          break label291;
        }
        paramView = jdField_a_of_type_ComTencentMobileqqStructmsgAbsShareMsg.mContentTitle.substring(0, Math.min(jdField_a_of_type_ComTencentMobileqqStructmsgAbsShareMsg.mContentTitle.length(), 10));
      }
    }
    label291:
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.a, "CliOper", "", "", "0X80054B7", "0X80054B7", 0, 0, "", "", paramView + "", "");
      if (!(jdField_a_of_type_ComTencentMobileqqDataMessageForStructing instanceof MessageForTroopNotification)) {
        break;
      }
      paramView = (MessageForTroopNotification)jdField_a_of_type_ComTencentMobileqqDataMessageForStructing;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.a, "P_CliOper", "Grp_bulletin", "", "AIOchat", "obj_clk", 0, 0, frienduin, "" + feedType, "", "");
      return;
      jdField_a_of_type_AndroidViewView$OnClickListener.onClick(paramView);
      break label99;
    }
  }
}
