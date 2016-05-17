import android.content.Intent;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.QQEntityManagerFactory;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import mqq.app.Constants.LogoutReason;

public class ndo
  implements Runnable
{
  public ndo(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (!QQAppInterface.a(a).verifyAuthentication())
    {
      QLog.e(QQAppInterface.a, 1, "", new RuntimeException("WTF"));
      if (a.isLogin()) {
        a.logout(true);
      }
      Intent localIntent = new Intent("mqq.intent.action.ACCOUNT_KICKED");
      localIntent.putExtra("title", "登录失败");
      localIntent.putExtra("msg", "登录失败");
      localIntent.putExtra("reason", Constants.LogoutReason.kicked);
      localIntent.addFlags(268435456);
      BaseApplicationImpl.a.startActivity(localIntent);
    }
  }
}
