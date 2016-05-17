import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.redtouch.RedTouchManager;
import com.tencent.pb.getbusiinfo.BusinessInfoCheckUpdate.RedTypeInfo;

public class lux
  implements Runnable
{
  public lux(MainAssistObserver paramMainAssistObserver, QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      BusinessInfoCheckUpdate.RedTypeInfo localRedTypeInfo = ((RedTouchManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(35)).c();
      if (localRedTypeInfo != null) {
        red_type.set(0);
      }
      Message localMessage = jdField_a_of_type_ComTencentMobileqqActivityMainMainAssistObserver.a.obtainMessage(3);
      obj = localRedTypeInfo;
      jdField_a_of_type_ComTencentMobileqqActivityMainMainAssistObserver.a.sendMessage(localMessage);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
}
