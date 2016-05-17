import android.content.DialogInterface.OnClickListener;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQCustomDialog;

public class smr
  implements View.OnClickListener
{
  int jdField_a_of_type_Int;
  
  public smr(QQCustomDialog paramQQCustomDialog, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = paramInt;
  }
  
  public void onClick(View paramView)
  {
    if (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.onArrayItemClick != null) {
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.onArrayItemClick.onClick(jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog, jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.customWhichToCallBack(jdField_a_of_type_Int));
    }
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.isShowing()) {
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
      }
      return;
    }
    catch (Exception paramView) {}
  }
}
