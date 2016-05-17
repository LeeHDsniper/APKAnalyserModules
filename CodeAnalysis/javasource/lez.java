import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationSet;
import android.view.animation.ScaleAnimation;
import android.widget.ImageView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class lez
  implements Animation.AnimationListener
{
  lez(ley paramLey)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    paramAnimation = new AnimationSet(false);
    ScaleAnimation localScaleAnimation = new ScaleAnimation(0.7F, 1.0F, 0.7F, 1.0F, a.jdField_a_of_type_AndroidWidgetImageView.getWidth() / 2, a.jdField_a_of_type_AndroidWidgetImageView.getHeight() / 2);
    paramAnimation.addAnimation(a.b);
    paramAnimation.addAnimation(localScaleAnimation);
    paramAnimation.setDuration(200L);
    a.jdField_a_of_type_AndroidWidgetImageView.startAnimation(paramAnimation);
    paramAnimation.setAnimationListener(a.jdField_a_of_type_AndroidViewAnimationAnimation$AnimationListener);
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation) {}
}
