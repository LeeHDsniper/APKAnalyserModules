import android.content.res.Resources;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.contact.addcontact.ClassificationSearchActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lqb
  implements TextWatcher
{
  public lqb(ClassificationSearchActivity paramClassificationSearchActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    paramEditable = a.jdField_a_of_type_AndroidWidgetEditText.getText().toString();
    Object localObject = a.jdField_a_of_type_AndroidWidgetImageButton;
    int i;
    if (paramEditable.equals(""))
    {
      i = 8;
      ((ImageButton)localObject).setVisibility(i);
      localObject = a.jdField_a_of_type_AndroidWidgetButton;
      if (paramEditable.equals("")) {
        break label106;
      }
    }
    label106:
    for (paramEditable = a.getResources().getString(2131367944);; paramEditable = a.getResources().getString(2131366996))
    {
      ((Button)localObject).setText(paramEditable);
      if (AppSetting.i) {
        a.jdField_a_of_type_AndroidWidgetButton.setContentDescription(a.jdField_a_of_type_AndroidWidgetButton.getText());
      }
      return;
      i = 0;
      break;
    }
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}
