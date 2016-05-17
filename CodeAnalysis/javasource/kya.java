import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.item.LongMsgItemBuilder;
import com.tencent.mobileqq.data.MessageForLongMsg;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kya
  implements DialogInterface.OnClickListener
{
  public kya(LongMsgItemBuilder paramLongMsgItemBuilder, MessageForLongMsg paramMessageForLongMsg)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemLongMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioItemLongMsgItemBuilder.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioItemLongMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqDataMessageForLongMsg);
  }
}
