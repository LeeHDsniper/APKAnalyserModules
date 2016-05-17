import android.content.res.Resources;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.contact.addcontact.SearchContactsActivity;
import com.tencent.mobileqq.activity.contact.addcontact.SearchContactsFragment;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lqx
  implements TextWatcher
{
  public lqx(SearchContactsActivity paramSearchContactsActivity, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    String str = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsActivity.jdField_a_of_type_AndroidWidgetEditText.getText().toString();
    SearchContactsActivity.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsActivity, str);
    paramEditable = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsActivity.jdField_a_of_type_AndroidWidgetImageButton;
    int i;
    Button localButton;
    if (str.equals(""))
    {
      i = 8;
      paramEditable.setVisibility(i);
      localButton = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsActivity.jdField_a_of_type_AndroidWidgetButton;
      if (str.equals("")) {
        break label137;
      }
    }
    label137:
    for (paramEditable = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsActivity.getResources().getString(2131367944);; paramEditable = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsActivity.getResources().getString(2131366996))
    {
      localButton.setText(paramEditable);
      if (AppSetting.i) {
        jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsActivity.jdField_a_of_type_AndroidWidgetButton.setContentDescription(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsActivity.jdField_a_of_type_AndroidWidgetButton.getText());
      }
      if (jdField_a_of_type_Boolean) {
        ((SearchContactsFragment)jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsActivity.jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchBaseFragment).c(str);
      }
      return;
      i = 0;
      break;
    }
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}
