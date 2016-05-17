import android.animation.IntEvaluator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.widget.FrameLayout.LayoutParams;
import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.List;

public class lww
  implements ValueAnimator.AnimatorUpdateListener
{
  private int jdField_a_of_type_Int;
  private IntEvaluator jdField_a_of_type_AndroidAnimationIntEvaluator;
  
  public lww(AvatarPendantActivity paramAvatarPendantActivity, List paramList1, List paramList2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidAnimationIntEvaluator = new IntEvaluator();
    jdField_a_of_type_Int = jdField_a_of_type_JavaUtilList.size();
  }
  
  public void onAnimationUpdate(ValueAnimator paramValueAnimator)
  {
    float f = ((Integer)paramValueAnimator.getAnimatedValue()).intValue() / 100.0F;
    int i = 0;
    while (i < jdField_a_of_type_Int)
    {
      paramValueAnimator = (View)jdField_a_of_type_JavaUtilList.get(i);
      lxf localLxf = (lxf)b.get(i);
      ViewGroup.LayoutParams localLayoutParams = paramValueAnimator.getLayoutParams();
      if (jdField_a_of_type_Int != b)
      {
        FrameLayout.LayoutParams localLayoutParams1 = (FrameLayout.LayoutParams)paramValueAnimator.getLayoutParams();
        topMargin = jdField_a_of_type_AndroidAnimationIntEvaluator.evaluate(f, Integer.valueOf(jdField_a_of_type_Int), Integer.valueOf(b)).intValue();
        paramValueAnimator.setLayoutParams(localLayoutParams1);
      }
      if (c != d) {
        height = jdField_a_of_type_AndroidAnimationIntEvaluator.evaluate(f, Integer.valueOf(c), Integer.valueOf(d)).intValue();
      }
      if (e != f) {
        width = jdField_a_of_type_AndroidAnimationIntEvaluator.evaluate(f, Integer.valueOf(e), Integer.valueOf(f)).intValue();
      }
      paramValueAnimator.setLayoutParams(localLayoutParams);
      paramValueAnimator.requestLayout();
      i += 1;
    }
  }
}
