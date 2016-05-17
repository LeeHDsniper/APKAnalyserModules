import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.VersionUtils;

public class mfy
  implements View.OnClickListener
{
  public mfy(BannerManager paramBannerManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (VersionUtils.e())
    {
      BannerManager.a(a).startActivity(new Intent("android.settings.SETTINGS"));
      return;
    }
    BannerManager.a(a).startActivity(new Intent("android.settings.WIRELESS_SETTINGS"));
  }
}
