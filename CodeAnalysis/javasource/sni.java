import android.content.Context;
import android.content.DialogInterface.OnClickListener;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.text.QQText;
import com.tencent.mobileqq.utils.QQCustomDialogWtihInput;
import com.tencent.mobileqq.widget.ClearableEditText;
import com.tencent.mobileqq.widget.QQToast;
import java.lang.ref.SoftReference;

public class sni
  implements View.OnClickListener
{
  public sni(QQCustomDialogWtihInput paramQQCustomDialogWtihInput, DialogInterface.OnClickListener paramOnClickListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = QQCustomDialogWtihInput.a(jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialogWtihInput).getText().toString();
    if (paramView != null)
    {
      if ((!QQText.a(paramView)) && (!QQText.b(paramView))) {
        break label78;
      }
      paramView = (Context)QQCustomDialogWtihInput.a(jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialogWtihInput).get();
      if (paramView != null)
      {
        paramView = new QQToast(paramView);
        paramView.c(2000);
        paramView.b(2131370297);
        paramView.a();
      }
    }
    label78:
    do
    {
      return;
      if ((QQCustomDialogWtihInput.a(jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialogWtihInput) != null) || (24 >= paramView.getBytes().length)) {
        break;
      }
      paramView = (Context)QQCustomDialogWtihInput.a(jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialogWtihInput).get();
    } while (paramView == null);
    paramView = new QQToast(paramView);
    paramView.c(2000);
    paramView.b(2131370296);
    paramView.a();
    return;
    if (jdField_a_of_type_AndroidContentDialogInterface$OnClickListener != null) {
      jdField_a_of_type_AndroidContentDialogInterface$OnClickListener.onClick(jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialogWtihInput, 1);
    }
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialogWtihInput.dismiss();
  }
}
