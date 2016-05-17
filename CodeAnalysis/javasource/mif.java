import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.widget.Button;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mif
  implements View.OnTouchListener
{
  public mif(FlowCameraActivity2 paramFlowCameraActivity2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    int i = paramMotionEvent.getAction();
    paramMotionEvent.getX();
    float f = paramMotionEvent.getY();
    if (i == 0) {
      a.jdField_b_of_type_AndroidWidgetButton.setText(null);
    }
    do
    {
      return false;
      if (i == 2)
      {
        if (f < a.jdField_b_of_type_Int * -1)
        {
          a.a(false, false);
          return true;
        }
        a.a(true, false);
        return true;
      }
      if (i == 3)
      {
        a.a(false, true);
        return false;
      }
    } while (i != 1);
    if (f < a.jdField_b_of_type_Int * -1)
    {
      a.k = false;
      a.a(false, true);
    }
    for (;;)
    {
      a.jdField_b_of_type_AndroidWidgetButton.setText(2131371894);
      return false;
      a.k = true;
      a.a(true, true);
    }
  }
}
