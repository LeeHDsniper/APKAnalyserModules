import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.TextView;
import com.tencent.common.galleryactivity.GalleryPageView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class hdi
  implements Animation.AnimationListener
{
  public hdi(GalleryPageView paramGalleryPageView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    a.a.clearAnimation();
    a.a.setVisibility(4);
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation) {}
}
