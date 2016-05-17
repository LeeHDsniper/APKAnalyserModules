import com.tencent.mobileqq.activity.recent.data.RecentItemChatMsgData;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mib
  implements Runnable
{
  public mib(RecentItemChatMsgData paramRecentItemChatMsgData, QQAppInterface paramQQAppInterface, MessageForStructing paramMessageForStructing)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqDataMessageForStructing.frienduin, jdField_a_of_type_ComTencentMobileqqDataMessageForStructing.istroop, jdField_a_of_type_ComTencentMobileqqDataMessageForStructing.uniseq, "extLong", Integer.valueOf(jdField_a_of_type_ComTencentMobileqqDataMessageForStructing.extLong));
  }
}
