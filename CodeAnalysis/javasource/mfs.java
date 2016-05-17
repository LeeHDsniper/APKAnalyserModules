import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import android.webkit.URLUtil;
import com.tencent.mobileqq.activity.PhoneUnityBindInfoActivity;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.PhoneUnityBannerData;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class mfs
  implements View.OnClickListener
{
  public mfs(BannerManager paramBannerManager, PhoneUnityBannerData paramPhoneUnityBannerData)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    ReportController.b(ajdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).app, "CliOper", "", "", "0X8005B73", "0X8005B73", 0, 0, "", "", "", "");
    paramView = BaseActivity.sTopActivity;
    Intent localIntent;
    if (paramView != null)
    {
      if (!URLUtil.isValidUrl(jdField_a_of_type_ComTencentMobileqqAppPhoneUnityBannerData.a)) {
        break label110;
      }
      localIntent = new Intent(paramView, QQBrowserActivity.class);
      localIntent.putExtra("hide_operation_bar", true);
      localIntent.putExtra("url", jdField_a_of_type_ComTencentMobileqqAppPhoneUnityBannerData.a);
      localIntent.putExtra("hideRightButton", true);
      paramView.startActivity(localIntent);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager.a(4, 0);
      return;
      label110:
      localIntent = new Intent(paramView, PhoneUnityBindInfoActivity.class);
      localIntent.putExtra("kSrouce", 0);
      paramView.startActivity(localIntent);
    }
  }
}
