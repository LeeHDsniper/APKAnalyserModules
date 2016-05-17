import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.QQBrowserDelegationActivity;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;

public class mft
  implements View.OnClickListener
{
  public mft(BannerManager paramBannerManager, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.recent.banner", 2, "click move to url:" + jdField_a_of_type_JavaLangString);
    }
    paramView = new Intent(BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager), QQBrowserDelegationActivity.class);
    paramView.putExtra("injectrecommend", true);
    BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).startActivity(paramView.putExtra("url", jdField_a_of_type_JavaLangString));
    ReportController.a(ajdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).app, "CliOper", "", "", "0X8004029", "0X8004029", 0, 0, "", "", "", "");
  }
}
