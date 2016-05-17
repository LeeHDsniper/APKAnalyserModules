import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.os.Bundle;
import com.tencent.mobileqq.activity.LoginActivity;
import com.tencent.mobileqq.activity.NotificationActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class jla
  implements DialogInterface.OnClickListener
{
  public jla(NotificationActivity paramNotificationActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface = new Intent("qqplayer_exit_action");
    a.sendBroadcast(paramDialogInterface);
    paramDialogInterface = new Bundle();
    paramDialogInterface.putString("password", null);
    a.startActivity(new Intent(a, LoginActivity.class).putExtras(paramDialogInterface).addFlags(67108864));
    a.finish();
  }
}
