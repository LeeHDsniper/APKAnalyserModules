import android.os.MessageQueue.IdleHandler;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryScene;
import com.tencent.mobileqq.activity.aio.photo.AIOImageData;
import com.tencent.mobileqq.activity.aio.photo.AIOImageListModel;
import com.tencent.mobileqq.activity.aio.photo.AIORichMediaInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ldf
  implements MessageQueue.IdleHandler
{
  public ldf(AIOGalleryScene paramAIOGalleryScene)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean queueIdle()
  {
    Object localObject = a.a.a();
    if ((localObject != null) && (AIOImageData.class.isInstance(a)))
    {
      localObject = (AIOImageData)a;
      if ((localObject != null) && (((AIOImageData)localObject).a(4)) && (((AIOImageData)localObject).a(4) == null)) {
        a.c(true);
      }
    }
    return false;
  }
}
