import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import com.tencent.mobileqq.activity.phone.CountryActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lyo
  implements Animation.AnimationListener
{
  public lyo(CountryActivity paramCountryActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    a.jdField_a_of_type_Lyv.show();
    a.b.setAnimation(null);
    a.jdField_a_of_type_AndroidViewView.setVisibility(8);
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation) {}
}
