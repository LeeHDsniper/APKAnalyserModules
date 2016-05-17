import android.graphics.Bitmap;
import android.support.v4.util.LruCache;
import com.tencent.mobileqq.activity.qwallet.PreloadImgManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mcu
  extends LruCache
{
  public mcu(PreloadImgManager paramPreloadImgManager, int paramInt)
  {
    super(paramInt);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a(String paramString, Bitmap paramBitmap)
  {
    return paramBitmap.getRowBytes() * paramBitmap.getHeight() / 1024;
  }
}
