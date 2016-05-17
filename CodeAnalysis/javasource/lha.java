import android.os.Bundle;
import com.tencent.mobileqq.activity.aio.rebuild.FriendChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.observer.VipGifObserver;

public class lha
  extends VipGifObserver
{
  public lha(FriendChatPie paramFriendChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle)
  {
    if ((paramInt == 0) && (paramBoolean == true))
    {
      paramBundle.getInt("gif_ui_show_bid");
      long l = paramBundle.getLong("gif_ui_show_seq");
      a.a(65536);
      FriendChatPie.a(a, Long.valueOf(l).longValue());
    }
  }
}
