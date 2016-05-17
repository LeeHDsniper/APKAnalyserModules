import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.config.AboutConfig;
import com.tencent.mobileqq.data.ResourcePluginInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.qphone.base.util.QLog;
import java.util.List;

public class nts
  implements Runnable
{
  public nts(AboutConfig paramAboutConfig)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    EntityManager localEntityManager = AboutConfig.a(a).a().createEntityManager();
    List localList = ResourcePluginInfo.getAll(localEntityManager, 32, false);
    localEntityManager.a();
    if ((localList != null) && (localList.size() > 0))
    {
      AboutConfig.a(a);
      AboutConfig.a(a, localList);
      if (QLog.isColorLevel()) {
        QLog.d("AboutConfig", 2, "Load about config from DB = " + AboutConfig.a(a));
      }
      a.b();
    }
  }
}
