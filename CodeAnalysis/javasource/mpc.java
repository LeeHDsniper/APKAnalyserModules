import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.RelativeLayout;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPlayActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mpc
  implements ViewTreeObserver.OnGlobalLayoutListener
{
  public mpc(ShortVideoPlayActivity paramShortVideoPlayActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onGlobalLayout()
  {
    a.n = a.a.getWidth();
    a.o = a.a.getHeight();
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "onGlobalLayout,mSurfaceViewWidth:" + a.n + ",mSurfaceViewHeight:" + a.o);
    }
    a.a.getViewTreeObserver().removeGlobalOnLayoutListener(this);
  }
}
