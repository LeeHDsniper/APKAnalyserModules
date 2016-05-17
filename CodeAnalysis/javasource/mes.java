import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.ImageView;
import com.tencent.mobileqq.activity.recent.AnonymousEntranceView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mes
  implements Animation.AnimationListener
{
  public mes(AnonymousEntranceView paramAnonymousEntranceView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    if (AnonymousEntranceView.b(a) != null) {
      AnonymousEntranceView.b(a).setVisibility(4);
    }
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation)
  {
    if (AnonymousEntranceView.b(a) != null) {
      AnonymousEntranceView.b(a).setVisibility(0);
    }
  }
}
