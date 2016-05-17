import android.view.animation.Interpolator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.AnimateUtils;
import com.tencent.widget.ListView;

public class ucc
  implements Interpolator
{
  private ucc(ListView paramListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public float getInterpolation(float paramFloat)
  {
    return AnimateUtils.a(paramFloat);
  }
}
