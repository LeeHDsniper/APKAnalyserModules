import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.photo.CameraPreviewActivity;
import com.tencent.mobileqq.activity.photo.PhotoUtils;
import com.tencent.mobileqq.activity.photo.StatisticConstants;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class maf
  implements View.OnClickListener
{
  public maf(CameraPreviewActivity paramCameraPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (!CameraPreviewActivity.a(a))
    {
      if (a.b) {
        ReportController.b(a.app, "CliOper", "", "", "0X8004D93", "0X8004D93", 0, 0, "", "", "", "");
      }
      if (!a.b) {
        break label92;
      }
      StatisticConstants.d();
    }
    for (;;)
    {
      PhotoUtils.a(a, a.getIntent(), CameraPreviewActivity.a(a), 0, true);
      paramView.setClickable(false);
      return;
      label92:
      StatisticConstants.b();
    }
  }
}
