import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import com.tencent.mobileqq.activity.contact.troop.NotificationView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.os.MqqHandler;

public class ltf
  implements View.OnTouchListener
{
  protected float a;
  protected float b;
  
  public ltf(NotificationView paramNotificationView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    if (paramMotionEvent.getAction() == 0) {
      if (jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationView.a(paramMotionEvent.getRawY()))
      {
        jdField_a_of_type_Float = paramMotionEvent.getRawX();
        b = paramMotionEvent.getRawY();
        jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationView.a.removeMessages(1013);
        jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationView.a.sendEmptyMessageDelayed(1013, 500L);
      }
    }
    for (;;)
    {
      return false;
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationView.a.removeMessages(1013);
      continue;
      if (paramMotionEvent.getAction() == 2)
      {
        if ((Math.abs(paramMotionEvent.getRawX() - jdField_a_of_type_Float) > 60.0F) || (Math.abs(paramMotionEvent.getRawY() - b) > 60.0F)) {
          jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationView.a.removeMessages(1013);
        }
      }
      else {
        jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationView.a.removeMessages(1013);
      }
    }
  }
}
