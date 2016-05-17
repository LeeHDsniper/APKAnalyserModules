import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Environment;
import com.tencent.mobileqq.activity.aio.PlusPanelUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter.fileAssistantReportData;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

class laj
  implements DialogInterface.OnClickListener
{
  laj(lai paramLai, QQAppInterface paramQQAppInterface, BaseActivity paramBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    if (Environment.getExternalStorageState().equals("mounted"))
    {
      if (jdField_a_of_type_Lai.a.a != 1) {
        break label79;
      }
      PlusPanelUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqAppBaseActivity, jdField_a_of_type_Lai.a);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqAppBaseActivity.setCanLock(false);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80061FC", "0X80061FC", 0, 0, "1", "", "", "");
      return;
      label79:
      paramDialogInterface = new FileManagerReporter.fileAssistantReportData();
      b = "send_file";
      a = 1;
      FileManagerReporter.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), paramDialogInterface);
      PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqAppBaseActivity, jdField_a_of_type_Lai.a);
    }
  }
}
