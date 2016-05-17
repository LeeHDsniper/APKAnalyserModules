import android.os.RemoteException;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pluginsdk.OnPluginInstallListener;
import com.tencent.mobileqq.pluginsdk.PluginManagerClient;
import com.tencent.mobileqq.pluginsdk.PluginManagerHelper.OnPluginManagerLoadedListener;

class una
  implements PluginManagerHelper.OnPluginManagerLoadedListener
{
  una(umz paramUmz)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onPluginManagerLoaded(PluginManagerClient paramPluginManagerClient)
  {
    try
    {
      if (!paramPluginManagerClient.isPluginInstalled("qqfav.apk"))
      {
        if (a.a == null)
        {
          paramPluginManagerClient.installPlugin("qqfav.apk");
          return;
        }
        paramPluginManagerClient.installPlugin("qqfav.apk", a.a);
        return;
      }
    }
    catch (Exception paramPluginManagerClient)
    {
      if (a.a != null)
      {
        try
        {
          a.a.onInstallError("qqfav.apk", -1);
          return;
        }
        catch (RemoteException paramPluginManagerClient)
        {
          paramPluginManagerClient.printStackTrace();
          return;
        }
        paramPluginManagerClient = a.a;
        if (paramPluginManagerClient != null) {
          try
          {
            a.a.onInstallFinish("qqfav.apk");
            return;
          }
          catch (RemoteException paramPluginManagerClient)
          {
            paramPluginManagerClient.printStackTrace();
          }
        }
      }
    }
  }
}
