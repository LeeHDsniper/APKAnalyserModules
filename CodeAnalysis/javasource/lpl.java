import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.inputmethod.InputMethodManager;
import com.tencent.mobileqq.activity.contact.SearchResultDialog;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lpl
  implements View.OnTouchListener
{
  public lpl(SearchResultDialog paramSearchResultDialog, Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    ((InputMethodManager)jdField_a_of_type_AndroidContentContext.getSystemService("input_method")).hideSoftInputFromWindow(paramView.getWindowToken(), 0);
    return false;
  }
}
