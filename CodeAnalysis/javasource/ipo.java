import android.os.Handler.Callback;
import android.os.Message;
import com.tencent.mobileqq.activity.ContactSyncJumpActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ipo
  implements Handler.Callback
{
  public ipo(ContactSyncJumpActivity paramContactSyncJumpActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    a.finish();
    return true;
  }
}
