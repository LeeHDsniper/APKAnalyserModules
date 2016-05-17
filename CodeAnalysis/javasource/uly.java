import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import cooperation.qlink.IQlinkService.Stub;
import cooperation.qlink.QlinkServiceProxy;
import mqq.app.AppRuntime;
import mqq.app.MobileQQ;

public class uly
  implements ServiceConnection
{
  public uly(QlinkServiceProxy paramQlinkServiceProxy)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
  {
    QLog.d("QlinkServiceProxy", 1, "onServiceConnected service:" + paramComponentName);
    QlinkServiceProxy.a(a, IQlinkService.Stub.a(paramIBinder));
    QlinkServiceProxy.a(a, false);
    QlinkServiceProxy.a(a);
  }
  
  public void onServiceDisconnected(ComponentName paramComponentName)
  {
    QLog.d("QlinkServiceProxy", 1, "onServiceDisconnected " + paramComponentName);
    try
    {
      QlinkServiceProxy.a(a).getApplication().unbindService(QlinkServiceProxy.a(a));
      QlinkServiceProxy.a(a, null);
      QlinkServiceProxy.a(a, false);
      return;
    }
    catch (Exception paramComponentName)
    {
      for (;;)
      {
        paramComponentName.printStackTrace();
      }
    }
  }
}
