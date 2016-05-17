import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.tencent.mobileqq.activity.aio.item.ThumbItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lbs
  extends Handler
{
  public lbs(ThumbItemBuilder paramThumbItemBuilder, Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    if (what == ThumbItemBuilder.a) {
      a.a();
    }
  }
}
