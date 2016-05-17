import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.TextView;
import com.tencent.common.galleryactivity.AbstractGalleryScene;
import com.tencent.common.galleryactivity.GalleryPageView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class hdh
  implements Animation.AnimationListener
{
  public hdh(GalleryPageView paramGalleryPageView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    a.jdField_a_of_type_AndroidWidgetTextView.clearAnimation();
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation)
  {
    if (!a.jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene.d()) {
      a.jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    }
  }
}
