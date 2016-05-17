import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.RelativeLayout.LayoutParams;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity.ViewHolder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mqo
  implements Animation.AnimationListener
{
  public mqo(SpecailCareListActivity paramSpecailCareListActivity, SpecailCareListActivity.ViewHolder paramViewHolder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity$ViewHolder.a.clearAnimation();
    paramAnimation = new RelativeLayout.LayoutParams(-2, -2);
    paramAnimation.addRule(1, 2131296683);
    paramAnimation.setMargins(0, (int)(24.0F * SpecailCareListActivity.e(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity)), 0, 0);
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity$ViewHolder.a.setLayoutParams(paramAnimation);
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity$ViewHolder.a.setVisibility(4);
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation) {}
}
