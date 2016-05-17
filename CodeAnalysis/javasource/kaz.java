import android.app.NotificationManager;
import android.content.IntentFilter;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.servlet.QZoneManagerImp;

public class kaz
  implements Runnable
{
  public kaz(SplashActivity paramSplashActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      NotificationManager localNotificationManager = (NotificationManager)a.getSystemService("notification");
      localNotificationManager.cancel(120);
      QZoneManagerImp localQZoneManagerImp = (QZoneManagerImp)a.app.getManager(9);
      if (localQZoneManagerImp != null) {
        localQZoneManagerImp.a(1, 0);
      }
      localNotificationManager.cancel(121);
      localNotificationManager.cancel(122);
      localNotificationManager.cancel(123);
      localNotificationManager.cancel(129);
      localNotificationManager.cancel(144);
      localNotificationManager.cancel(193);
      localNotificationManager.cancel(194);
      SplashActivity.a(a, new kba(this));
      a.registerReceiver(SplashActivity.a(a), new IntentFilter("before_account_change"));
      SplashActivity.a(a, true);
      return;
    }
    catch (Exception localException) {}
  }
}
