import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.phone.DialogBaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lyw
  implements DialogInterface.OnClickListener
{
  public lyw(DialogBaseActivity paramDialogBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    a.finish();
  }
}
