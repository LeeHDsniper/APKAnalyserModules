import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewParent;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgListView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lsn
  implements View.OnTouchListener
{
  private float jdField_a_of_type_Float;
  private float b;
  
  public lsn(SystemMsgListView paramSystemMsgListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    if (paramMotionEvent.getAction() == 0)
    {
      paramView.getParent().requestDisallowInterceptTouchEvent(true);
      if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView.a(paramMotionEvent.getRawY()))
      {
        jdField_a_of_type_Float = paramMotionEvent.getRawX();
        b = paramMotionEvent.getRawY();
        paramView.getParent().requestDisallowInterceptTouchEvent(false);
        jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView.a.removeMessages(1013);
        jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView.a.sendEmptyMessageDelayed(1013, 500L);
      }
    }
    do
    {
      return false;
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView.a.removeMessages(1013);
      return false;
      if (paramMotionEvent.getAction() != 2) {
        break;
      }
    } while ((Math.abs(paramMotionEvent.getRawX() - jdField_a_of_type_Float) <= 60.0F) && (Math.abs(paramMotionEvent.getRawY() - b) <= 60.0F));
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView.a.removeMessages(1013);
    return false;
    if ((paramMotionEvent.getAction() == 1) || (paramMotionEvent.getAction() == 3))
    {
      paramView.getParent().requestDisallowInterceptTouchEvent(false);
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView.a.removeMessages(1013);
      return false;
    }
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView.a.removeMessages(1013);
    return false;
  }
}
