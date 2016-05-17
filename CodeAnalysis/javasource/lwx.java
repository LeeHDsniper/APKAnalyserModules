import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lwx
  implements Animator.AnimatorListener
{
  public lwx(AvatarPendantActivity paramAvatarPendantActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationCancel(Animator paramAnimator)
  {
    a.e = AvatarPendantActivity.c;
  }
  
  public void onAnimationEnd(Animator paramAnimator)
  {
    a.e = AvatarPendantActivity.a;
  }
  
  public void onAnimationRepeat(Animator paramAnimator) {}
  
  public void onAnimationStart(Animator paramAnimator)
  {
    a.e = AvatarPendantActivity.d;
  }
}
