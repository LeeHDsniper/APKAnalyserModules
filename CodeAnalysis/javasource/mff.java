import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.comic.VipComicJumpActivity;
import cooperation.comic.VipComicReportUtils;
import org.json.JSONObject;

public class mff
  implements View.OnClickListener
{
  public mff(BannerManager paramBannerManager, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = new JSONObject();
    try
    {
      paramView.put("from", "20");
      Intent localIntent = new Intent(BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager), VipComicJumpActivity.class);
      localIntent.putExtra("options", paramView.toString());
      BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).startActivity(localIntent);
      VipComicReportUtils.a(BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).getAppInterface(), "3016", "2", "40040", jdField_a_of_type_JavaLangString, new String[0]);
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
}
