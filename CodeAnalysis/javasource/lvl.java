import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.app.GuardManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.observer.QZoneObserver;
import com.tencent.qphone.base.util.QLog;

public class lvl
  extends QZoneObserver
{
  public lvl(MainAssistObserver paramMainAssistObserver)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2, int paramInt)
  {
    if ((paramBoolean1) && (paramBoolean2))
    {
      if (QLog.isColorLevel()) {
        QLog.d("MainActivity", 2, "inform onGetQZoneFeedCountFin");
      }
      if ((a.a != null) && (a.a.app != null)) {}
    }
    else
    {
      return;
    }
    QQAppInterface localQQAppInterface = a.a.app;
    if (!GuardManager.a.a()) {
      ThreadManager.a(new lvm(this, localQQAppInterface), 8, null, false);
    }
    a.h();
  }
}
