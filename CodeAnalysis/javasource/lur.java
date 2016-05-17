import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class lur
  implements Runnable
{
  lur(luq paramLuq)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    SplashActivity localSplashActivity = a.a.a;
    if ((localSplashActivity == null) || (app == null)) {}
    QQMessageFacade localQQMessageFacade;
    do
    {
      return;
      localQQMessageFacade = app.a();
    } while (localQQMessageFacade == null);
    localSplashActivity.runOnUiThread(new lus(this, localQQMessageFacade.e()));
  }
}
