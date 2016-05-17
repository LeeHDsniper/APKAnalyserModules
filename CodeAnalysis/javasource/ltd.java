import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.contact.troop.NotificationAdapter.ViewHolder;
import com.tencent.mobileqq.activity.contact.troop.NotificationView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBEnumField;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.statistics.ReportController;
import tencent.mobileim.structmsg.structmsg.StructMsg;

public class ltd
  implements View.OnClickListener
{
  public ltd(NotificationView paramNotificationView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = (NotificationAdapter.ViewHolder)paramView.getTag();
    if (jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg_type.get() == 2)
    {
      a.a(paramView);
      if (jdField_a_of_type_Int == 82) {
        ReportController.b(a.a, "P_CliOper", "Grp_public", "", "oper", "Clk_notice", 0, 0, "", "", "", jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.req_uin.get() + "");
      }
    }
  }
}
