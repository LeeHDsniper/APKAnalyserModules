import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mqu
  implements Animation.AnimationListener
{
  public mqu(SpecailCareListActivity paramSpecailCareListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    a.leftView.clearAnimation();
    a.a.clearAnimation();
    a.leftView.setVisibility(0);
    a.a.setVisibility(0);
    a.rightViewText.setClickable(true);
    a.rightViewText.setText("管理");
    a.rightViewText.setContentDescription("管理 按钮");
    a.c = false;
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation) {}
}
