import android.content.DialogInterface.OnClickListener;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQCustomDialogThreeBtns;

public class snc
  implements View.OnClickListener
{
  int jdField_a_of_type_Int;
  
  public snc(QQCustomDialogThreeBtns paramQQCustomDialogThreeBtns, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = paramInt;
  }
  
  public void onClick(View paramView)
  {
    if (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialogThreeBtns.a != null)
    {
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialogThreeBtns.a.onClick(jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialogThreeBtns, jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialogThreeBtns.a(jdField_a_of_type_Int));
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialogThreeBtns.dismiss();
    }
  }
}
