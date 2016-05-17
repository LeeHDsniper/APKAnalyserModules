import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.NotificationActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;

public class jkm
  implements DialogInterface.OnClickListener
{
  public jkm(NotificationActivity paramNotificationActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    SettingCloneUtil.writeValue(a.app.a(), null, "security_scan_key", "qqsetting_security_scan_key", true);
    a.app.A();
    a.finish();
  }
}
