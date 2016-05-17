import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lxc
  implements View.OnClickListener
{
  public lxc(AvatarPendantActivity paramAvatarPendantActivity, String paramString1, String paramString2, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity.a(jdField_a_of_type_JavaLangString, b, true, jdField_a_of_type_Int);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity.app, "CliOper", "", "", "0X8005FD2", "0X8005FD2", 0, 0, "", "", "", "");
  }
}
