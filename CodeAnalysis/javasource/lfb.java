import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewParent;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel.SwipeUpAndDragListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class lfb
  implements View.OnTouchListener
{
  lfb(lfa paramLfa, PhotoListPanel.SwipeUpAndDragListener paramSwipeUpAndDragListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    paramView = paramView.getParent();
    if (paramView != null) {
      paramView.requestDisallowInterceptTouchEvent(true);
    }
    return false;
  }
}
