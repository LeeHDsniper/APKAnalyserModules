import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.view.View;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class liq
  implements ValueAnimator.AnimatorUpdateListener
{
  public liq(PublicAccountChatPie paramPublicAccountChatPie, View paramView, int paramInt1, int paramInt2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationUpdate(ValueAnimator paramValueAnimator)
  {
    float f1 = ((Integer)paramValueAnimator.getAnimatedValue()).intValue() / 100.0F;
    paramValueAnimator = jdField_a_of_type_AndroidViewView.getLayoutParams();
    float f2 = jdField_a_of_type_Int;
    height = ((int)(f1 * (b - jdField_a_of_type_Int) + f2));
    jdField_a_of_type_AndroidViewView.requestLayout();
  }
}
