import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity.ViewHolder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mqn
  implements Animation.AnimationListener
{
  public mqn(SpecailCareListActivity paramSpecailCareListActivity, SpecailCareListActivity.ViewHolder paramViewHolder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity$ViewHolder.a.clearAnimation();
    paramAnimation = new RelativeLayout.LayoutParams(-2, -2);
    paramAnimation.addRule(10);
    paramAnimation.addRule(1, 2131296683);
    paramAnimation.setMargins(0, (int)(22.0F * SpecailCareListActivity.c(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity)), (int)(30.0F * SpecailCareListActivity.d(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity)), 0);
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity$ViewHolder.a.setLayoutParams(paramAnimation);
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation) {}
}
