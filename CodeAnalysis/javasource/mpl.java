import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.ImageView;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;

public class mpl
  implements ViewTreeObserver.OnGlobalLayoutListener
{
  public mpl(ShortVideoPreviewActivity paramShortVideoPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onGlobalLayout()
  {
    a.jdField_a_of_type_AndroidGraphicsBitmap = ShortVideoUtils.a(a, a.d);
    a.jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(a.jdField_a_of_type_AndroidGraphicsBitmap);
    a.jdField_a_of_type_AndroidWidgetImageView.getViewTreeObserver().removeGlobalOnLayoutListener(this);
  }
}
