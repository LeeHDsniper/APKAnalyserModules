import com.tencent.mobileqq.activity.aio.PlusPanel;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.data.TroopAIOAppInfo;
import com.tencent.mobileqq.troop.utils.TroopAppMgr;

public class kqs
  implements Runnable
{
  public kqs(PlusPanel paramPlusPanel, TroopAIOAppInfo paramTroopAIOAppInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    TroopAppMgr localTroopAppMgr = (TroopAppMgr)PlusPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel).getManager(108);
    if (localTroopAppMgr != null) {
      localTroopAppMgr.c(jdField_a_of_type_ComTencentMobileqqTroopDataTroopAIOAppInfo.appid);
    }
  }
}
