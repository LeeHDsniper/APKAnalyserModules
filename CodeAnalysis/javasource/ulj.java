import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQCustomDialog;
import cooperation.qlink.QQProxyForQlink;

class ulj
  extends BroadcastReceiver
{
  ulj(uli paramUli)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (("com.tencent.qlink.finishworkingdlg".equalsIgnoreCase(paramIntent.getAction())) && (QQProxyForQlink.a(a.a) != null))
    {
      QQProxyForQlink.a(a.a).dismiss();
      QQProxyForQlink.a(a.a, null);
    }
  }
}
