import android.os.AsyncTask;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.data.TroopMessageManager;
import com.tencent.mobileqq.utils.NetworkUtil;

public class llo
  implements Runnable
{
  public llo(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    new llp(this).execute(new Void[0]);
    TroopInfo localTroopInfo = ((TroopManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).b(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    int i = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    TroopMessageManager localTroopMessageManager = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
    int j = NetworkUtil.a(BaseApplicationImpl.getContext());
    if ((localTroopInfo != null) && (localTroopInfo.hasOrgs())) {
      localTroopMessageManager.b(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, Math.min(a.dI, b));
    }
    while (((i != 1) && (i != 4) && ((i != -1) || (d <= 0))) || (!jdField_a_of_type_Boolean) || (localTroopInfo == null) || (wMemberNum >= c) || ((j != 4) && (j != 1))) {
      return;
    }
    localTroopMessageManager.b(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, Math.min(a.dI, jdField_a_of_type_Int));
  }
}
