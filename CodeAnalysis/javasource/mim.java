import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.view.View;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mim
  implements ValueAnimator.AnimatorUpdateListener
{
  public mim(FlowCameraActivity2 paramFlowCameraActivity2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationUpdate(ValueAnimator paramValueAnimator)
  {
    paramValueAnimator = (Integer)paramValueAnimator.getAnimatedValue();
    a.c.setBackgroundColor(paramValueAnimator.intValue());
    a.b.setBackgroundColor(paramValueAnimator.intValue());
    a.a.setBackgroundColor(paramValueAnimator.intValue());
  }
}
