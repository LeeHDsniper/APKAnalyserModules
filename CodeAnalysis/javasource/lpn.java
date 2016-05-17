import android.content.Intent;
import android.view.animation.Animation;
import com.tencent.mobileqq.activity.contact.addcontact.AddContactsActivity;
import com.tencent.mobileqq.activity.contact.addcontact.SearchContactsActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.ThreadPriorityManager;
import com.tencent.util.AnimateUtils.AnimationAdapter;

class lpn
  extends AnimateUtils.AnimationAdapter
{
  lpn(lpm paramLpm)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    a.a.a = true;
    paramAnimation = new Intent(a.a, SearchContactsActivity.class);
    paramAnimation.putExtra("from_key", a.a.a());
    a.a.startActivity(paramAnimation);
    a.a.overridePendingTransition(0, 0);
    ThreadPriorityManager.a(false);
  }
}
