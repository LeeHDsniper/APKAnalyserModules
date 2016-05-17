import android.content.Intent;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.activity.NearbyMemberActivity;

public class llv
  implements View.OnClickListener
{
  public llv(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (TroopChatPie.a(a).getVisibility() != 8)
    {
      paramView = new Intent(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, NearbyMemberActivity.class);
      paramView.putExtra("troop_session", a.a());
      a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivityForResult(paramView, 9001);
      String str = "1";
      Object localObject = (TroopManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
      paramView = str;
      if (localObject != null)
      {
        paramView = str;
        if (!TextUtils.isEmpty(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()))
        {
          localObject = ((TroopManager)localObject).a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
          paramView = str;
          if (localObject != null)
          {
            paramView = str;
            if (((TroopInfo)localObject).isAdmin()) {
              paramView = "2";
            }
          }
        }
      }
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_AIO", "", "AIOchat", "Clk_nearby_mber", 0, 0, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, paramView, "", "");
    }
  }
}
