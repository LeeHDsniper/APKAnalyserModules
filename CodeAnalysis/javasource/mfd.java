import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.biz.webviewbase.WebViewJumpAction;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.os.MqqHandler;

public class mfd
  implements View.OnClickListener
{
  public mfd(BannerManager paramBannerManager, Bundle paramBundle)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager) != null)
    {
      paramView = BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).obtainMessage(1134042);
      BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).sendMessage(paramView);
    }
    paramView = (String)jdField_a_of_type_AndroidOsBundle.getCharSequence("activity");
    if (!TextUtils.isEmpty(paramView)) {
      try
      {
        paramView = Class.forName(paramView);
        if (paramView != null)
        {
          paramView = new Intent(BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).getApplicationContext(), paramView);
          String str = (String)jdField_a_of_type_AndroidOsBundle.getCharSequence("action");
          if (!TextUtils.isEmpty(str)) {
            paramView.setAction(str);
          }
          str = (String)jdField_a_of_type_AndroidOsBundle.getCharSequence("category");
          if (!TextUtils.isEmpty(str)) {
            paramView.addCategory(str);
          }
          paramView.setFlags(jdField_a_of_type_AndroidOsBundle.getInt("flags", 0));
          BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).startActivity(paramView);
        }
        return;
      }
      catch (ClassNotFoundException paramView)
      {
        for (;;)
        {
          paramView = null;
        }
      }
    }
    paramView = new Intent(BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).getApplicationContext(), WebViewJumpAction.class);
    paramView.putExtra("from_conversation", true);
    paramView.addFlags(268435456);
    BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).startActivity(paramView);
  }
}
