import android.support.v4.app.FragmentActivity;
import android.widget.RelativeLayout;
import com.tencent.biz.ui.CustomMenuBar.OnMenuItemClickListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.widget.QQProgressDialog;

public class liz
  implements CustomMenuBar.OnMenuItemClickListener
{
  public liz(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(String paramString, int paramInt1, int paramInt2)
  {
    com.tencent.mobileqq.activity.aio.AIOUtils.l = true;
    a.b = new QQProgressDialog(PublicAccountChatPie.d(a).getContext(), a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
    long l = NetConnInfoCenter.getServerTime();
    String str = a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a;
    if ("DO_FOLLOW".equals(paramString))
    {
      if (a.jdField_a_of_type_ComTencentMobileqqStructmsgAbsStructMsg != null) {
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", str, "0X8004EF5", "0X8004EF5", 0, 0, Long.toString(l), "", "" + a.jdField_a_of_type_ComTencentMobileqqStructmsgAbsStructMsg.msgId, PublicAccountChatPie.a(a));
      }
      a.q(2131364333);
      a.aB();
    }
    while (!"DO_NOT_FOLLOW".equals(paramString)) {
      return;
    }
    if (a.jdField_a_of_type_ComTencentMobileqqStructmsgAbsStructMsg != null) {
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", str, "0X8004EF7", "0X8004EF7", 0, 0, Long.toString(l), "", "" + a.jdField_a_of_type_ComTencentMobileqqStructmsgAbsStructMsg.msgId, "" + PublicAccountChatPie.a(a));
    }
    a.ay();
  }
}
