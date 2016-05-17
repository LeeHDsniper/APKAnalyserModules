import android.content.SharedPreferences;
import android.os.Message;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.org.data.OrgMember;
import com.tencent.mobileqq.troop.org.data.TroopOrgDataManager;
import com.tencent.mobileqq.troop.org.pb.TroopOrgProtocolManager;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import mqq.os.MqqHandler;
import org.json.JSONArray;
import org.json.JSONException;

public class lme
  implements Runnable
{
  public lme(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject1 = (TroopManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
    if (localObject1 == null) {}
    Object localObject2;
    label160:
    Object localObject3;
    do
    {
      return;
      localObject1 = ((TroopManager)localObject1).a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
      localObject2 = BaseApplication.getContext().getSharedPreferences("troopOrgCreateGrayTips", 0);
      if ((localObject2 != null) && (((SharedPreferences)localObject2).getBoolean(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, false))) {}
      for (i = 1;; i = 0)
      {
        if ((localObject1 == null) || (((TroopInfo)localObject1).hasOrgs()) || (i != 0)) {
          break label160;
        }
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("Q.aio.TroopChatPie.trooptag_troop_org", 2, "showEidtOrgInfoTipsIfNeeded, 没有创建群组织架构, troopUin" + a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a + "|memUin:" + a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        return;
      }
      localObject1 = (TroopOrgProtocolManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(136);
      localObject2 = (TroopOrgDataManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(135);
      localObject3 = BaseApplication.getContext().getSharedPreferences("request_timestamp", 0);
    } while (localObject3 == null);
    long l1 = ((SharedPreferences)localObject3).getLong(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a + "timeStamp", System.currentTimeMillis());
    if (System.currentTimeMillis() - l1 < 3600L) {}
    for (int i = 1;; i = 0)
    {
      localObject3 = ((TroopOrgDataManager)localObject2).c(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      if ((localObject3 == null) || (i == 0)) {
        break;
      }
      if ((localObject3 != null) && (mOrgs != null)) {
        try
        {
          if (new JSONArray(mOrgs).length() != 0)
          {
            localObject1 = TroopChatPie.j(a).obtainMessage(49);
            arg1 = 1;
            ((Message)localObject1).sendToTarget();
            return;
          }
        }
        catch (JSONException localJSONException) {}
      }
      TroopChatPie.k(a).sendEmptyMessage(49);
      return;
    }
    long l2 = Long.parseLong(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
    long l3 = Long.parseLong(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    if (localObject3 == null) {}
    for (l1 = 0L;; l1 = timeStamp)
    {
      localJSONException.b(l3, l2, l1, new lmf(this, localJSONException, (TroopOrgDataManager)localObject2));
      return;
    }
  }
}
