import android.content.DialogInterface.OnClickListener;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQCustomDialogDevLock;

public class smt
  implements View.OnClickListener
{
  public smt(QQCustomDialogDevLock paramQQCustomDialogDevLock, DialogInterface.OnClickListener paramOnClickListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (jdField_a_of_type_AndroidContentDialogInterface$OnClickListener != null) {
      jdField_a_of_type_AndroidContentDialogInterface$OnClickListener.onClick(jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialogDevLock, 0);
    }
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialogDevLock.dismiss();
  }
}
