import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.phone.BindNumberBusinessActivity;
import com.tencent.mobileqq.activity.phone.MyBusinessActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lza
  implements View.OnClickListener
{
  public lza(MyBusinessActivity paramMyBusinessActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    BindNumberBusinessActivity.a(a, "", true);
    ReportController.b(a.app, "CliOper", "", "", "0X800421C", "0X800421C", 0, 0, "", "", "", "");
  }
}
