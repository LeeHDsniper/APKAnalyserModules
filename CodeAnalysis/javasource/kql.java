import com.tencent.mobileqq.activity.aio.MediaPlayerManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.AudioUtil;

public class kql
  implements Runnable
{
  public kql(MediaPlayerManager paramMediaPlayerManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      AudioUtil.a(2131165186, 1, MediaPlayerManager.a(a), MediaPlayerManager.a(a));
      return;
    }
    catch (Throwable localThrowable) {}
  }
}
