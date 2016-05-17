import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.os.Bundle;
import com.tencent.biz.pubaccount.AccountDetailActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.forward.ForwardAbility.ForwardAbilityType;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.structmsg.StructMsgFactory;
import com.tencent.open.agent.report.ReportCenter;
import com.tencent.qphone.base.util.QLog;

public class pfk
  implements DialogInterface.OnClickListener
{
  public pfk(ForwardBaseOption paramForwardBaseOption)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    boolean bool = false;
    if (a.jdField_a_of_type_AndroidOsBundle != null) {
      bool = a.jdField_a_of_type_AndroidOsBundle.getBoolean("from_card", false);
    }
    if (bool)
    {
      localObject1 = a.jdField_a_of_type_AndroidOsBundle.getString("pubUin");
      paramDialogInterface = (DialogInterface)localObject1;
      if (localObject1 == null) {
        paramDialogInterface = "";
      }
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", paramDialogInterface, "0X8005A2C", "0X8005A2C", 0, 0, "", "", "", "");
    }
    paramInt = a.a().getInt("key_forward_ability_type");
    if (QLog.isColorLevel()) {
      QLog.d("ForwardOption.ForwardBaseOption", 2, "-->getConfirmListener--onClick--type = " + paramInt);
    }
    for (;;)
    {
      try
      {
        if ((paramInt != ForwardAbility.ForwardAbilityType.f.intValue()) && (paramInt != ForwardAbility.ForwardAbilityType.l.intValue())) {
          continue;
        }
        a.b(paramInt);
      }
      catch (Throwable paramDialogInterface)
      {
        Object localObject2;
        Object localObject3;
        String str;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.e("ForwardOption.ForwardBaseOption", 2, "Throwable", paramDialogInterface);
        continue;
        if (paramInt != ForwardAbility.ForwardAbilityType.k.intValue()) {
          continue;
        }
        a.t();
        continue;
        a.k();
        continue;
        paramInt = 1001;
        continue;
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X80059DC", "0X80059DC", paramInt, 0, (String)localObject1, (String)localObject2, paramDialogInterface, (String)localObject3);
        continue;
        continue;
      }
      if ((a.jdField_a_of_type_AndroidOsBundle != null) && (a.jdField_a_of_type_AndroidOsBundle.getBoolean("forward_report_confirm")))
      {
        localObject1 = a.jdField_a_of_type_AndroidOsBundle.getString("forward_report_confirm_action_name");
        localObject2 = a.jdField_a_of_type_AndroidOsBundle.getString("forward_report_confirm_reverse2");
        paramDialogInterface = (DialogInterface)localObject1;
        if (localObject1 == null) {
          paramDialogInterface = "";
        }
        localObject1 = localObject2;
        if (localObject2 == null) {
          localObject1 = "";
        }
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", paramDialogInterface, paramDialogInterface, 0, 0, (String)localObject1, "", "", "");
      }
      bool = false;
      if (a.jdField_a_of_type_AndroidOsBundle != null)
      {
        bool = a.jdField_a_of_type_AndroidOsBundle.getBoolean("from_web", false);
        if (!bool) {
          continue;
        }
        localObject1 = a.jdField_a_of_type_AndroidOsBundle.getString("struct_uin");
        if (localObject1 != null) {
          continue;
        }
        localObject1 = "";
        localObject2 = a.jdField_a_of_type_AndroidOsBundle.getString("struct_url");
        paramDialogInterface = (DialogInterface)localObject2;
        if (localObject2 == null) {
          paramDialogInterface = "";
        }
        localObject3 = a.jdField_a_of_type_AndroidOsBundle.getString("strurt_msgid");
        localObject2 = localObject3;
        if (localObject3 == null) {
          localObject2 = "";
        }
        localObject3 = AccountDetailActivity.a(paramDialogInterface);
        if (paramInt != ForwardAbility.ForwardAbilityType.e.intValue()) {
          continue;
        }
        paramInt = 1002;
        str = a.jdField_a_of_type_AndroidOsBundle.getString("source_puin");
        if ((str == null) || ("".equals(str))) {
          continue;
        }
        localObject1 = a.jdField_a_of_type_AndroidOsBundle.getString("uin");
        if ((localObject1 == null) || (paramInt == 1002)) {
          localObject1 = "";
        }
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", (String)localObject1, "0X8005B07", "0X8005B07", paramInt, 0, str, (String)localObject2, paramDialogInterface, (String)localObject3);
      }
      if ((a.jdField_a_of_type_AndroidOsBundle != null) && (!bool))
      {
        localObject2 = a.jdField_a_of_type_AndroidOsBundle.getString("source_puin");
        if (localObject2 != null)
        {
          paramDialogInterface = a.jdField_a_of_type_AndroidContentIntent.getByteArrayExtra("stuctmsg_bytes");
          if (paramDialogInterface != null)
          {
            localObject3 = StructMsgFactory.a(paramDialogInterface);
            if (localObject3 != null)
            {
              localObject1 = a.jdField_a_of_type_AndroidOsBundle.getString("uin");
              paramDialogInterface = (DialogInterface)localObject1;
              if (localObject1 == null) {
                paramDialogInterface = "";
              }
              ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", paramDialogInterface, "0X8005B06", "0X8005B06", 0, 0, (String)localObject2, "" + msgId, "", "");
            }
          }
        }
      }
      if (a.c) {
        ReportCenter.a().a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), "", String.valueOf(a.jdField_a_of_type_Long), "1000", "50", "0", false);
      }
      return;
      if (paramInt != ForwardAbility.ForwardAbilityType.g.intValue()) {
        continue;
      }
      a.o();
    }
  }
}
