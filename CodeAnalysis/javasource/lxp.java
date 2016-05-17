import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.phone.BindNumberActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lxp
  implements DialogInterface.OnClickListener
{
  public lxp(BindNumberActivity paramBindNumberActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface.dismiss();
  }
}
