import com.tencent.av.gaudio.AVNotifyCenter;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.FriendChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lgw
  implements Runnable
{
  public lgw(FriendChatPie paramFriendChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    AVNotifyCenter localAVNotifyCenter = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    if (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo == null) {}
    for (;;)
    {
      return;
      if ((a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 0) && (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString != null)) {
        try
        {
          long l = Long.valueOf(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).longValue();
          if (localAVNotifyCenter.a(l))
          {
            a.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.e, localAVNotifyCenter.a(Long.valueOf(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).longValue()));
            localAVNotifyCenter.a(Long.valueOf(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).longValue(), false, -1);
            return;
          }
        }
        catch (NumberFormatException localNumberFormatException) {}
      }
    }
  }
}
