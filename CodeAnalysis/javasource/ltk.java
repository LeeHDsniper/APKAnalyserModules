import com.tencent.mobileqq.activity.contact.troop.NotificationView;
import com.tencent.mobileqq.activity.contact.troop.TroopNotificationUtils;
import com.tencent.mobileqq.activity.contact.troop.TroopNotificationUtils.TroopPrivilegeCallback;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.qphone.base.util.QLog;
import tencent.mobileim.structmsg.structmsg.StructMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsg;

public class ltk
  implements TroopNotificationUtils.TroopPrivilegeCallback
{
  public ltk(NotificationView paramNotificationView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(String paramString, structmsg.StructMsg paramStructMsg, int paramInt)
  {
    int i;
    if ((TroopInfo.hasPayPrivilege(paramInt, 128)) && (TroopInfo.hasPayPrivilege(paramInt, 512)))
    {
      i = 1;
      if (i == 0) {
        break label155;
      }
      if (QLog.isColorLevel()) {
        QLog.d("NotificationView", 2, "onTroopPrivilege payTroop, rspTroopUin: " + paramString + ", privilegeFlag = " + paramInt);
      }
      TroopNotificationUtils.a(a.jdField_a_of_type_AndroidContentContext, paramString);
      TroopNotificationUtils.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      if ((a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog != null) && (a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.isShowing())) {
        a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
      }
      ReportController.b(null, "P_CliOper", "BizTechReport", "", "agree_invite", "rsp_pay_troop_getPrivilege", 0, 0, "pay_troop", "", "", "");
    }
    label155:
    do
    {
      return;
      i = 0;
      break;
      paramStructMsg = TroopNotificationUtils.a(paramString);
      if (paramStructMsg == null) {
        break label293;
      }
      if (QLog.isColorLevel()) {
        QLog.d("NotificationView", 2, "onTroopPrivilege normalTroop, rspTroopUin: " + paramString + ", privilegeFlag = " + paramInt + ", sendSystemMsgAction-----");
      }
      NotificationView.a(a, 1, (structmsg.StructMsg)paramStructMsg.get());
    } while (msg.group_msg_type.get() != 2);
    ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_contacts", "", "notice", "agree_invite", 0, 0, paramString, "", "0", "0");
    ReportController.b(null, "P_CliOper", "BizTechReport", "", "agree_invite", "rsp_pay_troop_getPrivilege", 0, 0, "normal_troop", "", "", "");
    return;
    label293:
    if (QLog.isColorLevel()) {
      QLog.e("NotificationView", 2, "NotificationView onTroopPrivilege cache error--------------");
    }
    ReportController.b(null, "P_CliOper", "BizTechReport", "", "agree_invite", "rsp_pay_troop_getPrivilege", 0, 0, "normal_troop_error", "", "", "");
  }
  
  public void a(String paramString1, structmsg.StructMsg paramStructMsg, int paramInt1, int paramInt2, String paramString2)
  {
    if ((a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog != null) && (a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.isShowing())) {
      a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
    }
    if (QLog.isColorLevel()) {
      QLog.e("NotificationView", 2, "NotificationView onTroopPrivilege network! error rspTroopUin = " + paramString1);
    }
    ReportController.b(null, "P_CliOper", "BizTechReport", "", "agree_invite", "rsp_pay_troop_getPrivilege", 0, 0, "err", "", "", "");
  }
}
