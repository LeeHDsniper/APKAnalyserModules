import com.tencent.mobileqq.activity.qwallet.QWalletPushManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class mde
  implements Runnable
{
  public mde(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (QWalletPushManager.a(a)) {
      QWalletPushManager.a(a);
    }
  }
}
