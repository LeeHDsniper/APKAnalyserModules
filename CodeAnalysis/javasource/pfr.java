import android.app.Activity;
import android.app.PendingIntent;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.net.Uri;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.open.agent.report.ReportCenter;
import com.tencent.qphone.base.util.QLog;
import cooperation.qqfav.QfavHelper;
import cooperation.qqfav.QfavReport;

public class pfr
  implements DialogInterface.OnClickListener
{
  public pfr(ForwardBaseOption paramForwardBaseOption)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    switch (paramInt)
    {
    default: 
    case -2: 
      do
      {
        return;
        if (a.c) {
          ReportCenter.a().a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), "", String.valueOf(a.jdField_a_of_type_Long), "1000", "51", "0", false);
        }
        a.a(true);
        a.jdField_a_of_type_AndroidAppActivity.setResult(1);
        a.jdField_a_of_type_AndroidAppActivity.finish();
      } while (!QLog.isColorLevel());
      QLog.i("ForwardOption.ForwardBaseOption", 2, "-->showQfavResultDialog--onClick--back call");
      return;
    }
    if (a.c) {
      ReportCenter.a().a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), "", String.valueOf(a.jdField_a_of_type_Long), "1000", "52", "0", false);
    }
    if (QLog.isColorLevel()) {
      QLog.i("ForwardOption.ForwardBaseOption", 2, "-->showQfavResultDialog--onClick--send call");
    }
    paramDialogInterface = new Intent();
    paramDialogInterface.setData(Uri.parse(String.format("tencent%1$d://tauth.qq.com/?#action=%2$s&result=complete&response={\"ret\":0}", new Object[] { Long.valueOf(a.jdField_a_of_type_Long), "shareToQQ" })));
    paramDialogInterface.setPackage(a.jdField_a_of_type_AndroidAppActivity.getIntent().getStringExtra("pkg_name"));
    paramDialogInterface = PendingIntent.getActivity(a.jdField_a_of_type_AndroidAppActivity, 0, paramDialogInterface, 268435456);
    Intent localIntent = new Intent();
    localIntent.putExtra("is_share_flag", true);
    if (a.jdField_a_of_type_Long > 0L) {
      localIntent.putExtra("activity_finish_run_pendingIntent", paramDialogInterface);
    }
    QfavHelper.a(a.jdField_a_of_type_AndroidAppActivity, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), localIntent, -1, true);
    QfavReport.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 5, 0);
    a.jdField_a_of_type_AndroidAppActivity.setResult(1);
    a.jdField_a_of_type_AndroidAppActivity.finish();
  }
}
