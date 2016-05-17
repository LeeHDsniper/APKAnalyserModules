import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.upgrade.UpgradeController;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.redtouch.RedTouchManager;
import com.tencent.pb.getbusiinfo.BusinessInfoCheckUpdate.RedTypeInfo;

public class luw
  implements Runnable
{
  public luw(MainAssistObserver paramMainAssistObserver, QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      Object localObject2 = ((RedTouchManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(35)).b();
      Object localObject1 = localObject2;
      if (localObject2 == null)
      {
        localObject1 = localObject2;
        if (UpgradeController.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)) {
          localObject1 = new BusinessInfoCheckUpdate.RedTypeInfo();
        }
      }
      if (localObject1 != null) {
        red_type.set(0);
      }
      localObject2 = jdField_a_of_type_ComTencentMobileqqActivityMainMainAssistObserver.a.obtainMessage(0);
      obj = localObject1;
      jdField_a_of_type_ComTencentMobileqqActivityMainMainAssistObserver.a.sendMessage((Message)localObject2);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
}
