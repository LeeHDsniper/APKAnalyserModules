import android.os.Handler;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lmi
  implements Runnable
{
  public lmi(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    TroopManager localTroopManager = (TroopManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
    if ((localTroopManager != null) && (localTroopManager.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a) != null)) {
      a.b.sendEmptyMessage(7);
    }
  }
}
