import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.TranslateAnimation;
import android.widget.FrameLayout.LayoutParams;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.selectmember.CreateFaceToFaceDiscussionActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mki
  implements Animation.AnimationListener
{
  public mki(CreateFaceToFaceDiscussionActivity paramCreateFaceToFaceDiscussionActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    a.jdField_b_of_type_AndroidViewAnimationTranslateAnimation = new TranslateAnimation(0.0F, 0.0F, 0.0F, 0.0F);
    a.jdField_a_of_type_AndroidWidgetLinearLayout.setAnimation(a.jdField_b_of_type_AndroidViewAnimationTranslateAnimation);
    paramAnimation = (FrameLayout.LayoutParams)a.jdField_a_of_type_AndroidWidgetLinearLayout.getLayoutParams();
    paramAnimation.setMargins(0, 0, 0, a.jdField_b_of_type_AndroidWidgetLinearLayout.getHeight());
    a.jdField_a_of_type_AndroidWidgetLinearLayout.setLayoutParams(paramAnimation);
    a.jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation) {}
}
