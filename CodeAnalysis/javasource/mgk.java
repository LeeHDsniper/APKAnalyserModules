import android.view.View;
import android.view.View.OnClickListener;
import android.widget.RelativeLayout;
import com.tencent.mobileqq.activity.recent.RecentCallHelper;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.fpsreport.FPSSwipListView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class mgk
  implements View.OnClickListener
{
  public mgk(RecentCallHelper paramRecentCallHelper)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    RecentCallHelper.a(a).setVisibility(8);
    RecentCallHelper.a(a).a(RecentCallHelper.a(a));
    ReportController.b(null, "CliOper", "", "", "0X800510E", "0X800510E", 0, 0, "", "", "", "");
    ThreadManager.a(new mgl(this), 8, null, false);
  }
}
