import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.automator.step.CheckFriendsLastLoginInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nhf
  extends FriendListObserver
{
  private nhf(CheckFriendsLastLoginInfo paramCheckFriendsLastLoginInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void b(boolean paramBoolean1, boolean paramBoolean2)
  {
    int i = 0;
    if (!paramBoolean1) {
      a.a(6);
    }
    for (;;)
    {
      if (i != 0) {
        a.a(7);
      }
      return;
      if (paramBoolean2) {
        i = 1;
      }
    }
  }
}
