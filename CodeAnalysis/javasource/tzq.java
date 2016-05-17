import android.content.Context;
import android.view.KeyEvent;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputConnectionWrapper;
import android.view.inputmethod.InputMethodManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView;

public class tzq
  extends InputConnectionWrapper
{
  public tzq(AbsListView paramAbsListView, InputConnection paramInputConnection, boolean paramBoolean)
  {
    super(paramInputConnection, paramBoolean);
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean performEditorAction(int paramInt)
  {
    if (paramInt == 6)
    {
      InputMethodManager localInputMethodManager = (InputMethodManager)a.getContext().getSystemService("input_method");
      if (localInputMethodManager != null) {
        localInputMethodManager.hideSoftInputFromWindow(a.getWindowToken(), 0);
      }
      return true;
    }
    return false;
  }
  
  public boolean reportFullscreenMode(boolean paramBoolean)
  {
    return AbsListView.a(a).reportFullscreenMode(paramBoolean);
  }
  
  public boolean sendKeyEvent(KeyEvent paramKeyEvent)
  {
    return AbsListView.a(a).sendKeyEvent(paramKeyEvent);
  }
}
