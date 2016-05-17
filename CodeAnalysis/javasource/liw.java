import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class liw
  implements Animation.AnimationListener
{
  public liw(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    a.J = false;
    a.dv = 0;
    a.K = false;
    a.S = false;
    a.R = false;
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation)
  {
    a.a(a.g, PublicAccountChatPie.a(a));
  }
}
