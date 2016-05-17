import android.content.Intent;
import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.aio.rebuild.NearbyChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.nearpeople.NearbyRecommender.NearbyRecommenderUtils;
import com.tencent.mobileqq.statistics.ReportController;

public class lif
  implements Runnable
{
  public lif(NearbyChatPie paramNearbyChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    String[] arrayOfString = NearbyRecommenderUtils.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    String str = a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getStringExtra("uin");
    ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80055FE", "0X80055FE", 0, 0, arrayOfString[0], str, "", "");
    a.G = false;
  }
}
