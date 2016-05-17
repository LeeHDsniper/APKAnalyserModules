import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.tencent.mobileqq.activity.NotificationActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class jlc
  extends BroadcastReceiver
{
  public jlc(NotificationActivity paramNotificationActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if ((paramIntent.getAction().equals("com.tencent.mobileqq.closeNotification")) && (NotificationActivity.a(a) == 5)) {
      a.finish();
    }
  }
}
