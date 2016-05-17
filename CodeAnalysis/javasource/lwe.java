import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.EditText;
import com.tencent.mobileqq.activity.messagesearch.MessageSearchDialog;
import com.tencent.mobileqq.activity.messagesearch.SearchHistoryAdapter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lwe
  implements TextWatcher
{
  public lwe(MessageSearchDialog paramMessageSearchDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    paramEditable = a.jdField_a_of_type_AndroidWidgetEditText.getText().toString().trim();
    if (a.b) {
      a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchSearchHistoryAdapter.a(paramEditable);
    }
    a.b = true;
    if (paramEditable.length() == 0)
    {
      a.findViewById(2131300496).setVisibility(8);
      return;
    }
    a.findViewById(2131300496).setVisibility(0);
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}
