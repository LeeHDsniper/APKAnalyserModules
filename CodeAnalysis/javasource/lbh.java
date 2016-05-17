import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.aio.item.StructingMsgItemBuilder;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.structmsg.AbsStructMsg;

public class lbh
  implements DialogInterface.OnClickListener
{
  public lbh(StructingMsgItemBuilder paramStructingMsgItemBuilder, ChatMessage paramChatMessage, Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    if ((jdField_a_of_type_ComTencentMobileqqDataChatMessage instanceof MessageForStructing))
    {
      paramDialogInterface = (MessageForStructing)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
      if ((structingMsg != null) && (structingMsg.mMsgServiceID == 35))
      {
        ((FragmentActivity)jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_AndroidContentContext).getChatFragment().a().f(jdField_a_of_type_ComTencentMobileqqDataChatMessage);
        return;
      }
    }
    ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqDataChatMessage.frienduin, jdField_a_of_type_ComTencentMobileqqDataChatMessage.istroop, jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
  }
}
