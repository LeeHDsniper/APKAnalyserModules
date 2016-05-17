import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.photo.CameraPreviewActivity;
import com.tencent.mobileqq.activity.photo.PhotoUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import java.util.ArrayList;

public class mad
  implements View.OnClickListener
{
  public mad(CameraPreviewActivity paramCameraPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (CameraPreviewActivity.a(a, (String)CameraPreviewActivity.a(a).get(0))) {
      return;
    }
    if (a.b) {
      ReportController.b(a.app, "CliOper", "", "", "0X8004D96", "0X8004D96", 0, 0, "", "", "", "");
    }
    PhotoUtils.a(a, a.getIntent(), CameraPreviewActivity.a(a), 2, true);
    paramView.setClickable(false);
  }
}
