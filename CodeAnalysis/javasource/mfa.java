import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.TroopAssisSettingActivity;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import mqq.os.MqqHandler;

public class mfa
  implements View.OnClickListener
{
  public mfa(BannerManager paramBannerManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = new Intent(BannerManager.a(a), TroopAssisSettingActivity.class);
    BannerManager.a(a).startActivityForResult(paramView, 9001);
    BannerManager.a(a).sendEmptyMessageDelayed(1, 1000L);
    ReportController.b(aa).app, "P_CliOper", "Grp_msg", "", "Msglist", "Clk_setmsg", 0, 0, "", "", "", "");
  }
}
