import android.content.Context;
import android.view.KeyEvent;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import com.tencent.mobileqq.activity.qwallet.TransactionActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mdw
  implements TextView.OnEditorActionListener
{
  public mdw(TransactionActivity paramTransactionActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onEditorAction(TextView paramTextView, int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 6) || ((paramKeyEvent != null) && (paramKeyEvent.getKeyCode() == 66)))
    {
      if (TransactionActivity.b(a).isEnabled()) {
        TransactionActivity.b(a).performClick();
      }
      ((InputMethodManager)TransactionActivity.a(a).getSystemService("input_method")).hideSoftInputFromWindow(TransactionActivity.c(a).getWindowToken(), 0);
    }
    return false;
  }
}
