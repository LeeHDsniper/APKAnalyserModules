import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.XPanelContainer;

public class lly
  implements Animation.AnimationListener
{
  public lly(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    TroopChatPie.a(a).setBackgroundResource(2130839527);
    TroopChatPie.c(a).setBackgroundResource(2130839527);
    a.i.setVisibility(8);
    a.j.setVisibility(8);
    a.g.setVisibility(0);
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation)
  {
    a.i.setVisibility(0);
    a.j.setVisibility(0);
  }
}
