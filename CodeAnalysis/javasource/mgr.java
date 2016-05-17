import android.os.Message;
import com.tencent.mobileqq.activity.recent.RecentCallHelper;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.jumplightalk.CallTabLightalkConfig;
import mqq.os.MqqHandler;

public class mgr
  implements Runnable
{
  public mgr(RecentCallHelper paramRecentCallHelper)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if ((a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) && (CallTabLightalkConfig.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()) != null) && (RecentCallHelper.a(a) != null) && (a.i))
    {
      Message localMessage = new Message();
      what = 1;
      obj = Boolean.valueOf(true);
      a.jdField_a_of_type_MqqOsMqqHandler.sendMessage(localMessage);
    }
  }
}
