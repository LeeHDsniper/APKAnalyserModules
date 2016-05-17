import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class mhl
  implements Runnable
{
  public mhl(RecentUser paramRecentUser, QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    SessionInfo localSessionInfo = new SessionInfo();
    jdField_a_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin;
    jdField_a_of_type_Int = jdField_a_of_type_ComTencentMobileqqDataRecentUser.type;
    ChatActivityFacade.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localSessionInfo);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int, true, true);
  }
}
