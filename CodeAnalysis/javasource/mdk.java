import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.tencent.mobileqq.activity.qwallet.SendHbActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mdk
  extends BroadcastReceiver
{
  public mdk(SendHbActivity paramSendHbActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (("tencent.av.v2q.StartVideoChat".equals(paramIntent.getAction())) && (SendHbActivity.c(a)) && ((SendHbActivity.a(a) & 0x40) > 0)) {
      a.finish();
    }
  }
}
