import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Message;
import com.tencent.mobileqq.activity.aio.rebuild.FriendChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.jumplightalk.AIOJumpLightalkConfig;
import com.tencent.mobileqq.utils.SharedPreUtils;
import mqq.os.MqqHandler;

public class lgz
  implements Runnable
{
  public lgz(FriendChatPie paramFriendChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    FriendChatPie.a(a, AIOJumpLightalkConfig.a(a.a.a()));
    if (FriendChatPie.a(a) != null)
    {
      FriendChatPie.a(a, SharedPreUtils.c(a.a.a()).getBoolean("aio_jump_lightalk_red_dot", false));
      Message localMessage = FriendChatPie.c(a).obtainMessage(45);
      Bundle localBundle = new Bundle();
      localBundle.putBoolean("showRedDot", FriendChatPie.a(a));
      localMessage.setData(localBundle);
      FriendChatPie.d(a).sendMessage(localMessage);
    }
  }
}
