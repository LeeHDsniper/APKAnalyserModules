import android.text.Layout;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.TextView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.text.QQText;
import com.tencent.mobileqq.utils.QQCustomDialog;

public class smk
  implements ViewTreeObserver.OnGlobalLayoutListener
{
  public smk(QQCustomDialog paramQQCustomDialog, int paramInt, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onGlobalLayout()
  {
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.text.getViewTreeObserver().removeGlobalOnLayoutListener(this);
    if (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.text.getLineCount() > jdField_a_of_type_Int)
    {
      int i = jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.text.getLayout().getLineEnd(jdField_a_of_type_Int - 1);
      boolean bool1 = QQText.a(jdField_a_of_type_JavaLangString);
      boolean bool2 = QQText.b(jdField_a_of_type_JavaLangString);
      if ((!bool1) && (!bool2))
      {
        String str = jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.text.getText().subSequence(0, i - 3) + "...";
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.text.setText(str);
      }
    }
  }
}
