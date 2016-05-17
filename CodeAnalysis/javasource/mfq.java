import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.FrameLayout;
import com.tencent.mobileqq.activity.recent.Banner;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.config.Config;
import com.tencent.mobileqq.config.ConfigManager;
import com.tencent.mobileqq.config.splashlogo.ConfigServlet;
import com.tencent.mobileqq.config.struct.PicAndAdConf;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.struct.PushBanner;
import com.tencent.mobileqq.utils.JumpAction;
import com.tencent.mobileqq.widget.ADView;
import mqq.os.MqqHandler;

public class mfq
  implements View.OnClickListener
{
  public mfq(BannerManager paramBannerManager, View paramView, int paramInt, FrameLayout paramFrameLayout, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = (PushBanner)paramView.getTag();
    Object localObject;
    if (paramView != null)
    {
      localObject = ajdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).app.getAccount();
      ReportController.b(ajdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).app, "CliOper", "", (String)localObject, "Push_Banner", "Click_Banner", 0, 0, "", "", "", "");
      a.a();
      ADView localADView = (ADView)jdField_a_of_type_AndroidViewView.findViewById(2131298629);
      if (localADView != null)
      {
        if (localADView.a(0) <= 1) {
          break label165;
        }
        localADView.a(0, jdField_a_of_type_Int, jdField_a_of_type_AndroidWidgetFrameLayout);
      }
    }
    for (;;)
    {
      ThreadManager.a().post(new mfr(this, paramView));
      Config.a.b(jdField_a_of_type_JavaLangString);
      paramView = new ConfigManager(BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).getApplicationContext(), ConfigServlet.h);
      if (paramView != null)
      {
        paramView.b();
        paramView.c();
      }
      return;
      label165:
      BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).getSharedPreferences("mobileQQ", 0).edit().putBoolean("push_banner_display" + (String)localObject, false).commit();
      localObject = BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager)[16];
      if ((localObject != null) && (jdField_a_of_type_AndroidViewView != null))
      {
        localObject = (ADView)jdField_a_of_type_AndroidViewView.findViewById(2131298629);
        if (localObject != null) {
          ((ADView)localObject).a();
        }
      }
      jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager.a(16, 0);
      jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager.a(-1, null);
      jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager.b = false;
    }
  }
}
