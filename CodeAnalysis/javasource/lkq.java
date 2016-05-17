import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.utils.TroopGiftManager;

public class lkq
  implements Runnable
{
  public lkq(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    TroopGiftManager localTroopGiftManager = (TroopGiftManager)a.a.getManager(112);
    if (localTroopGiftManager != null) {
      localTroopGiftManager.d();
    }
  }
}
