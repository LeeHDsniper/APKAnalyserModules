import android.os.Bundle;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pluginsdk.ipc.RemoteCommand;
import com.tencent.mobileqq.pluginsdk.ipc.RemoteCommand.OnInvokeFinishLinstener;
import cooperation.qlink.QQProxyForQlink;
import cooperation.qlink.QlinkServiceManager;

public class ulx
  extends RemoteCommand
{
  public ulx(QlinkServiceManager paramQlinkServiceManager, String paramString)
  {
    super(paramString);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public Bundle invoke(Bundle paramBundle, RemoteCommand.OnInvokeFinishLinstener paramOnInvokeFinishLinstener)
  {
    QlinkServiceManager.a(a).a().c(paramBundle);
    return null;
  }
}
