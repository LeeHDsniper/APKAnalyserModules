import android.os.Handler.Callback;
import android.os.Message;
import com.tencent.mobileqq.activity.recent.PollBanner;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mga
  implements Handler.Callback
{
  public mga(PollBanner paramPollBanner)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    if (1 == what) {
      a.c();
    }
    return true;
  }
}
