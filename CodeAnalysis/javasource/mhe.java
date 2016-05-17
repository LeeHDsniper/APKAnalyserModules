import android.os.Message;
import android.os.Process;
import com.tencent.mobileqq.activity.recent.RecentT9SearchActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.t9search.SearchDataManager;
import java.util.List;
import mqq.os.MqqHandler;

public class mhe
  implements Runnable
{
  public mhe(RecentT9SearchActivity paramRecentT9SearchActivity, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Process.setThreadPriority(10);
    List localList = SearchDataManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentT9SearchActivity.app, RecentT9SearchActivity.a(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentT9SearchActivity), jdField_a_of_type_Boolean);
    Message localMessage = jdField_a_of_type_ComTencentMobileqqActivityRecentRecentT9SearchActivity.a.obtainMessage();
    what = 10;
    obj = localList;
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecentT9SearchActivity.a.sendMessage(localMessage);
  }
}
