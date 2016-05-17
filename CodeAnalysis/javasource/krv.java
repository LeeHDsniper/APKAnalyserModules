import android.view.View;
import android.view.animation.Animation;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.activity.aio.anim.ComboAnimation3;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.AnimateUtils.AnimationAdapter;

public class krv
  extends AnimateUtils.AnimationAdapter
{
  public krv(ComboAnimation3 paramComboAnimation3)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    if ((ComboAnimation3.a(a) != null) && (ComboAnimation3.a(a).isShown())) {
      a.a.post(new krw(this));
    }
  }
}
