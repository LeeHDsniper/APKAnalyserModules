import com.tencent.mobileqq.activity.aio.rebuild.HotChatPie;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.HotChatRecentUserMgr;
import com.tencent.mobileqq.data.HotChatInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lhq
  implements Runnable
{
  public lhq(HotChatPie paramHotChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (a.jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.state == 1)
    {
      a.ai = a.jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.uuid;
      HotChatManager.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqDataHotChatInfo);
      return;
    }
    HotChatRecentUserMgr.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.troopUin, a.jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.state);
  }
}
