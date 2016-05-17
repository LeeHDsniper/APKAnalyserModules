import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.tencent.mobileqq.filemanager.core.OnlineFileSessionCenter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class otd
  extends Handler
{
  public otd(OnlineFileSessionCenter paramOnlineFileSessionCenter, Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    a.d();
  }
}
