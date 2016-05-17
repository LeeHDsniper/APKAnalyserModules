import android.content.Intent;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kbc
  implements Runnable
{
  public kbc(SplashActivity paramSplashActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Intent localIntent = new Intent("mqq.intent.action.NOTICE_ON_PCACTIVE");
    localIntent.addFlags(268435456);
    localIntent.putExtra("uin", a.app.getAccount());
    BaseApplicationImpl.a().startActivity(localIntent);
  }
}
