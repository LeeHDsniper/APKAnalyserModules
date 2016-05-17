import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.nearby.NearbyUtils;
import com.tencent.mobileqq.nearby.ipc.NearbyProxyObserver;
import com.tencent.pb.getbusiinfo.BusinessInfoCheckUpdate.AppInfo;
import com.tencent.qphone.base.util.QLog;

public class lvn
  extends NearbyProxyObserver
{
  public lvn(MainAssistObserver paramMainAssistObserver)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(BusinessInfoCheckUpdate.AppInfo paramAppInfo)
  {
    if (QLog.isColorLevel()) {
      NearbyUtils.a(2, "NearbyUtils", "MainAssist onGetNearbyUnreadEvent", new Object[0]);
    }
    a.h();
  }
}
