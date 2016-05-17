import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import com.tencent.mobileqq.activity.ForwardRecentActivity;
import com.tencent.mobileqq.activity.JumpActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticAssist;
import mqq.app.MobileQQ;

public class jdg
  implements Runnable
{
  public jdg(JumpActivity paramJumpActivity, Intent paramIntent, Bundle paramBundle)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    String str = jdField_a_of_type_AndroidContentIntent.getType();
    Uri localUri = jdField_a_of_type_AndroidContentIntent.getData();
    StatisticAssist.a(jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.app.getApplication().getApplicationContext(), jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.app.a(), "dl_open_via_qq");
    Intent localIntent = new Intent(jdField_a_of_type_ComTencentMobileqqActivityJumpActivity, ForwardRecentActivity.class);
    if ((str != null) && (str.startsWith("image"))) {}
    for (int i = 1;; i = 0)
    {
      jdField_a_of_type_AndroidOsBundle.putParcelable("android.intent.extra.STREAM", localUri);
      localIntent.putExtras(jdField_a_of_type_AndroidOsBundle);
      localIntent.putExtra("isFromShare", true);
      localIntent.putExtra("forward_type", i);
      localIntent.setData(localUri);
      localIntent.putExtra("sendMultiple", false);
      jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.startActivity(localIntent);
      jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.finish();
      return;
      jdField_a_of_type_AndroidOsBundle.putBoolean("not_forward", true);
    }
  }
}
