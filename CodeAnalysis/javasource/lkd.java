import android.os.Bundle;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import mqq.observer.BusinessObserver;

public class lkd
  implements BusinessObserver
{
  public lkd(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle)
  {
    if (paramBoolean)
    {
      QLog.i("SSOHttpUtils", 2, "PublicAccount RefreshStepsObserver onReceive");
      ThreadManager.a(new lke(this), 5, null, true);
    }
  }
}
