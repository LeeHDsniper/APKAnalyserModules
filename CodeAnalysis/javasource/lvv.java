import android.content.Context;
import android.graphics.Color;
import android.text.Editable;
import android.text.SpannableString;
import android.text.TextWatcher;
import android.text.style.ForegroundColorSpan;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.messagesearch.C2CMessageResultAdapter;
import com.tencent.mobileqq.activity.messagesearch.C2CMessageSearchDialog;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.XListView;

public class lvv
  implements TextWatcher
{
  public lvv(C2CMessageSearchDialog paramC2CMessageSearchDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    paramEditable = a.jdField_a_of_type_AndroidWidgetEditText.getText().toString().trim();
    if (paramEditable.length() == 0)
    {
      a.c = "";
      a.findViewById(2131300496).setVisibility(8);
      a.jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
      a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a();
      a.b.setVisibility(8);
    }
    while (a.c.equals(paramEditable)) {
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.i(C2CMessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "afterTextChanged, lastChangedKeyword = " + a.c + ",lastKeyWord:" + paramEditable);
    }
    a.c = paramEditable;
    String str = a.jdField_a_of_type_AndroidContentContext.getString(2131367800, new Object[] { paramEditable });
    int i = str.indexOf(paramEditable);
    SpannableString localSpannableString = new SpannableString(str);
    localSpannableString.setSpan(new ForegroundColorSpan(2131428212), 0, i, 18);
    localSpannableString.setSpan(new ForegroundColorSpan(Color.parseColor("#0079ff")), i, paramEditable.length() + i, 34);
    localSpannableString.setSpan(new ForegroundColorSpan(2131428212), paramEditable.length() + i, str.length(), 33);
    a.jdField_a_of_type_AndroidWidgetTextView.setText(localSpannableString);
    C2CMessageSearchDialog.a(a, 1, null);
    a.findViewById(2131300496).setVisibility(0);
    a.jdField_a_of_type_ComTencentWidgetXListView.setVisibility(0);
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}
