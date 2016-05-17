import android.os.Handler;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.utils.StringUtil;
import com.tencent.qphone.base.util.QLog;
import java.util.List;
import tencent.im.oidb.cmd0x899.oidb_0x899.memberlist;

class lky
  implements Runnable
{
  lky(lkx paramLkx, List paramList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    TroopManager localTroopManager = (TroopManager)jdField_a_of_type_Lkx.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
    TroopInfo localTroopInfo = localTroopManager.a(jdField_a_of_type_Lkx.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    if (localTroopInfo == null) {}
    while (StringUtil.b(troopowneruin)) {
      return;
    }
    Administrator = "";
    int i;
    int j;
    label73:
    Object localObject;
    if (jdField_a_of_type_JavaUtilList == null)
    {
      i = 0;
      j = 0;
      if (j >= i) {
        break label212;
      }
      localObject = (oidb_0x899.memberlist)jdField_a_of_type_JavaUtilList.get(j);
      if ((localObject != null) && (uint64_member_uin.has())) {
        break label129;
      }
    }
    for (;;)
    {
      j += 1;
      break label73;
      i = jdField_a_of_type_JavaUtilList.size();
      break;
      label129:
      localObject = String.valueOf(uint64_member_uin.get());
      if ((localObject != null) && (!"".equals(((String)localObject).trim())) && (!troopowneruin.equals(((String)localObject).trim()))) {
        Administrator = (Administrator + (String)localObject + "|");
      }
    }
    label212:
    localTroopManager.b(localTroopInfo);
    if (QLog.isColorLevel()) {
      QLog.i("Q.aio.TroopChatPie", 2, Administrator);
    }
    jdField_a_of_type_Lkx.a.b.removeMessages(1);
    jdField_a_of_type_Lkx.a.b.sendEmptyMessage(1);
  }
}
