import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.os.Message;
import com.tencent.mobileqq.activity.aio.rebuild.FriendChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.SharedPreUtils;
import mqq.os.MqqHandler;

class lgy
  implements Runnable
{
  lgy(lgx paramLgx)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Message localMessage = FriendChatPie.a(a.a).obtainMessage(45);
    Bundle localBundle = new Bundle();
    localBundle.putBoolean("showRedDot", false);
    localMessage.setData(localBundle);
    FriendChatPie.b(a.a).sendMessage(localMessage);
    SharedPreUtils.c(a.a.a.a()).edit().putBoolean("aio_jump_lightalk_red_dot", false).commit();
  }
}
