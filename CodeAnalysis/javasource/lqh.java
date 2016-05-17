import android.view.View;
import android.view.animation.ScaleAnimation;
import com.tencent.mobileqq.activity.contact.addcontact.PublicView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lqh
  implements Runnable
{
  public lqh(PublicView paramPublicView, View paramView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_AndroidViewView.setVisibility(0);
    ScaleAnimation localScaleAnimation = new ScaleAnimation(0.48F, 1.16F, 0.48F, 1.16F, 1, 0.5F, 1, 0.5F);
    localScaleAnimation.setDuration(130L);
    jdField_a_of_type_AndroidViewView.startAnimation(localScaleAnimation);
    localScaleAnimation.setAnimationListener(new lqi(this));
  }
}
