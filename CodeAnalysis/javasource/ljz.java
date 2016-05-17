import android.os.Handler;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ljz
  implements Runnable
{
  public ljz(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject = (PublicAccountDataManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
    if (localObject != null) {}
    for (localObject = ((PublicAccountDataManager)localObject).b(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);; localObject = null)
    {
      if (localObject != null) {
        a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(1);
      }
      return;
    }
  }
}
