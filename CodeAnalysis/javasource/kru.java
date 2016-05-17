import android.graphics.Matrix;
import android.view.animation.Animation;
import android.view.animation.Transformation;
import com.tencent.mobileqq.activity.aio.anim.ComboAnimation3;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kru
  extends Animation
{
  private float jdField_a_of_type_Float;
  private float b;
  
  public kru(ComboAnimation3 paramComboAnimation3)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Float = 0.0F;
    b = 0.0F;
  }
  
  protected void applyTransformation(float paramFloat, Transformation paramTransformation)
  {
    float f2 = 1.0F;
    float f1;
    if (paramFloat < jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float * 11.0F)
    {
      f1 = paramFloat / (jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float * 11.0F);
      if (paramFloat >= jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float * 6.0F) {
        break label139;
      }
      f2 = 1.0F + paramFloat / (jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float * 6.0F) * 0.5F;
    }
    for (;;)
    {
      paramTransformation.setAlpha(f1);
      paramTransformation.getMatrix().setScale(f2, f2, jdField_a_of_type_Float, b);
      return;
      if (paramFloat < jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float * 20.0F)
      {
        f1 = 1.0F;
        break;
      }
      f1 = 1.0F - (paramFloat - jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float * 20.0F) / (4.0F * jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float);
      break;
      label139:
      if (paramFloat < jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float * 11.0F) {
        f2 = 1.5F - (paramFloat - jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float * 6.0F) * 0.5F / (5.0F * jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float);
      }
    }
  }
  
  public void initialize(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.initialize(paramInt1, paramInt2, paramInt3, paramInt4);
    jdField_a_of_type_Float = (paramInt1 * 0.5F);
    b = (paramInt2 * 0.5F);
  }
}
