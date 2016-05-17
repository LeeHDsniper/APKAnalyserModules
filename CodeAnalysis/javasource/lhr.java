import android.content.Context;
import android.content.res.Resources;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.aio.rebuild.HotChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.immersive.SystemBarCompact;

public class lhr
  implements Runnable
{
  public lhr(HotChatPie paramHotChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject = a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getSupportFragmentManager();
    if (localObject != null)
    {
      localObject = (ChatFragment)((FragmentManager)localObject).findFragmentByTag(ChatFragment.class.getName());
      if ((localObject != null) && (a != null)) {
        a.b(a.jdField_a_of_type_AndroidContentContext.getResources().getColor(2131427706));
      }
    }
  }
}
