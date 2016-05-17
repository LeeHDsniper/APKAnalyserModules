import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.TroopInfoManager;
import com.tencent.mobileqq.troop.data.TroopFeedsDataManager;
import com.tencent.mobileqq.troop.utils.TroopNotificationHelper;
import mqq.os.MqqHandler;

public class lls
  implements Runnable
{
  public lls(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    TroopInfoManager localTroopInfoManager = (TroopInfoManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(36);
    if (localTroopInfoManager != null) {
      localTroopInfoManager.a(Long.valueOf(Long.parseLong(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a)), true).a();
    }
    TroopNotificationHelper.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    TroopChatPie.h(a).sendEmptyMessage(31);
  }
}
