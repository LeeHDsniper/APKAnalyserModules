import android.view.animation.Animation;
import com.tencent.common.galleryactivity.AbstractAnimationManager;
import com.tencent.common.galleryactivity.AbstractGalleryScene;
import com.tencent.common.galleryactivity.GalleryManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.AnimateUtils.AnimationAdapter;

public class hcz
  extends AnimateUtils.AnimationAdapter
{
  public hcz(AbstractGalleryScene paramAbstractGalleryScene)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    a.a.a().b();
    a.a.a().a();
  }
  
  public void onAnimationStart(Animation paramAnimation)
  {
    a.a.a().c();
  }
}
