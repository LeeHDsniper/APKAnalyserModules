import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mpg
  extends BroadcastReceiver
{
  public mpg(ShortVideoPreviewActivity paramShortVideoPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if ("android.intent.action.SCREEN_OFF".equals(paramIntent.getAction()))
    {
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPreviewActivity", 2, "ACTION_SCREEN_OFF == >>");
      }
      a.c();
    }
  }
}
