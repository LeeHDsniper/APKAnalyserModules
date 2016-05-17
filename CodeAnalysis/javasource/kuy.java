import android.graphics.Rect;
import com.tencent.ark.ark;
import com.tencent.ark.ark.ContainerCallback;
import com.tencent.mobileqq.activity.aio.item.ArkContainerWrapper;
import com.tencent.mobileqq.activity.aio.item.ArkContainerWrapper.OnArkContainerEventListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.WeakReference;

public class kuy
  implements ark.ContainerCallback
{
  public kuy(ArkContainerWrapper paramArkContainerWrapper)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void RegisterModules(long paramLong)
  {
    ark.arkModuleRegCallbackWrapper(paramLong, ArkContainerWrapper.a());
  }
  
  public void SyncRect(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    ArkContainerWrapper.a(a).set(paramInt1, paramInt2, paramInt3, paramInt4);
    if ((!ArkContainerWrapper.a(a)) && (ArkContainerWrapper.a(a) != null) && (ArkContainerWrapper.a(a).get() != null)) {
      ((ArkContainerWrapper.OnArkContainerEventListener)ArkContainerWrapper.a(a).get()).a(ArkContainerWrapper.a(a));
    }
  }
  
  public void Update(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    Rect localRect = new Rect();
    localRect.set(paramInt1, paramInt2, paramInt3, paramInt4);
    if ((ArkContainerWrapper.a(a) != null) && (ArkContainerWrapper.a(a).get() != null)) {
      ((ArkContainerWrapper.OnArkContainerEventListener)ArkContainerWrapper.a(a).get()).a(localRect);
    }
  }
}
