import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.data.TroopMemberInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.utils.TroopTipsMsgMgr;
import java.util.Iterator;
import java.util.List;

public class lmk
  implements Runnable
{
  public lmk(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    TroopManager localTroopManager = (TroopManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
    Object localObject = localTroopManager.b(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    long l;
    TroopMemberInfo localTroopMemberInfo;
    if (localObject != null)
    {
      l = NetConnInfoCenter.getServerTime();
      localObject = ((List)localObject).iterator();
      l += 2592000L;
      if (((Iterator)localObject).hasNext())
      {
        localTroopMemberInfo = (TroopMemberInfo)((Iterator)localObject).next();
        if ((mUniqueTitleExpire > 0) && (mUniqueTitleExpire - NetConnInfoCenter.getServerTime() < 259200L) && (!localTroopManager.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, memberuin)))
        {
          ((TroopTipsMsgMgr)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(80)).a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a.a(localTroopMemberInfo), NetConnInfoCenter.getServerTime(), mUniqueTitleExpire, 0);
          localTroopManager.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, memberuin, true);
          ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_manage", "", "grp_aio", "exp_expire", 0, 0, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "", "", "");
        }
      }
    }
    for (;;)
    {
      break;
      if ((mUniqueTitleExpire != 0) && (mUniqueTitleExpire != -1) && (mUniqueTitleExpire < l))
      {
        l = mUniqueTitleExpire;
        continue;
        localTroopManager.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, l);
        return;
      }
    }
  }
}
