import android.os.SystemClock;
import android.view.MotionEvent;
import android.widget.EditText;
import com.tencent.mobileqq.activity.qwallet.TransactionActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mdy
  implements Runnable
{
  public mdy(TransactionActivity paramTransactionActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    MotionEvent localMotionEvent1 = MotionEvent.obtain(SystemClock.uptimeMillis(), SystemClock.uptimeMillis(), 0, 0.0F, 0.0F, 0);
    TransactionActivity.b(a).dispatchTouchEvent(localMotionEvent1);
    MotionEvent localMotionEvent2 = MotionEvent.obtain(SystemClock.uptimeMillis(), SystemClock.uptimeMillis(), 1, 0.0F, 0.0F, 0);
    TransactionActivity.b(a).dispatchTouchEvent(localMotionEvent2);
    localMotionEvent1.recycle();
    localMotionEvent2.recycle();
  }
}
