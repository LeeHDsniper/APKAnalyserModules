import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mpm
  implements SurfaceHolder.Callback
{
  public mpm(ShortVideoPreviewActivity paramShortVideoPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void surfaceChanged(SurfaceHolder paramSurfaceHolder, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void surfaceCreated(SurfaceHolder paramSurfaceHolder)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPreviewActivity", 2, "surfaceCreated: mSavedCurPosition:" + a.k + ",mSavedPlayState : " + a.a(a.l));
    }
    if ((a.l == 1) && (a.k > 0))
    {
      a.a(a.k);
      a.k = 0;
      a.l = 0;
    }
  }
  
  public void surfaceDestroyed(SurfaceHolder paramSurfaceHolder)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPreviewActivity", 2, "surfaceDestroyed ");
    }
    a.b();
  }
}
