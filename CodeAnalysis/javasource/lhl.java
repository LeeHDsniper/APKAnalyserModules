import android.app.Dialog;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.HotChatPie;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.HotChatHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

class lhl
  implements View.OnClickListener
{
  lhl(lhj paramLhj, Dialog paramDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if ((jdField_a_of_type_AndroidAppDialog != null) && (jdField_a_of_type_AndroidAppDialog.isShowing())) {
      jdField_a_of_type_AndroidAppDialog.dismiss();
    }
    jdField_a_of_type_Lhj.jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.h = new Dialog(jdField_a_of_type_Lhj.jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.a(), 2131558942);
    jdField_a_of_type_Lhj.jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.h.setContentView(2130903050);
    jdField_a_of_type_Lhj.jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.h.setCancelable(true);
    ((TextView)jdField_a_of_type_Lhj.jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.h.findViewById(2131296741)).setText(jdField_a_of_type_Lhj.jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.a().getString(2131368360));
    jdField_a_of_type_Lhj.jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.h.show();
    ((HotChatHandler)jdField_a_of_type_Lhj.jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(35)).a(jdField_a_of_type_Lhj.jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_Lhj.jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b, jdField_a_of_type_Lhj.jdField_a_of_type_ComTencentMobileqqDataChatMessage.senderuin, jdField_a_of_type_Lhj.jdField_a_of_type_JavaLangString);
    ReportController.b(jdField_a_of_type_Lhj.jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005D55", "0X8005D55", 0, 0, "", "", "", "");
  }
}
