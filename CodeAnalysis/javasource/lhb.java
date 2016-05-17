import android.os.Bundle;
import com.tencent.mobileqq.activity.aio.rebuild.FriendChatPie;
import com.tencent.mobileqq.activity.aio.tips.FriendHotTipsBar;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.servlet.ReduFriendObserver;

public class lhb
  extends ReduFriendObserver
{
  public lhb(FriendChatPie paramFriendChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle)
  {
    if ((paramBoolean) && (a.a != null)) {
      a.a.a();
    }
  }
}
