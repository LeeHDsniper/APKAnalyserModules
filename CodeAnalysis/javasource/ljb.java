import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class ljb
  implements DialogInterface.OnDismissListener
{
  public ljb(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    a.T = false;
    ReportController.b(a.a, "CliOper", "", "", "0X8004EFA", "0X8004EFA", 0, 0, "", "", "", "");
  }
}
