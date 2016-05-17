import android.os.Handler;
import android.os.Message;
import com.tencent.biz.TroopRedpoint.TroopRedTouchManager;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.redtouch.NumRedPointManager;
import com.tencent.mobileqq.redtouch.RedTouchManager;
import com.tencent.pb.getbusiinfo.BusinessInfoCheckUpdate.RedTypeInfo;
import com.tencent.qphone.base.util.QLog;
import cooperation.qzone.util.QZoneLogTags;
import cooperation.readinjoy.storage.ReadInJoyNotifyRedTouchInfo;

public class luy
  implements Runnable
{
  public luy(MainAssistObserver paramMainAssistObserver)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int k = 1;
    if ((a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) || (a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app == null)) {
      return;
    }
    for (;;)
    {
      int m;
      int j;
      try
      {
        Object localObject1 = (TroopRedTouchManager)a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.getManager(69);
        m = ((TroopRedTouchManager)localObject1).a();
        int n = ((TroopRedTouchManager)localObject1).b();
        int i1 = ((NumRedPointManager)a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.getManager(63)).a(0);
        localObject3 = ((RedTouchManager)a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.getManager(35)).a();
        if ((localObject3 == null) || (red_type.get() != 5)) {
          break label517;
        }
        i = Integer.parseInt(red_content.get());
        int i2 = a.a();
        localObject1 = MainAssistObserver.a(a);
        if (localObject1 == null) {
          break label358;
        }
        j = ((ReadInJoyNotifyRedTouchInfo)localObject1).a();
        j += i + i2 + n + i1;
        if ((localObject1 == null) || (!((ReadInJoyNotifyRedTouchInfo)localObject1).a())) {
          break label363;
        }
        i = k;
        label193:
        if (j <= 0) {
          break label368;
        }
        localObject1 = new BusinessInfoCheckUpdate.RedTypeInfo();
        red_type.set(5);
        red_content.set(j + "");
        red_desc.set("{'cn':'#FF0000'}");
        label252:
        localObject3 = a.jdField_a_of_type_AndroidOsHandler.obtainMessage(1);
        obj = localObject1;
        a.jdField_a_of_type_AndroidOsHandler.sendMessage((Message)localObject3);
        return;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
      if (!QLog.isColorLevel()) {
        break;
      }
      Object localObject3 = new StringBuilder().append("mActivity =  ").append(a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity).append(" app = ");
      if (a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) {}
      for (Object localObject2 = null;; localObject2 = a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app)
      {
        QLog.d("MainAssistObserver", 2, localObject2);
        return;
        label358:
        j = 0;
        break;
        label363:
        i = 0;
        break label193;
        label368:
        localObject2 = localObject3;
        if (localObject3 != null) {
          break label252;
        }
        if ((m <= 0) && (!MainAssistObserver.a(a)) && (i == 0)) {
          break label511;
        }
        localObject3 = new BusinessInfoCheckUpdate.RedTypeInfo();
        red_type.set(0);
        red_content.set("");
        red_desc.set("");
        localObject2 = localObject3;
        if (!QLog.isColorLevel()) {
          break label252;
        }
        QLog.d(QZoneLogTags.b + "MainAssistObserver", 2, "except qzone other redPointNums: " + m);
        localObject2 = localObject3;
        break label252;
      }
      label511:
      localObject2 = null;
      continue;
      label517:
      int i = 0;
    }
  }
}
