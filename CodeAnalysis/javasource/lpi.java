import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.View;
import android.widget.EditText;
import com.tencent.mobileqq.activity.contact.SearchResultDialog;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lpi
  implements TextWatcher
{
  public lpi(SearchResultDialog paramSearchResultDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    paramEditable = SearchResultDialog.a(a).getText().toString();
    String str = paramEditable.trim();
    if (TextUtils.isEmpty(str)) {
      a.a(paramEditable, paramEditable);
    }
    while (paramEditable.equals(""))
    {
      a.findViewById(2131300496).setVisibility(8);
      return;
      a.a(str, paramEditable);
    }
    a.findViewById(2131300496).setVisibility(0);
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}
