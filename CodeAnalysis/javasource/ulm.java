import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.qlink.QQProxyForQlink;

public class ulm
  implements DialogInterface.OnClickListener
{
  public ulm(QQProxyForQlink paramQQProxyForQlink)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    a.a("0X8004857", 1);
    paramDialogInterface.dismiss();
  }
}
