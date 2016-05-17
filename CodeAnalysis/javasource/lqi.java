import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.ScaleAnimation;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class lqi
  implements Animation.AnimationListener
{
  lqi(lqh paramLqh)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    paramAnimation = new ScaleAnimation(1.16F, 1.0F, 1.16F, 1.0F, 1, 0.5F, 1, 0.5F);
    paramAnimation.setDuration(290L);
    a.a.startAnimation(paramAnimation);
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation) {}
}
