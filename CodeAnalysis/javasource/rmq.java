import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.trick.TrickHelper;
import com.tencent.qphone.base.util.QLog;
import mqq.os.MqqHandler;

public class rmq
  extends BroadcastReceiver
{
  private rmq(TrickHelper paramTrickHelper)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    paramContext = paramIntent.getAction();
    if (QLog.isColorLevel()) {
      QLog.d("TrickHelper", 2, "received with " + paramContext);
    }
    if ("android.intent.action.SCREEN_OFF".equals(paramContext))
    {
      TrickHelper.b = false;
      ThreadManager.a().removeCallbacks(TrickHelper.a(a));
    }
    while (!"android.intent.action.SCREEN_ON".equals(paramContext)) {
      return;
    }
    TrickHelper.b = true;
    ThreadManager.a().postDelayed(TrickHelper.a(a), 2000L);
  }
}
