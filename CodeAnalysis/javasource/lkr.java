import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.utils.TroopUtils;
import java.util.ArrayList;

public class lkr
  implements Runnable
{
  public lkr(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (TroopUtils.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b))
    {
      TroopHandler localTroopHandler = (TroopHandler)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20);
      ArrayList localArrayList = new ArrayList();
      localArrayList.add(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      localTroopHandler.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b, localArrayList);
      a.M = true;
    }
  }
}
