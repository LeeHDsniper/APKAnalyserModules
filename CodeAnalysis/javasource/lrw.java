import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import com.tencent.mobileqq.activity.contact.newfriend.NewFriendActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lrw
  implements DialogInterface.OnDismissListener
{
  public lrw(NewFriendActivity paramNewFriendActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    a.a = null;
  }
}
