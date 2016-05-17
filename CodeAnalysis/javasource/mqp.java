import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mqp
  implements Animation.AnimationListener
{
  public mqp(SpecailCareListActivity paramSpecailCareListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    a.leftView.clearAnimation();
    a.a.clearAnimation();
    a.leftView.setVisibility(4);
    a.a.setVisibility(8);
    a.rightViewText.setClickable(true);
    a.rightViewText.setText("完成");
    a.rightViewText.setContentDescription("完成 按钮");
    a.c = true;
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation) {}
}
