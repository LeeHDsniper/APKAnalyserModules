import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.photo.CameraPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.AlbumUtil;

public class mag
  implements View.OnClickListener
{
  public mag(CameraPreviewActivity paramCameraPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (a.b) {
      ReportController.b(a.app, "CliOper", "", "", "0X8004D94", "0X8004D94", 0, 0, "", "", "", "");
    }
    a.finish();
    AlbumUtil.a(a, true, false);
  }
}
