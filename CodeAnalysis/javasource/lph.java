import android.text.TextUtils;
import android.view.KeyEvent;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import com.tencent.mobileqq.activity.contact.SearchResultDialog;
import com.tencent.mobileqq.activity.contact.addcontact.SearchContactsFragment;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lph
  implements TextView.OnEditorActionListener
{
  public lph(SearchResultDialog paramSearchResultDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onEditorAction(TextView paramTextView, int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (SearchResultDialog.a(a))
    {
      bool1 = bool2;
      if (SearchResultDialog.a(a) != null) {
        if (paramInt != 3)
        {
          bool1 = bool2;
          if (paramKeyEvent != null)
          {
            bool1 = bool2;
            if (paramKeyEvent.getKeyCode() != 66) {}
          }
        }
        else
        {
          paramTextView = SearchResultDialog.a(a).getText().toString();
          if (!TextUtils.isEmpty(paramTextView)) {
            SearchResultDialog.a(a).a(paramTextView, false);
          }
          bool1 = true;
        }
      }
    }
    return bool1;
  }
}
