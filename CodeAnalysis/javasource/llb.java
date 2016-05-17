import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.ModifyTroopMemberCardActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.data.TroopAioTips;

class llb
  implements View.OnClickListener
{
  llb(lla paramLla)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = new Intent(a.a.a.a.jdField_a_of_type_AndroidContentContext, ModifyTroopMemberCardActivity.class);
    paramView.putExtra("selfSet_leftViewText", a.a.a.a.jdField_a_of_type_AndroidContentContext.getString(2131367694));
    paramView.putExtra("troopUin", a.a.a.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    paramView.putExtra("memberUin", a.a.a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
    paramView.putExtra("troopCode", a.a.a.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
    a.a.a.a.jdField_a_of_type_AndroidContentContext.startActivity(paramView);
    if (a.a.a.a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
      a.a.a.a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.j();
    }
    ReportController.b(a.a.a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80058F8", "0X80058F8", 0, 0, "", "", "", "");
  }
}
