import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.view.ViewGroup;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class ktp
  implements Animator.AnimatorListener
{
  ktp(kto paramKto, ViewGroup paramViewGroup)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationCancel(Animator paramAnimator) {}
  
  public void onAnimationEnd(Animator paramAnimator) {}
  
  public void onAnimationRepeat(Animator paramAnimator) {}
  
  public void onAnimationStart(Animator paramAnimator)
  {
    jdField_a_of_type_AndroidViewViewGroup.setVisibility(0);
  }
}
