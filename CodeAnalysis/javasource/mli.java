import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.selectmember.PhoneContactSelectActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

class mli
  implements DialogInterface.OnClickListener
{
  mli(mlg paramMlg)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface.dismiss();
    ReportController.b(a.a.app, "CliOper", "", "", "0X8006405", "0X8006405", 0, 0, "", "", "", "");
  }
}
