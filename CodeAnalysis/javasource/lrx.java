import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.contact.newfriend.NewFriendActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.WeakReference;

public class lrx
  extends Handler
{
  private WeakReference a;
  
  public lrx(NewFriendActivity paramNewFriendActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new WeakReference(paramNewFriendActivity);
  }
  
  public void handleMessage(Message paramMessage)
  {
    NewFriendActivity localNewFriendActivity = (NewFriendActivity)a.get();
    if (localNewFriendActivity == null) {
      return;
    }
    switch (what)
    {
    default: 
      throw new RuntimeException("Unknown message: " + what);
    case 1: 
      localNewFriendActivity.a(arg1);
      return;
    }
    localNewFriendActivity.finish();
  }
}
