import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.av.gaudio.AVNotifyCenter;
import com.tencent.mobileqq.activity.aio.PlusPanelUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.DiscussChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lgi
  implements View.OnClickListener
{
  public lgi(DiscussChatPie paramDiscussChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    com.tencent.mobileqq.activity.aio.AIOUtils.l = true;
    a.jdField_a_of_type_ComTencentWidgetActionSheet = PlusPanelUtils.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true, true, null, 1);
    long l = Long.valueOf(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).longValue();
    if (a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a() != l) {
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Multi_call", "Mc_corner_launch", 0, 0, "", "", "", "");
    }
  }
}
