import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

class lwt
  implements DialogInterface.OnClickListener
{
  lwt(lws paramLws)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    ReportController.b(a.a.app, "CliOper", "", "", "0X8005FDA", "0X8005FDA", 0, 0, "", "", "", "");
  }
}
