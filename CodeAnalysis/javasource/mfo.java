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
import cooperation.qqwifi.QQWiFiPluginInstallActivity;

public class mfo
  implements View.OnClickListener
{
  public mfo(BannerManager paramBannerManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    ((NotificationManager)BannerManager.a(a).getSystemService("notification")).cancel(QQWiFiHelper.a);
    paramView = new Intent(BannerManager.a(a), QQWiFiPluginInstallActivity.class);
    paramView.setAction("com.tencent.mobileqq.action.QQWiFi");
    paramView.putExtra("from-bluebar", true);
    BannerManager.a(a).startActivity(paramView);
    a.a(17, 0);
    a.a(-1, null);
    if (QLog.isColorLevel()) {
      QLog.i("Q.recent.banner", 2, "banner click send qqwifi broadcast");
    }
    paramView = new Intent("com.tencent.mobileqq.qqwifi.scanStateChange");
    paramView.putExtra("intervalTime", QQWiFiHelper.b + 2L);
    BannerManager.a(a).sendBroadcast(paramView);
    ReportController.b(aa).app, "CliOper", "", "", "QQWIFI", "clk_buleNotify", 0, 0, "", "", "", "");
  }
}
