import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.NotificationActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class jkk
  implements DialogInterface.OnClickListener
{
  public jkk(NotificationActivity paramNotificationActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    a.finish();
  }
}
