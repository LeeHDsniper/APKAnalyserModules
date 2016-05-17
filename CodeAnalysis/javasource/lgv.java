import com.tencent.mobileqq.activity.aio.rebuild.FriendChatPie;
import com.tencent.mobileqq.activity.aio.tips.GatherContactsTips;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lgv
  implements Runnable
{
  public lgv(FriendChatPie paramFriendChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (FriendChatPie.a(a) != null)
    {
      FriendChatPie.a(a).b(1);
      FriendChatPie.a(a).b(2);
      FriendChatPie.a(a, null);
    }
  }
}
