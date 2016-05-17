import android.widget.LinearLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet;

class ldl
  implements Runnable
{
  ldl(ldk paramLdk)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    a.a.dismiss();
    a.a.a.removeAllViews();
    a.a.c = false;
    a.a.c(2131369771);
    ReportController.b(null, "P_CliOper", "qrcode", "", "0X80059A3", "0X80059A3", 0, 0, "", "", "", "");
    a.a.show();
  }
}
