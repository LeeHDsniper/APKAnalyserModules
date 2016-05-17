import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.ImageView;
import android.widget.RelativeLayout.LayoutParams;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity.ViewHolder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mqr
  implements Animation.AnimationListener
{
  public mqr(SpecailCareListActivity paramSpecailCareListActivity, SpecailCareListActivity.ViewHolder paramViewHolder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    paramAnimation = new RelativeLayout.LayoutParams(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity$ViewHolder.a.getLayoutParams());
    paramAnimation.addRule(15);
    paramAnimation.setMargins((int)(12.0F * SpecailCareListActivity.f(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity)), 0, (int)(10.0F * SpecailCareListActivity.g(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity)), 0);
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity$ViewHolder.a.setLayoutParams(paramAnimation);
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity$ViewHolder.a.clearAnimation();
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation) {}
}
