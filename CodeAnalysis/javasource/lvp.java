import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import com.tencent.mobileqq.activity.GesturePWDSettingActivity;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class lvp
  implements DialogInterface.OnClickListener
{
  public lvp(BaseActivity paramBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    Intent localIntent = new Intent(a, GesturePWDSettingActivity.class);
    localIntent.putExtra("key_reset", true);
    a.startActivity(localIntent);
    paramDialogInterface.dismiss();
  }
}
