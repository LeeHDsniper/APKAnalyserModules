import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.av.utils.PstnUtils;
import com.tencent.mobileqq.activity.selectmember.PhoneContactTabView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

class mlw
  implements DialogInterface.OnClickListener
{
  mlw(mlv paramMlv)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface.dismiss();
    PstnUtils.a(a.a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.a.a.jdField_a_of_type_AndroidContentContext, 2, 12);
    ReportController.b(a.a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80063F9", "0X80063F9", 1, 0, "", "", "", "");
  }
}
