import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.selectmember.PhoneContactSelectActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mlm
  implements DialogInterface.OnClickListener
{
  public mlm(PhoneContactSelectActivity paramPhoneContactSelectActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    a.h();
    paramDialogInterface.dismiss();
  }
}
