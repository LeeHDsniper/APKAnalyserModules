import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.selectmember.PhoneContactSelectActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.qcall.PstnManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.QQCustomDialog;

class mlh
  implements DialogInterface.OnClickListener
{
  mlh(mlg paramMlg, PstnManager paramPstnManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramInt = 1;
    boolean bool = ((QQCustomDialog)paramDialogInterface).getCheckBoxState();
    if (bool) {
      jdField_a_of_type_ComTencentMobileqqQcallPstnManager.b(true);
    }
    if (!PhoneContactSelectActivity.a(jdField_a_of_type_Mlg.a)) {
      jdField_a_of_type_Mlg.a.h();
    }
    paramDialogInterface.dismiss();
    paramDialogInterface = jdField_a_of_type_Mlg.a.app;
    if (bool) {}
    for (;;)
    {
      ReportController.b(paramDialogInterface, "CliOper", "", "", "0X8006404", "0X8006404", paramInt, 0, "", "", "", "");
      return;
      paramInt = 2;
    }
  }
}
