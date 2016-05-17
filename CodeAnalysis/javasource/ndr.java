import android.app.NotificationManager;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ndr
  implements Runnable
{
  public ndr(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      NotificationManager localNotificationManager = (NotificationManager)QQAppInterface.e(a).getSystemService("notification");
      localNotificationManager.cancel(121);
      localNotificationManager.cancel(119);
      localNotificationManager.cancel(122);
      localNotificationManager.cancel(123);
      localNotificationManager.cancel(129);
      localNotificationManager.cancel(135);
      localNotificationManager.cancel(140);
      localNotificationManager.cancel(144);
      localNotificationManager.cancel(193);
      return;
    }
    catch (Exception localException) {}
  }
}
