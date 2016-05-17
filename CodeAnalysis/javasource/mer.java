import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.ImageView;
import com.tencent.mobileqq.activity.recent.AnonymousEntranceView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mer
  implements Animation.AnimationListener
{
  public mer(AnonymousEntranceView paramAnonymousEntranceView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    if (AnonymousEntranceView.a(a) != null) {
      AnonymousEntranceView.a(a).setVisibility(4);
    }
    if (AnonymousEntranceView.b(a) != null)
    {
      AnonymousEntranceView.b(a).clearAnimation();
      AnonymousEntranceView.b(a).startAnimation(AnonymousEntranceView.a(a));
    }
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation)
  {
    if (AnonymousEntranceView.a(a) != null) {
      AnonymousEntranceView.a(a).setVisibility(0);
    }
  }
}
