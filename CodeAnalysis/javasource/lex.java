import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationSet;
import android.view.animation.ScaleAnimation;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel.SwipeUpAndDragListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.Logger;

class lex
  implements Animation.AnimationListener
{
  lex(lew paramLew, float paramFloat)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    Logger.a("PhotoListPanel", "DragHandler", " flyOutAnimation End fAnimLayout:" + jdField_a_of_type_Lew.jdField_a_of_type_AndroidWidgetRelativeLayout + ",## dy = " + (jdField_a_of_type_Float - jdField_a_of_type_Lew.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.b));
    paramAnimation = (RelativeLayout.LayoutParams)jdField_a_of_type_Lew.c.getLayoutParams();
    topMargin = jdField_a_of_type_Lew.d.topMargin;
    jdField_a_of_type_Lew.c.setLayoutParams(paramAnimation);
    jdField_a_of_type_Lew.jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    paramAnimation = new AnimationSet(false);
    ScaleAnimation localScaleAnimation = new ScaleAnimation(0.7F, 1.0F, 0.7F, 1.0F, jdField_a_of_type_Lew.c.getWidth() / 2, jdField_a_of_type_Lew.c.getHeight() / 2);
    paramAnimation.addAnimation(jdField_a_of_type_Lew.b);
    paramAnimation.addAnimation(localScaleAnimation);
    paramAnimation.setDuration(200L);
    jdField_a_of_type_Lew.c.startAnimation(paramAnimation);
    Logger.a("PhotoListPanel", "DragHandler", "startReemergeAnimation fAnimLayout:" + jdField_a_of_type_Lew.jdField_a_of_type_AndroidWidgetRelativeLayout);
    paramAnimation.setAnimationListener(jdField_a_of_type_Lew.jdField_a_of_type_AndroidViewAnimationAnimation$AnimationListener);
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation)
  {
    Logger.a("PhotoListPanel", "DragHandler", "@#flyOutAnimation, onAnimationStart ");
  }
}
