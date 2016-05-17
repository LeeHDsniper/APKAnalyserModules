import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mil
  implements ValueAnimator.AnimatorUpdateListener
{
  public mil(FlowCameraActivity2 paramFlowCameraActivity2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationUpdate(ValueAnimator paramValueAnimator)
  {
    paramValueAnimator = (Integer)paramValueAnimator.getAnimatedValue();
    if (FlowCameraActivity2.a(a))
    {
      localLayoutParams = a.a.getLayoutParams();
      height = paramValueAnimator.intValue();
      a.a.setLayoutParams(localLayoutParams);
      return;
    }
    ViewGroup.LayoutParams localLayoutParams = a.b.getLayoutParams();
    height = paramValueAnimator.intValue();
    a.b.setLayoutParams(localLayoutParams);
  }
}
