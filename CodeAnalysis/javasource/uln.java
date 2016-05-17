import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.qlink.QQProxyForQlink;

public class uln
  implements DialogInterface.OnDismissListener
{
  public uln(QQProxyForQlink paramQQProxyForQlink)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    QQProxyForQlink.a(a, null);
  }
}
