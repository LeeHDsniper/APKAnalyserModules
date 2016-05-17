import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.item.TroopFeeMsgItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.data.MessageForTroopFee;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lbw
  implements View.OnClickListener
{
  public lbw(TroopFeeMsgItemBuilder paramTroopFeeMsgItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    lbx localLbx = (lbx)AIOUtils.a(paramView);
    MessageForTroopFee localMessageForTroopFee = (MessageForTroopFee)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    Intent localIntent = new Intent(paramView.getContext(), QQBrowserActivity.class);
    localIntent.putExtra("url", actionUrl);
    paramView.getContext().startActivity(localIntent);
    paramView = ((TroopManager)a.a.getManager(51)).a(jdField_a_of_type_JavaLangString);
    int i;
    if (paramView != null)
    {
      if (!paramView.isTroopOwner(a.a.a())) {
        break label150;
      }
      i = 0;
    }
    for (;;)
    {
      ReportController.b(a.a, "P_CliOper", "Grp_pay", "", "grp_aio", "Clk_payobj", 0, 0, jdField_a_of_type_JavaLangString, i + "", "", "");
      return;
      label150:
      if (paramView.isAdmin()) {
        i = 1;
      } else {
        i = 2;
      }
    }
  }
}
