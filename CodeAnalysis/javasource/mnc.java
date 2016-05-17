import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnKeyListener;
import android.widget.EditText;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity.GridViewAdapter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mnc
  implements View.OnKeyListener
{
  public mnc(SelectMemberActivity paramSelectMemberActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onKey(View paramView, int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 67)
    {
      if (paramKeyEvent.getAction() != 0) {
        break label35;
      }
      a.t = TextUtils.isEmpty(a.jdField_a_of_type_AndroidWidgetEditText.getText());
    }
    for (;;)
    {
      return false;
      label35:
      if ((paramKeyEvent.getAction() == 1) && (a.t)) {
        a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity$GridViewAdapter.a();
      }
    }
  }
}
