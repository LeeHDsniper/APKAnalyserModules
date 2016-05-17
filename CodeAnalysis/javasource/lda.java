import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryScene;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lda
  implements View.OnClickListener
{
  public lda(AIOGalleryScene paramAIOGalleryScene)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    ReportController.b(null, "CliOper", "", "", "View_pic", "View_pic_menu", 0, 0, "1", "", "", "");
    a.p();
  }
}
