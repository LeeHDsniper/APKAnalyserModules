import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.phone.GuideBindPhoneActivity;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import mqq.os.MqqHandler;

public class mfn
  implements View.OnClickListener
{
  public mfn(BannerManager paramBannerManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = new Intent(BannerManager.a(a), GuideBindPhoneActivity.class);
    BannerManager.a(a).startActivity(paramView);
    BannerManager.a(a).getSharedPreferences("contact_bind_info" + aa).app.getAccount(), 0).edit().putBoolean("key_show_contact_banner", false).commit();
    a.a(12, 0);
    BannerManager.a(a).removeMessages(11);
    ReportController.b(aa).app, "CliOper", "", "", "0X80053D9", "0X80053D9", 0, 0, "", "", "", "");
  }
}
