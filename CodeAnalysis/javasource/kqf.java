import android.os.Looper;
import android.os.Message;
import com.tencent.mobileqq.activity.aio.FileTransferManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.TransProcessorHandler;

public class kqf
  extends TransProcessorHandler
{
  public kqf(FileTransferManager paramFileTransferManager, Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    a.a(paramMessage);
  }
}
