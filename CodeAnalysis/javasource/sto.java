import android.text.Editable;
import android.text.TextWatcher;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.ClearableEditText;

public class sto
  implements TextWatcher
{
  public sto(ClearableEditText paramClearableEditText)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void afterTextChanged(Editable paramEditable) {}
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
    paramCharSequence = a.getText().toString();
    if ((paramCharSequence == null) || (paramCharSequence.length() == 0))
    {
      a.setClearButtonVisible(false);
      return;
    }
    if (ClearableEditText.a(a))
    {
      a.setClearButtonVisible(true);
      return;
    }
    a.setClearButtonVisible(false);
  }
}
