import android.content.DialogInterface.OnClickListener;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQCustomDialog;

public class smo
  implements View.OnClickListener
{
  public smo(QQCustomDialog paramQQCustomDialog, DialogInterface.OnClickListener paramOnClickListener, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (jdField_a_of_type_AndroidContentDialogInterface$OnClickListener != null) {
      jdField_a_of_type_AndroidContentDialogInterface$OnClickListener.onClick(jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog, 1);
    }
    try
    {
      if ((jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.isShowing()) && (jdField_a_of_type_Boolean)) {
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
      }
      return;
    }
    catch (Exception paramView) {}
  }
}
