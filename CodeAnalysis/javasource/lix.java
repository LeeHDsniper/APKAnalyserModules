import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.Iterator;
import java.util.List;

public class lix
  implements Runnable
{
  public lix(PublicAccountChatPie paramPublicAccountChatPie, List paramList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
      while (localIterator.hasNext())
      {
        ChatMessage localChatMessage = (ChatMessage)localIterator.next();
        jdField_a_of_type_ComTencentMobileqqActivityAioRebuildPublicAccountChatPie.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildPublicAccountChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioRebuildPublicAccountChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, uniseq, "extStr", extStr);
        if (QLog.isColorLevel()) {
          QLog.d("Q.aio.BaseChatPie", 2, "saveReadedToDB uin=" + jdField_a_of_type_ComTencentMobileqqActivityAioRebuildPublicAccountChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + " uniseq=" + uniseq + " extstr=" + extStr);
        }
      }
      return;
    }
    catch (Exception localException)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("Q.aio.BaseChatPie", 4, localException.getMessage());
      }
    }
  }
}
