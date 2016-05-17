import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.recent.RecentCallHelper;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.fpsreport.FPSSwipListView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class mgv
  implements View.OnClickListener
{
  public mgv(RecentCallHelper paramRecentCallHelper, BaseActivity paramBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
    case 2131298638: 
      do
      {
        return;
        RecentCallHelper.a(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentCallHelper, true);
      } while (RecentCallHelper.a(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentCallHelper) == null);
      RecentCallHelper.a(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentCallHelper).setVisibility(0);
      return;
    }
    ReportController.b(null, "CliOper", "", "", "0X80052D0", "0X80052D0", 0, 0, "", "", "", "");
    paramView = new Intent(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, QQBrowserActivity.class);
    paramView.putExtra("isShowAd", false);
    paramView.putExtra("url", "http://play.mobile.qq.com/avchat/chatplay/avchathall.html?_wv=1025?adtag=client.tab");
    paramView.putExtra("hide_operation_bar", true);
    paramView.putExtra("hide_more_button", true);
    paramView.putExtra("selfSet_leftViewText", jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131367298));
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.startActivity(paramView);
  }
}
