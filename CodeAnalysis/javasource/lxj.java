import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import com.tencent.mobileqq.activity.phone.BaseActivityView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lxj
  implements DialogInterface.OnDismissListener
{
  public lxj(BaseActivityView paramBaseActivityView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    a.a = null;
  }
}
