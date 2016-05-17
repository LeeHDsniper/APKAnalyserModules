import android.os.Handler;
import android.os.Message;
import com.rookery.asyncHttpClient.AsyncHttpResponseHandler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class fad
  extends Handler
{
  public fad(AsyncHttpResponseHandler paramAsyncHttpResponseHandler)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    a.a(paramMessage);
  }
}
