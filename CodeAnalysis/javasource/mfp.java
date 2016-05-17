import android.app.NotificationManager;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;
import cooperation.qqwifi.QQWiFiHelper;

public class mfp
  implements View.OnClickListener
{
  public mfp(BannerManager paramBannerManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    a.a(17, 0);
    a.a(-1, null);
    if (QLog.isColorLevel()) {
      QLog.i("Q.recent.banner", 2, "banner close send qqwifi broadcast");
    }
    paramView = new Intent("com.tencent.mobileqq.qqwifi.scanStateChange");
    paramView.putExtra("intervalTime", QQWiFiHelper.b + 1L);
    BannerManager.a(a).sendBroadcast(paramView);
    ((NotificationManager)BannerManager.a(a).getSystemService("notification")).cancel(QQWiFiHelper.a);
    ReportController.b(aa).app, "CliOper", "", "", "QQWIFI", "clk_buleClose", 0, 0, "", "", "", "");
  }
}
