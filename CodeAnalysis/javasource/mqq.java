import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.ImageView;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity.ViewHolder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mqq
  implements Animation.AnimationListener
{
  public mqq(SpecailCareListActivity paramSpecailCareListActivity, SpecailCareListActivity.ViewHolder paramViewHolder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity$ViewHolder.c.setVisibility(4);
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation) {}
}
