import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import com.tencent.ark.ark.Container;
import com.tencent.mobileqq.activity.aio.item.ArkContainerWrapper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kuz
  extends GestureDetector.SimpleOnGestureListener
{
  public kuz(ArkContainerWrapper paramArkContainerWrapper)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onSingleTapUp(MotionEvent paramMotionEvent)
  {
    if (ArkContainerWrapper.a(a) == null) {
      return false;
    }
    int i = (int)(paramMotionEvent.getX() / kvb.a(a.a));
    int j = (int)(paramMotionEvent.getY() / kvb.a(a.a));
    ArkContainerWrapper.a(a).MouseClick(i, j, 1L, 0L);
    return true;
  }
}
