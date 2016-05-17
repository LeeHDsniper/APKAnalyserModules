import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.widget.EditText;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mne
  implements View.OnTouchListener
{
  float jdField_a_of_type_Float;
  float b;
  
  public mne(SelectMemberActivity paramSelectMemberActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Float = 0.0F;
    b = 0.0F;
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    int i = paramMotionEvent.getAction();
    if (i == 0)
    {
      jdField_a_of_type_Float = paramMotionEvent.getRawX();
      b = paramMotionEvent.getRawY();
    }
    for (;;)
    {
      return false;
      if ((i == 2) && ((paramMotionEvent.getRawX() - jdField_a_of_type_Float > 10.0F) || (paramMotionEvent.getRawY() - b > 10.0F))) {
        jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a.clearFocus();
      }
    }
  }
}
