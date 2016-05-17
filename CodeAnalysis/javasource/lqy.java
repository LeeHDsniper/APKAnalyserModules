import android.os.MessageQueue.IdleHandler;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import com.tencent.mobileqq.activity.contact.addcontact.SearchContactsActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lqy
  implements MessageQueue.IdleHandler
{
  public lqy(SearchContactsActivity paramSearchContactsActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean queueIdle()
  {
    a.a.requestFocus();
    ((InputMethodManager)a.getSystemService("input_method")).showSoftInput(a.a, 0);
    return false;
  }
}
