import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.biz.qrcode.activity.LoginManagerActivity;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mez
  implements View.OnClickListener
{
  public mez(BannerManager paramBannerManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    case 2131298481: 
    case 2131298482: 
    default: 
      return;
    case 2131298479: 
      paramView = new Intent(BannerManager.a(a), LoginManagerActivity.class);
      paramView.putExtra("loginInfo", a.e);
      BannerManager.a(a).startActivity(paramView);
      return;
    }
    a.b();
  }
}
