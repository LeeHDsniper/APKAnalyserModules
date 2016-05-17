import android.graphics.Matrix;
import android.view.animation.Animation;
import android.view.animation.Transformation;
import com.tencent.mobileqq.activity.aio.anim.ComboAnimation3;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class krx
  extends Animation
{
  private float jdField_a_of_type_Float;
  private float b;
  
  public krx(ComboAnimation3 paramComboAnimation3)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Float = 0.0F;
    b = 0.0F;
  }
  
  protected void applyTransformation(float paramFloat, Transformation paramTransformation)
  {
    float f2 = 1.5F;
    float f1 = 0.0F;
    if (paramFloat < jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float * 5.0F) {
      paramFloat = f2;
    }
    for (;;)
    {
      paramTransformation.setAlpha(f1);
      paramTransformation.getMatrix().setScale(paramFloat, paramFloat, jdField_a_of_type_Float, b);
      return;
      if (paramFloat < 13.0F * jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float)
      {
        f1 = 0.5F - (paramFloat - jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float * 5.0F) / (jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float * 8.0F) * 0.5F;
        paramFloat = 1.5F + (paramFloat - jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float * 5.0F) / (jdField_a_of_type_ComTencentMobileqqActivityAioAnimComboAnimation3.jdField_a_of_type_Float * 8.0F) * 0.5F;
      }
      else
      {
        paramFloat = 2.0F;
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
