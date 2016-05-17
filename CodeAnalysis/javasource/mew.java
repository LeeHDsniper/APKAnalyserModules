import android.content.Intent;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.BusinessInfoCheckUpdateItem;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.redtouch.RedTouchManager;
import com.tencent.mobileqq.redtouch.VipBannerInfo;
import com.tencent.mobileqq.utils.VipUtils;
import com.tencent.pb.getbusiinfo.BusinessInfoCheckUpdate.AppInfo;
import mqq.os.MqqHandler;

public class mew
  implements View.OnClickListener
{
  public mew(BannerManager paramBannerManager, VipBannerInfo paramVipBannerInfo, RedTouchManager paramRedTouchManager, BusinessInfoCheckUpdate.AppInfo paramAppInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    BusinessInfoCheckUpdateItem.a(ajdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).app, "200001", false);
    if ((jdField_a_of_type_ComTencentMobileqqRedtouchVipBannerInfo.d == null) || (TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqRedtouchVipBannerInfo.d)))
    {
      paramView = jdField_a_of_type_ComTencentMobileqqRedtouchVipBannerInfo.c;
      if (paramView == null)
      {
        paramView = "";
        switch (jdField_a_of_type_ComTencentMobileqqRedtouchVipBannerInfo.e)
        {
        }
      }
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqRedtouchRedTouchManager.a(jdField_a_of_type_ComTencentPbGetbusiinfoBusinessInfoCheckUpdate$AppInfo, jdField_a_of_type_ComTencentMobileqqRedtouchVipBannerInfo.a, 3);
      BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).removeMessages(9);
      BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).sendEmptyMessage(9);
      return;
      paramView = paramView.replace(" ", "_");
      break;
      VipUtils.a(BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager), 3, String.format("mvip.gongneng.mobileqq.androiddaoqiqian.xufeivip%s", new Object[] { paramView }));
      continue;
      VipUtils.b(BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager), 3, String.format("mvip.gongneng.mobileqq.androiddaoqiqian.xufeisvip%s", new Object[] { paramView }));
      continue;
      VipUtils.a(BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager), 3, String.format("mvip.gongneng.mobileqq.androidyidaoqi.xufeivip%s", new Object[] { paramView }));
      continue;
      VipUtils.b(BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager), 3, String.format("mvip.gongneng.mobileqq.androidyidaoqi.xufeisvip%s", new Object[] { paramView }));
      continue;
      paramView = new Intent(BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager), QQBrowserActivity.class);
      paramView.putExtra("url", jdField_a_of_type_ComTencentMobileqqRedtouchVipBannerInfo.d);
      BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).startActivity(paramView);
    }
  }
}
