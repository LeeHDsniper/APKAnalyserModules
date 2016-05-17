import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;
import com.tencent.mobileqq.app.GuardManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class myf
  extends BroadcastReceiver
{
  public myf(GuardManager paramGuardManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    paramContext = paramIntent.getAction();
    if (QLog.isColorLevel()) {
      QLog.d("GuardManager", 2, paramContext);
    }
    if ("android.intent.action.SCREEN_OFF".equals(paramContext)) {
      if (a.a > 0L) {
        a.a(false);
      }
    }
    while ((!"android.intent.action.SCREEN_ON".equals(paramContext)) || (a.a != 0L) || (!GuardManager.a(a))) {
      return;
    }
    a.a = SystemClock.uptimeMillis();
  }
}
