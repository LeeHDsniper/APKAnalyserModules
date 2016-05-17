import android.text.Editable;
import android.text.TextWatcher;
import com.tencent.mobileqq.activity.VerifyCodeActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kny
  implements TextWatcher
{
  public kny(VerifyCodeActivity paramVerifyCodeActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    if (paramEditable.length() >= 4)
    {
      VerifyCodeActivity.c(a, true);
      return;
    }
    VerifyCodeActivity.d(a, false);
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}
