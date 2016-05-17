import android.view.View;
import android.view.animation.Animation;
import com.tencent.mobileqq.activity.contact.addcontact.AddContactsActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.AnimateUtils.AnimationAdapter;

class lpo
  extends AnimateUtils.AnimationAdapter
{
  lpo(lpm paramLpm)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    a.a.findViewById(16908290).setBackgroundDrawable(null);
  }
}
