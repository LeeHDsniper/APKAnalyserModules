import android.content.Context;
import android.view.inputmethod.InputMethodManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQCustomDialogWtihInput;
import java.lang.ref.SoftReference;
import java.util.TimerTask;

public class snj
  extends TimerTask
{
  public snj(QQCustomDialogWtihInput paramQQCustomDialogWtihInput)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Context localContext = (Context)QQCustomDialogWtihInput.a(a).get();
    if (localContext != null) {
      ((InputMethodManager)localContext.getSystemService("input_method")).toggleSoftInput(0, 2);
    }
  }
}
