import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet.OnDismissListener;

public final class kqx
  implements ActionSheet.OnDismissListener
{
  public kqx(QQAppInterface paramQQAppInterface, int[] paramArrayOfInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDismiss()
  {
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004862", "0X8004862", 0, 0, "", "", "", "");
    if (jdField_a_of_type_ArrayOfInt[3] == 3) {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005B05", "0X8005B05", 0, 0, "", "", "", "");
    }
  }
}
