import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.tencent.mobileqq.app.BaseActivity2;
import com.tencent.mobileqq.gesturelock.GesturePWDUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mtk
  extends BroadcastReceiver
{
  private mtk(BaseActivity2 paramBaseActivity2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (paramIntent.getAction().equals("android.intent.action.SCREEN_OFF"))
    {
      BaseActivity2.F = false;
      GesturePWDUtils.setAppForground(paramContext, BaseActivity2.F);
    }
  }
}
