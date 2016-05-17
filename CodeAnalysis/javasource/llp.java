import android.os.AsyncTask;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.utils.TroopGagMgr;
import com.tencent.mobileqq.troop.utils.TroopGagMgr.SelfGagInfo;

class llp
  extends AsyncTask
{
  llp(llo paramLlo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected TroopGagMgr.SelfGagInfo a(Void... paramVarArgs)
  {
    a.a.aH();
    return ((TroopGagMgr)a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(47)).a(a.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, true);
  }
  
  protected void a(TroopGagMgr.SelfGagInfo paramSelfGagInfo)
  {
    a.a.a(paramSelfGagInfo, true);
  }
}
