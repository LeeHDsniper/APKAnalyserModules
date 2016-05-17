import android.os.Handler.Callback;
import android.os.Message;
import com.tencent.mobileqq.activity.JumpActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class jdi
  implements Handler.Callback
{
  public jdi(JumpActivity paramJumpActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    a.finish();
    return true;
  }
}
