import android.content.res.Resources;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import com.tencent.mobileqq.activity.photo.PhotoPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQToast;

public class mbm
  implements View.OnClickListener
{
  public mbm(PhotoPreviewActivity paramPhotoPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (!a.a.isChecked())
    {
      if (a.b() > 0)
      {
        QQToast.a(a, a.getResources().getString(2131369812), 0).b(a.getResources().getDimensionPixelSize(2131492908));
        return;
      }
      a.a.setChecked(true);
      return;
    }
    a.a.setChecked(false);
  }
}
