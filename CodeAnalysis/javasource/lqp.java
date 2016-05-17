import android.text.TextUtils;
import android.view.KeyEvent;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseActivity;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseFragment;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lqp
  implements TextView.OnEditorActionListener
{
  public lqp(SearchBaseActivity paramSearchBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onEditorAction(TextView paramTextView, int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool2 = false;
    boolean bool1;
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
      paramTextView = a.jdField_a_of_type_AndroidWidgetEditText.getText().toString();
      if (!TextUtils.isEmpty(paramTextView)) {
        a.jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchBaseFragment.a(paramTextView, false);
      }
      bool1 = true;
    }
    return bool1;
  }
}
