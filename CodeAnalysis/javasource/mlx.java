import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.selectmember.ContactFriendInnerFrame;
import com.tencent.mobileqq.activity.selectmember.PhoneContactTabView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

class mlx
  implements DialogInterface.OnClickListener
{
  mlx(mlv paramMlv)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface.dismiss();
    a.a.a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberContactFriendInnerFrame.g();
    ReportController.b(a.a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80063FA", "0X80063FA", 1, 0, "", "", "", "");
  }
}
