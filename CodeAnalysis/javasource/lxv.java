import android.os.SystemClock;
import android.view.MotionEvent;
import android.widget.EditText;
import com.tencent.mobileqq.activity.phone.BindNumberBusinessActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lxv
  implements Runnable
{
  public lxv(BindNumberBusinessActivity paramBindNumberBusinessActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (!a.isFinishing())
    {
      long l = SystemClock.uptimeMillis();
      MotionEvent localMotionEvent = MotionEvent.obtain(l, l, 0, 0.0F, 0.0F, 0);
      a.a.dispatchTouchEvent(localMotionEvent);
      localMotionEvent.recycle();
      localMotionEvent = MotionEvent.obtain(l, l, 1, 0.0F, 0.0F, 0);
      a.a.dispatchTouchEvent(localMotionEvent);
      localMotionEvent.recycle();
      a.a.setSelection(a.a.getText().toString().length());
    }
  }
}
