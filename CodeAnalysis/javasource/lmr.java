import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.tips.CommingRingTipsBar;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SVIPHandler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.vas.IndividuationMarketUrlUtils;
import com.tencent.mobileqq.vaswebviewplugin.VasWebviewUtil;

public class lmr
  implements View.OnClickListener
{
  public lmr(CommingRingTipsBar paramCommingRingTipsBar)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    a.jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
    paramView = new Intent(a.jdField_a_of_type_AndroidAppActivity, QQBrowserActivity.class);
    String str = IndividuationMarketUrlUtils.a(a.jdField_a_of_type_AndroidAppActivity, 10, "mvip.gongneng.anroid.individuation.web") + "&type=" + "comering";
    VasWebviewUtil.openQQBrowserWithoutAD(a.jdField_a_of_type_AndroidAppActivity, str, 4194304L, paramView, true, -1);
    int i = ((SVIPHandler)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(13)).h();
    ReportController.b(null, "CliOper", "", "", "0X8005001", "0X8005001", 0, 0, "" + i, "", "", "");
  }
}
