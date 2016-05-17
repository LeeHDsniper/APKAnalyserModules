import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.item.ThumbItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SVIPHandler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.vas.IndividuationMarketUrlUtils;
import com.tencent.mobileqq.vaswebviewplugin.VasWebviewUtil;

public class lbt
  implements View.OnClickListener
{
  public lbt(ThumbItemBuilder paramThumbItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = new Intent(a.jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
    String str = IndividuationMarketUrlUtils.a(a.jdField_a_of_type_AndroidContentContext, 10, "mvip.gongneng.anroid.individuation.web") + "&type=" + "colorring";
    VasWebviewUtil.openQQBrowserWithoutAD(a.jdField_a_of_type_AndroidContentContext, str, 4194304L, paramView, true, -1);
    int i = ((SVIPHandler)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(13)).h();
    if (i == 2) {
      i = 0;
    }
    for (;;)
    {
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004A25", "0X8004A25", 0, 0, "" + i, "", "", "");
      return;
      if (i == 3) {
        i = 2;
      }
    }
  }
}
