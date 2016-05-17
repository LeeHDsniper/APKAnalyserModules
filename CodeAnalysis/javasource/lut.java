import android.content.Intent;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.app.CallTabUnreadListener;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.qcall.QCallFacade;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;

public class lut
  implements CallTabUnreadListener
{
  public lut(MainAssistObserver paramMainAssistObserver)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("SplashActivity", 4, "msg fresh callback...");
    }
    if ((a.a == null) || (a.a.app == null)) {}
    QQAppInterface localQQAppInterface;
    do
    {
      return;
      localQQAppInterface = a.a.app;
      localObject = (QCallFacade)a.a.app.getManager(37);
    } while (localObject == null);
    int i = ((QCallFacade)localObject).a();
    a.a(36, 16, Integer.valueOf(i));
    Object localObject = new Intent("com.tencent.qq.syncQQMessage");
    localQQAppInterface.a().sendBroadcast((Intent)localObject);
    if (QLog.isDevelopLevel()) {
      QLog.d("SplashActivity", 4, "msg fresh callback.msgNum.." + i);
    }
    localQQAppInterface.G();
  }
}
