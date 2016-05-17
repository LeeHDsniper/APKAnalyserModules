import android.os.MessageQueue.IdleHandler;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import com.tencent.mobileqq.activity.contact.addcontact.ClassificationSearchActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lqa
  implements MessageQueue.IdleHandler
{
  public lqa(ClassificationSearchActivity paramClassificationSearchActivity)
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
