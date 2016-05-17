import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.SecurityDetectActivity;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class mfv
  implements View.OnClickListener
{
  public mfv(BannerManager paramBannerManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = new Intent(BannerManager.a(a), SecurityDetectActivity.class);
    BannerManager.a(a).startActivity(paramView);
    ReportController.b(null, "P_CliOper", "Safe_SecurityDetect", "", "SecurityDetect_PushBanner", "ClickOnBanner", 0, 0, "", "", "", "");
  }
}
