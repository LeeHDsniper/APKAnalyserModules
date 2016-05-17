import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import com.tencent.mobileqq.activity.contact.troop.ShowExternalTroopListActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.ProfileCardUtil;

public class ltr
  implements View.OnClickListener
{
  public ltr(ShowExternalTroopListActivity paramShowExternalTroopListActivity, ImageView paramImageView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    ProfileCardUtil.a(jdField_a_of_type_ComTencentMobileqqActivityContactTroopShowExternalTroopListActivity.jdField_a_of_type_AndroidAppActivity, jdField_a_of_type_AndroidWidgetImageView, jdField_a_of_type_ComTencentMobileqqActivityContactTroopShowExternalTroopListActivity.f, 0);
    QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqActivityContactTroopShowExternalTroopListActivity.app;
    String str = jdField_a_of_type_ComTencentMobileqqActivityContactTroopShowExternalTroopListActivity.f;
    if (jdField_a_of_type_ComTencentMobileqqActivityContactTroopShowExternalTroopListActivity.jdField_a_of_type_Boolean) {}
    for (paramView = "0";; paramView = "1")
    {
      ReportController.b(localQQAppInterface, "P_CliOper", "Grp_join", "", "person_data", "Clk_user", 0, 0, str, paramView, "", "");
      return;
    }
  }
}
