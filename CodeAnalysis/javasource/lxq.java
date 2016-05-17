import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import com.tencent.mobileqq.activity.phone.BindNumberActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lxq
  implements DialogInterface.OnClickListener
{
  public lxq(BindNumberActivity paramBindNumberActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    BindNumberActivity.a(a);
    paramDialogInterface.dismiss();
    paramDialogInterface = a.getIntent();
    if (paramDialogInterface.getBooleanExtra("kFPhoneChange", false)) {
      ReportController.b(a.app, "CliOper", "", "", "0X8005DE9", "0X8005DE9", 1, 0, "", "", "", "");
    }
    if (paramDialogInterface.getBooleanExtra("kUnityOther", false)) {
      ReportController.b(a.app, "CliOper", "", "", "0X8005DE9", "0X8005DE9", 2, 0, "", "", "", "");
    }
  }
}
