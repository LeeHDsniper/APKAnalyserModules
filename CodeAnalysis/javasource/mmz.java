import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

class mmz
  implements DialogInterface.OnClickListener
{
  mmz(mmy paramMmy)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    a.a.h();
    paramDialogInterface.dismiss();
    ReportController.b(null, "CliOper", "", "", "0X8004CEE", "0X8004CEE", 0, 0, "", "", "", "");
  }
}
