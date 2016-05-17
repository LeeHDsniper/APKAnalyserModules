import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.recent.RecentCallHelper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.GuideViewBuilder;

public class mgw
  implements View.OnClickListener
{
  public mgw(RecentCallHelper paramRecentCallHelper, GuideViewBuilder paramGuideViewBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetGuideViewBuilder.a();
    RecentCallHelper.a(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentCallHelper, 1);
  }
}
