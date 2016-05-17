import android.content.Context;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.highway.config.ConfigManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;

public class ndt
  implements Runnable
{
  public ndt(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject = BaseApplication.getContext();
    String str = a.a();
    localObject = ConfigManager.getInstance((Context)localObject, a, a.a(), str);
    if (localObject != null) {
      ((ConfigManager)localObject).onProxyIpChanged(a);
    }
  }
}
