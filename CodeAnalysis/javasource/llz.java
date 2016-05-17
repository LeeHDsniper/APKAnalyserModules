import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.LinearLayout;
import com.tencent.mobileqq.activity.aio.ChatBackground;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.XPanelContainer;

public class llz
  implements Animation.AnimationListener
{
  public llz(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    a.i.setVisibility(8);
    a.j.setVisibility(8);
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation)
  {
    TroopChatPie.b(a).setBackgroundDrawable(a.a.a.a);
    TroopChatPie.d(a).setBackgroundResource(2130842611);
    TroopChatPie.a(a).setBackgroundResource(2130842482);
  }
}
