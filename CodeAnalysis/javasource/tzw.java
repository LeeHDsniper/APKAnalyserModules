import android.view.VelocityTracker;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.VersionUtils;
import com.tencent.widget.AbsListView;
import com.tencent.widget.OverScroller;

class tzw
  implements Runnable
{
  tzw(tzv paramTzv)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int i = AbsListView.c(a.a);
    VelocityTracker localVelocityTracker = AbsListView.a(a.a);
    OverScroller localOverScroller = tzv.a(a);
    if ((localVelocityTracker == null) || (i == -1)) {
      return;
    }
    localVelocityTracker.computeCurrentVelocity(1000, AbsListView.d(a.a));
    if (VersionUtils.b()) {}
    for (float f = -localVelocityTracker.getYVelocity(i); (Math.abs(f) >= AbsListView.e(a.a)) && (localOverScroller.a(0.0F, f)); f = -localVelocityTracker.getYVelocity())
    {
      a.a.postDelayed(this, 40L);
      return;
    }
    a.a();
    a.a.ag = 3;
    a.a.b(1);
  }
}
