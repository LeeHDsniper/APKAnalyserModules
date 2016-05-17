import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.aio.rebuild.HotChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQCustomDialog;

public class lhm
  implements DialogInterface.OnClickListener
{
  public lhm(HotChatPie paramHotChatPie, QQCustomDialog paramQQCustomDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
  }
}
