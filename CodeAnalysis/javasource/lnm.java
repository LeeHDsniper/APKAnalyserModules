import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.activity.aio.tips.VipFunCallTipsBar;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.VipUtils;
import com.tencent.mobileqq.vas.IndividuationMarketUrlUtils;
import com.tencent.mobileqq.vaswebviewplugin.VasWebviewUtil;

public class lnm
  implements View.OnClickListener
{
  private long jdField_a_of_type_Long;
  
  public lnm(VipFunCallTipsBar paramVipFunCallTipsBar)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Long = 0L;
  }
  
  public void onClick(View paramView)
  {
    long l = System.currentTimeMillis();
    if (l - jdField_a_of_type_Long < 200L) {
      return;
    }
    jdField_a_of_type_Long = l;
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsVipFunCallTipsBar.jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
    paramView = new Intent(VipFunCallTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsVipFunCallTipsBar), QQBrowserActivity.class);
    paramView.putExtra("hide_left_button", false);
    paramView.putExtra("show_right_close_button", false);
    paramView.putExtra("startOpenPageTime", System.currentTimeMillis());
    String str = IndividuationMarketUrlUtils.a(VipFunCallTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsVipFunCallTipsBar), 8, "mvip.gongneng.anroid.individuation.web");
    VasWebviewUtil.openQQBrowserWithoutAD(VipFunCallTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsVipFunCallTipsBar), str, 524288L, paramView, false, -1);
    VipUtils.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsVipFunCallTipsBar.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "QQVIPFUNCALL", "0X8004D8C", "0X8004D8C", 4, 0, new String[0]);
    paramView = jdField_a_of_type_ComTencentMobileqqActivityAioTipsVipFunCallTipsBar.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getPreferences().edit();
    paramView.putInt("funcall_tip_" + jdField_a_of_type_ComTencentMobileqqActivityAioTipsVipFunCallTipsBar.jdField_a_of_type_JavaLangString, 4);
    paramView.commit();
  }
}
