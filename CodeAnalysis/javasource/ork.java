import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.tencent.mobileqq.filemanager.app.FileTransferObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class ork
  extends Handler
{
  public ork(Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    Object[] arrayOfObject = (Object[])obj;
    ((FileTransferObserver)arrayOfObject[0]).a(what, ((Boolean)arrayOfObject[1]).booleanValue(), arrayOfObject[2]);
  }
}
