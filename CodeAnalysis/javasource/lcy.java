import android.os.Handler;
import android.os.Looper;
import com.tencent.image.VideoDrawable.OnPlayRepeatListener;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryAdapter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lcy
  implements VideoDrawable.OnPlayRepeatListener
{
  AIOGalleryAdapter a;
  
  public lcy(AIOGalleryAdapter paramAIOGalleryAdapter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramAIOGalleryAdapter;
  }
  
  public void onPlayRepeat(int paramInt)
  {
    if (paramInt != 1) {
      return;
    }
    new Handler(Looper.getMainLooper()).post(new lcz(this));
  }
}
