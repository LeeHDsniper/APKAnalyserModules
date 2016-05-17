import com.tencent.mobileqq.activity.ForwardRecentActivity;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ixy
  extends FriendListObserver
{
  public ixy(ForwardRecentActivity paramForwardRecentActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(String paramString, boolean paramBoolean)
  {
    if (paramBoolean) {
      ForwardRecentActivity.a(a);
    }
  }
}
