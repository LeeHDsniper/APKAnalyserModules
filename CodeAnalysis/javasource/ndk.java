import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ndk
  extends BroadcastReceiver
{
  public ndk(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if ((paramIntent != null) && ("com.tencent.qqhead.getheadreq".equals(paramIntent.getAction()))) {
      ThreadManager.a(new ndl(this, paramContext, paramIntent), 8, null, true);
    }
  }
}
