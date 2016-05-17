import com.tencent.mobileqq.activity.recent.RecentCallHelper;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.OverScrollViewListener;

public class mgu
  implements Runnable
{
  public mgu(RecentCallHelper paramRecentCallHelper, BaseActivity paramBaseActivity, OverScrollViewListener paramOverScrollViewListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    RecentCallHelper.a(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentCallHelper, jdField_a_of_type_ComTencentMobileqqAppBaseActivity, jdField_a_of_type_ComTencentWidgetOverScrollViewListener);
  }
}
