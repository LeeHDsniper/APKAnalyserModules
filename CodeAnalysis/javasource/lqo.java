import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseActivity;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseFragment;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lqo
  implements View.OnClickListener
{
  public lqo(SearchBaseActivity paramSearchBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (TextUtils.isEmpty(a.jdField_a_of_type_AndroidWidgetEditText.getText()))
    {
      a.setResult(0);
      a.finish();
      return;
    }
    a.jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchBaseFragment.a(a.jdField_a_of_type_AndroidWidgetEditText.getText().toString(), false);
  }
}
