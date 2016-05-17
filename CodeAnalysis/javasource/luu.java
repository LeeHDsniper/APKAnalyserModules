import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager.IPhoneContactListener;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;

public class luu
  implements PhoneContactManager.IPhoneContactListener
{
  public luu(MainAssistObserver paramMainAssistObserver)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt) {}
  
  public void a(long paramLong) {}
  
  public void a(boolean paramBoolean, int paramInt)
  {
    if ((a.a == null) || (a.a.app == null)) {}
    QQAppInterface localQQAppInterface;
    do
    {
      return;
      localQQAppInterface = a.a.app;
    } while (SettingCloneUtil.readValue(a.a, localQQAppInterface.a(), null, "qqsetting_all_contacts_key", false));
    a.a(33, 16, Integer.valueOf(paramInt));
  }
  
  public void b(int paramInt) {}
  
  public void c(int paramInt) {}
}
