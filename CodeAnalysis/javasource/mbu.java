import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.photo.PhotoPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.AlbumUtil;

public class mbu
  implements View.OnClickListener
{
  public mbu(PhotoPreviewActivity paramPhotoPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (a.l) {
      ReportController.b(null, "CliOper", "", "", "0X8004D94", "0X8004D94", 0, 0, "", "", "", "");
    }
    if (("FROM_PHOTO_LIST_FLOW".equals(a.h)) && (a.j)) {
      a.setResult(-1);
    }
    a.finish();
    AlbumUtil.a(a, true, false);
  }
}
