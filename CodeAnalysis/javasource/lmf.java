import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.os.Message;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.troop.org.data.OrgMember;
import com.tencent.mobileqq.troop.org.data.TroopOrgDataManager;
import com.tencent.mobileqq.troop.org.pb.DataModel.MemberData;
import com.tencent.mobileqq.troop.org.pb.TroopOrgProtocolManager;
import com.tencent.mobileqq.troop.org.pb.oidb_0x497.ReadMemdataRsp;
import com.tencent.mobileqq.troop.org.pb.oidb_0x497.RspBody;
import com.tencent.qphone.base.util.BaseApplication;
import java.util.Iterator;
import java.util.List;
import mqq.observer.BusinessObserver;
import mqq.os.MqqHandler;
import org.json.JSONArray;
import org.json.JSONException;

class lmf
  implements BusinessObserver
{
  lmf(lme paramLme, TroopOrgProtocolManager paramTroopOrgProtocolManager, TroopOrgDataManager paramTroopOrgDataManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle)
  {
    int i = 1;
    if (paramBoolean)
    {
      paramBundle = paramBundle.getByteArray("data");
      paramBundle = (oidb_0x497.RspBody)jdField_a_of_type_ComTencentMobileqqTroopOrgPbTroopOrgProtocolManager.a(paramBundle)[1];
      if ((paramBundle != null) && (rpt_rsp_read_memdata.has()))
      {
        paramBundle = rpt_rsp_read_memdata.get().iterator();
        for (paramInt = 0; paramBundle.hasNext(); paramInt = 1)
        {
          oidb_0x497.ReadMemdataRsp localReadMemdataRsp = (oidb_0x497.ReadMemdataRsp)paramBundle.next();
          if (msg_member_data.has())
          {
            DataModel.MemberData localMemberData = (DataModel.MemberData)msg_member_data.get();
            long l = uint64_uin.get();
            jdField_a_of_type_ComTencentMobileqqTroopOrgDataTroopOrgDataManager.a(jdField_a_of_type_Lme.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "" + l, localMemberData, uint64_update_time.get());
          }
        }
        if (paramInt != 0)
        {
          paramBundle = jdField_a_of_type_ComTencentMobileqqTroopOrgDataTroopOrgDataManager.c(jdField_a_of_type_Lme.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, jdField_a_of_type_Lme.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
          if (paramBundle == null) {
            break label352;
          }
        }
      }
    }
    for (;;)
    {
      try
      {
        if ((mOrgs == null) || (new JSONArray(mOrgs).length() == 0)) {
          break label352;
        }
        paramBundle = TroopChatPie.l(jdField_a_of_type_Lme.a).obtainMessage(49);
        arg1 = 1;
        paramBundle.sendToTarget();
        paramInt = i;
        if (paramInt == 0) {
          TroopChatPie.m(jdField_a_of_type_Lme.a).sendEmptyMessage(49);
        }
      }
      catch (JSONException paramBundle)
      {
        continue;
      }
      paramBundle = BaseApplication.getContext().getSharedPreferences("request_timestamp", 0);
      if (paramBundle == null) {
        return;
      }
      paramBundle.edit().putLong(jdField_a_of_type_Lme.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a + "timeStamp", System.currentTimeMillis()).commit();
      return;
      label352:
      paramInt = 0;
    }
  }
}
