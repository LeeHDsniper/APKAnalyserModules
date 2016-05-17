import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.view.View;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mio
  implements ValueAnimator.AnimatorUpdateListener
{
  public mio(FlowCameraActivity2 paramFlowCameraActivity2, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationUpdate(ValueAnimator paramValueAnimator)
  {
    paramValueAnimator = (Integer)paramValueAnimator.getAnimatedValue();
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.g.setPadding(0, 0, 0, paramValueAnimator.intValue());
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.e.setPadding(0, jdField_a_of_type_Int - paramValueAnimator.intValue(), 0, 0);
  }
}
