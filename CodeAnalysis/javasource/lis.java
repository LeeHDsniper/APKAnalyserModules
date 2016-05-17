import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.bubble.ChatXListView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lis
  implements Animator.AnimatorListener
{
  public lis(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationCancel(Animator paramAnimator) {}
  
  public void onAnimationEnd(Animator paramAnimator)
  {
    a.a.a(PublicAccountChatPie.a(a));
    PublicAccountChatPie.a(a, true);
  }
  
  public void onAnimationRepeat(Animator paramAnimator) {}
  
  public void onAnimationStart(Animator paramAnimator) {}
}
