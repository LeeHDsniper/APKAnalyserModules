import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build.VERSION;
import android.view.View;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPlayActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mpb
  extends BroadcastReceiver
{
  public mpb(ShortVideoPlayActivity paramShortVideoPlayActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    paramContext = paramIntent.getAction();
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "onReceive ===>" + paramContext);
    }
    if ("android.intent.action.SCREEN_OFF".equals(paramContext))
    {
      a.m();
      if (a.a != null) {
        a.a.setVisibility(0);
      }
      if (a.b != null) {
        a.b.setVisibility(0);
      }
    }
    do
    {
      do
      {
        return;
      } while (!"tencent.av.v2q.StartVideoChat".equals(paramContext));
      if ((a.f == 1) && (Build.VERSION.SDK_INT >= 10)) {
        a.c = true;
      }
      a.m();
      if (a.a != null) {
        a.a.setVisibility(0);
      }
    } while (a.b == null);
    a.b.setVisibility(0);
  }
}
