import android.content.Intent;
import android.os.Message;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.theme.ThemeUtil;
import com.tencent.qphone.base.util.QLog;
import mqq.os.MqqHandler;

public class mfe
  implements View.OnClickListener
{
  public mfe(BannerManager paramBannerManager, String paramString1, String paramString2, String paramString3)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = new StringBuilder("http://imgcache.qq.com/club/themes/mobile/theme_new/html/detail.html?id=");
    paramView.append(jdField_a_of_type_JavaLangString);
    paramView.append("&uin=");
    paramView.append(b);
    paramView.append("&platformId=2&_wv=4099&version=");
    paramView.append("6.3.3");
    paramView.append("&sid=");
    paramView.append(c);
    paramView.append("&density=");
    paramView.append(ThemeUtil.getThemeDensity(BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager)));
    if (QLog.isColorLevel()) {
      QLog.i("Q.recent.banner", 2, "url:" + paramView.toString());
    }
    Intent localIntent = new Intent(BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager), QQBrowserActivity.class);
    localIntent.putExtra("url", paramView.toString());
    BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).startActivity(localIntent);
    BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).obtainMessage(12).sendToTarget();
    ReportController.b(ajdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).app, "CliOper", "", "", "0X8005B9F", "0X8005B9F", 0, 0, "", "", "", "");
  }
}
