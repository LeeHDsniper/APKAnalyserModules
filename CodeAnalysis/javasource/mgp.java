import android.os.Message;
import com.tencent.mobileqq.activity.recent.LightTalkTipsData;
import com.tencent.mobileqq.activity.recent.RecentCallHelper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import mqq.os.MqqHandler;

public class mgp
  implements Runnable
{
  public mgp(RecentCallHelper paramRecentCallHelper, int paramInt, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Message localMessage = new Message();
    if (LightTalkTipsData.a() != null)
    {
      what = 2;
      obj = Integer.valueOf(jdField_a_of_type_Int);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecentCallHelper.a.sendMessage(localMessage);
      if (QLog.isColorLevel()) {
        QLog.d("RecentCallHelper", 2, "showLightalkTipsIfNeed show : " + RecentCallHelper.c(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentCallHelper) + " num + " + jdField_a_of_type_Int + " fromResume " + jdField_a_of_type_Boolean);
      }
      return;
      if (RecentCallHelper.c(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentCallHelper)) {
        what = 3;
      }
    }
  }
}
