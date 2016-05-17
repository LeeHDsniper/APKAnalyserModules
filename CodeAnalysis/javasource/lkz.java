import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.utils.TroopUtils;
import mqq.os.MqqHandler;

class lkz
  implements Runnable
{
  lkz(lkx paramLkx)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (TroopUtils.b(a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), a.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b)) {
      TroopChatPie.c(a.a).post(new lla(this));
    }
  }
}
