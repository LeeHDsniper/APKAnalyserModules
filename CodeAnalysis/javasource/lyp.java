import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import com.tencent.mobileqq.activity.phone.CountryActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lyp
  implements Animation.AnimationListener
{
  public lyp(CountryActivity paramCountryActivity, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    jdField_a_of_type_ComTencentMobileqqActivityPhoneCountryActivity.b.setAnimation(null);
    jdField_a_of_type_ComTencentMobileqqActivityPhoneCountryActivity.b.offsetTopAndBottom(jdField_a_of_type_Int);
    jdField_a_of_type_ComTencentMobileqqActivityPhoneCountryActivity.b.requestLayout();
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation) {}
}
