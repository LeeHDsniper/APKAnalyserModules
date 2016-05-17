import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;

public class luo
  implements Runnable
{
  public luo(MainAssistObserver paramMainAssistObserver)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject = a.a;
    if (localObject != null) {}
    for (localObject = app;; localObject = null)
    {
      if (localObject != null)
      {
        localObject = (PhoneContactManager)((QQAppInterface)localObject).getManager(10);
        if (localObject != null) {
          ((PhoneContactManager)localObject).a(MainAssistObserver.a(a));
        }
      }
      return;
    }
  }
}
