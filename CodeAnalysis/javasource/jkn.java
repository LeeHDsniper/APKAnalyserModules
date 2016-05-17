import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import com.tencent.mobileqq.activity.NotificationActivity;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class jkn
  implements DialogInterface.OnClickListener
{
  public jkn(NotificationActivity paramNotificationActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface = "http://aq.qq.com/007?from=andapp&account=" + NotificationActivity.b(a);
    Intent localIntent = new Intent(a.getActivity(), QQBrowserActivity.class);
    a.startActivity(localIntent.putExtra("url", paramDialogInterface));
    a.finish();
  }
}
