import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.support.v4.app.FragmentActivity;
import com.tencent.biz.common.util.Util;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.MainFragment;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.forward.ForwardSdkShareOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsShareMsg;
import com.tencent.qphone.base.util.QLog;

public final class lmo
  implements DialogInterface.OnClickListener
{
  public lmo(AbsShareMsg paramAbsShareMsg, FragmentActivity paramFragmentActivity, Context paramContext, QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return;
    case 0: 
      if (QLog.isColorLevel()) {
        QLog.i("ChatActivity", 2, "qbShowWpaResultDialog back");
      }
      if (jdField_a_of_type_ComTencentMobileqqStructmsgAbsShareMsg != null)
      {
        paramDialogInterface = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getStringExtra("appid");
        if (paramDialogInterface != null) {
          ForwardSdkShareOption.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, true, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getStringExtra("callback_type"), Long.parseLong(paramDialogInterface));
        }
      }
      Util.a(jdField_a_of_type_AndroidContentContext, 0, "", "");
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "0X8004B56", "0X8004B56", 0, 0, "", "", "", "");
      jdField_a_of_type_AndroidSupportV4AppFragmentActivity.finish();
      return;
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "0X8004B55", "0X8004B55", 0, 0, "", "", "", "");
    if (!(jdField_a_of_type_AndroidSupportV4AppFragmentActivity instanceof SplashActivity))
    {
      paramDialogInterface = new Intent(jdField_a_of_type_AndroidContentContext, SplashActivity.class);
      paramDialogInterface.putExtra("tab_index", MainFragment.a);
      paramDialogInterface.addFlags(67108864);
      paramDialogInterface.addFlags(268435456);
      jdField_a_of_type_AndroidContentContext.startActivity(paramDialogInterface);
      jdField_a_of_type_AndroidSupportV4AppFragmentActivity.finish();
      return;
    }
    jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getChatFragment().a().C();
  }
}
