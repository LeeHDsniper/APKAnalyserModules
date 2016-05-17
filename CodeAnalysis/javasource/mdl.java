import android.content.Context;
import android.view.KeyEvent;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import com.tencent.mobileqq.activity.qwallet.SendHbActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mdl
  implements TextView.OnEditorActionListener
{
  public mdl(SendHbActivity paramSendHbActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onEditorAction(TextView paramTextView, int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 6) || ((paramKeyEvent != null) && (paramKeyEvent.getKeyCode() == 66)))
    {
      if (SendHbActivity.a(a).isEnabled()) {
        SendHbActivity.a(a).performClick();
      }
      ((InputMethodManager)paramTextView.getContext().getSystemService("input_method")).hideSoftInputFromWindow(SendHbActivity.a(a).getWindowToken(), 0);
    }
    return false;
  }
}
