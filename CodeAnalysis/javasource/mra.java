import android.view.View;
import android.view.Window;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.FrameLayout;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendGrid;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mra
  implements Animation.AnimationListener
{
  public mra(SpecailCareListActivity paramSpecailCareListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    a.c.clearAnimation();
    ((FrameLayout)a.getWindow().getDecorView()).removeView(a.c);
    a.c = null;
    if (a.a != null)
    {
      a.a.a();
      a.a = null;
    }
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation) {}
}
