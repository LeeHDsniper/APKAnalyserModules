import android.content.IntentFilter;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;
import cooperation.qlink.QQProxyForQlink;

public class uli
  implements Runnable
{
  public uli(QQProxyForQlink paramQQProxyForQlink)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if ((QQProxyForQlink.a(a) == null) || (QQProxyForQlink.a(a).a() == null)) {
      return;
    }
    QQProxyForQlink.a(a, new ulj(this));
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("com.tencent.qlink.finishworkingdlg");
    QQProxyForQlink.a(a).a().registerReceiver(QQProxyForQlink.a(a), localIntentFilter);
  }
}
