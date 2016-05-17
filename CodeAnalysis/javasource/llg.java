import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.utils.TroopGagMgr;
import com.tencent.mobileqq.troop.utils.TroopGagMgr.SelfGagInfo;

public class llg
  implements Runnable
{
  public llg(TroopChatPie paramTroopChatPie, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    TroopGagMgr.SelfGagInfo localSelfGagInfo = ((TroopGagMgr)jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(47)).a(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, jdField_a_of_type_Boolean);
    Message localMessage = jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie.b.obtainMessage(2);
    obj = localSelfGagInfo;
    jdField_a_of_type_ComTencentMobileqqActivityAioRebuildTroopChatPie.b.sendMessage(localMessage);
  }
}
