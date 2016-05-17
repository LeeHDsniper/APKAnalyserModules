import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.widget.Button;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mig
  implements View.OnTouchListener
{
  public mig(FlowCameraActivity2 paramFlowCameraActivity2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    if (!a.l) {}
    do
    {
      do
      {
        return false;
      } while (((!a.f) && (!a.c)) || (paramView.getId() != 2131300928));
      switch (paramMotionEvent.getAction())
      {
      case 2: 
      default: 
        return false;
      case 0: 
        if (QLog.isColorLevel()) {
          QLog.d("FlowCameraActivity", 2, "[@]onTouch ACTION_DOWN, event = " + paramMotionEvent);
        }
        if (!a.b.isLongClickable()) {
          a.a.e();
        }
        a.b.setText(null);
        return false;
      }
      if (QLog.isColorLevel()) {
        QLog.d("FlowCameraActivity", 2, "[@]onTouch ACTION_UP, event = " + paramMotionEvent);
      }
      if (a.a != null) {
        a.a.b();
      }
    } while (a.b == null);
    a.b.setText(2131371893);
    return false;
  }
}
