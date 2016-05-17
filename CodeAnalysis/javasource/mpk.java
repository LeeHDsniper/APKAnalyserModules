import android.view.SurfaceView;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mpk
  implements ViewTreeObserver.OnGlobalLayoutListener
{
  public mpk(ShortVideoPreviewActivity paramShortVideoPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onGlobalLayout()
  {
    a.i = a.a.getWidth();
    a.j = a.a.getHeight();
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPreviewActivity", 2, "onGlobalLayout,mSurfaceViewWidth:" + a.i + ",mSurfaceViewHeight:" + a.j);
    }
    a.a.getViewTreeObserver().removeGlobalOnLayoutListener(this);
  }
}
