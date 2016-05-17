import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.RichStatItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richstatus.StatusHistoryActivity;
import com.tencent.mobileqq.statistics.ReportController;

public class kzx
  implements View.OnClickListener
{
  public kzx(RichStatItemBuilder paramRichStatItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    StatusHistoryActivity.a(a.jdField_a_of_type_AndroidContentContext, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, 2, "");
    ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "signiture", "aio_clk_his", 0, 0, "", "", "", "");
  }
}
