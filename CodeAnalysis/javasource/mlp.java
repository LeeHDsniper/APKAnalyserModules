import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.widget.EditText;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.mobileqq.activity.selectmember.ContactFriendInnerFrame;
import com.tencent.mobileqq.activity.selectmember.PhoneContactSelectActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class mlp
  implements DialogInterface.OnClickListener
{
  public mlp(PhoneContactSelectActivity paramPhoneContactSelectActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    a.jdField_a_of_type_AndroidWidgetEditText.setText("");
    ((ContactFriendInnerFrame)a.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.getCurrentView()).g();
    paramDialogInterface.dismiss();
    ReportController.b(a.app, "CliOper", "", "", "0X80063FA", "0X80063FA", 1, 0, "", "", "", "");
  }
}
