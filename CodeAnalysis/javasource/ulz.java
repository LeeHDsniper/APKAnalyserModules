import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.qlink.QlinkServiceProxy;
import cooperation.qlink.SendMsg;
import java.util.concurrent.ConcurrentLinkedQueue;

public class ulz
  extends Thread
{
  public ulz(QlinkServiceProxy paramQlinkServiceProxy)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    while (!QlinkServiceProxy.a(a).isEmpty())
    {
      SendMsg localSendMsg = (SendMsg)QlinkServiceProxy.a(a).poll();
      if (localSendMsg != null) {
        try
        {
          QlinkServiceProxy.a(a, localSendMsg);
        }
        catch (Exception localException)
        {
          localException.printStackTrace();
        }
      }
    }
  }
}
