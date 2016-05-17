import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.View;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.search.fragment.ContactSearchFragment;

public class mnd
  implements TextWatcher
{
  public mnd(SelectMemberActivity paramSelectMemberActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    paramEditable = paramEditable.toString();
    if (TextUtils.isEmpty(paramEditable)) {
      a.jdField_a_of_type_AndroidViewView.setVisibility(8);
    }
    for (;;)
    {
      a.jdField_a_of_type_ComTencentMobileqqSearchFragmentContactSearchFragment.a(paramEditable);
      return;
      a.jdField_a_of_type_AndroidViewView.setVisibility(0);
    }
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}
