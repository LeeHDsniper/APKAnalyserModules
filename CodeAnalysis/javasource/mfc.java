import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.os.MqqHandler;

public class mfc
  implements View.OnClickListener
{
  public mfc(BannerManager paramBannerManager, long paramLong)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager) != null)
    {
      paramView = BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).obtainMessage(1134028);
      BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).sendMessage(paramView);
    }
    paramView = new Intent();
    paramView.setAction("cooperation.qqreader.aioback2reader");
    paramView.putExtra("bookid", jdField_a_of_type_Long);
    paramView.putExtra("is_from_conversation", true);
    BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).sendBroadcast(paramView);
  }
}
