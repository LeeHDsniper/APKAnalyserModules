import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import com.tencent.mobileqq.activity.phone.DialogBaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lyx
  implements DialogInterface.OnDismissListener
{
  public lyx(DialogBaseActivity paramDialogBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    a.a = null;
  }
}
