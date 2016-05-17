import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryAdapter.OnAdapterNotify;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryScene;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ldb
  implements AIOGalleryAdapter.OnAdapterNotify
{
  public ldb(AIOGalleryScene paramAIOGalleryScene)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt)
  {
    View localView;
    if (paramInt == 0)
    {
      localView = a.a().findViewById(2131301838);
      if (localView != null) {}
    }
    else
    {
      return;
    }
    localView.setVisibility(0);
    AlphaAnimation localAlphaAnimation = new AlphaAnimation(0.0F, 1.0F);
    localAlphaAnimation.setDuration(300L);
    localView.startAnimation(localAlphaAnimation);
    localView.postDelayed(new ldc(this, localView), 8000L);
  }
}
