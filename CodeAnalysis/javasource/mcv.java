import com.tencent.mobileqq.activity.qwallet.PreloadImgManager;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.vip.DownloadListener;
import com.tencent.mobileqq.vip.DownloadTask;
import mqq.os.MqqHandler;

public class mcv
  extends DownloadListener
{
  public mcv(PreloadImgManager paramPreloadImgManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDone(DownloadTask paramDownloadTask)
  {
    super.onDone(paramDownloadTask);
    ThreadManager.a().post(new mcw(this, paramDownloadTask));
  }
}
