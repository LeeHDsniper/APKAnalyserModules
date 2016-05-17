import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import com.tencent.mobileqq.activity.ContactSyncJumpActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ipr
  implements DialogInterface.OnCancelListener
{
  public ipr(ContactSyncJumpActivity paramContactSyncJumpActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onCancel(DialogInterface paramDialogInterface)
  {
    a.finish();
  }
}
