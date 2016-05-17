import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import android.widget.Toast;
import com.tencent.mobileqq.activity.VerifyCodeActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.ClearableEditText;

public class knx
  implements View.OnClickListener
{
  public knx(VerifyCodeActivity paramVerifyCodeActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = a.jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText.getText().toString();
    if ((paramView == null) || (paramView.length() == 0)) {
      Toast.makeText(a.getApplicationContext(), a.getString(2131368535), 0).show();
    }
    while (paramView == null) {
      return;
    }
    a.a(paramView);
    a.jdField_a_of_type_AndroidWidgetTextView.setEnabled(false);
    VerifyCodeActivity.b(a, false);
  }
}
