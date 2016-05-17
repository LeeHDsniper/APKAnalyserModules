import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.recent.RecentCallHelper;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.VipUtils;
import com.tencent.mobileqq.vas.IndividuationMarketUrlUtils;
import com.tencent.mobileqq.vaswebviewplugin.VasWebviewUtil;

public class mgn
  implements View.OnClickListener
{
  public mgn(RecentCallHelper paramRecentCallHelper, BaseActivity paramBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = new Intent(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, QQBrowserActivity.class);
    paramView.putExtra("hide_left_button", false);
    paramView.putExtra("show_right_close_button", false);
    paramView.putExtra("startOpenPageTime", System.currentTimeMillis());
    String str = IndividuationMarketUrlUtils.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 8, "mvip.gongneng.anroid.individuation.web");
    VasWebviewUtil.openQQBrowserWithoutAD(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, str, 524288L, paramView, false, -1);
    VipUtils.a(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentCallHelper.a, "QQVIPFUNCALL", "0X8004D8C", "0X8004D8C", 2, 0, new String[0]);
    paramView = jdField_a_of_type_ComTencentMobileqqActivityRecentRecentCallHelper.a.getPreferences().edit();
    paramView.putInt("funcall_RecentCall_Tipsnum", 4);
    paramView.commit();
  }
}
