import android.content.res.Resources;
import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.aio.rebuild.FriendChatPie;
import com.tencent.mobileqq.activity.aio.tips.GatherContactsTips;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQToast;
import java.util.List;

public class lgu
  extends FriendListObserver
{
  public lgu(FriendChatPie paramFriendChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, List paramList)
  {
    if ((paramBoolean) && (FriendChatPie.a(a) != null))
    {
      if ((FriendChatPie.a(a).a()) && (!FriendChatPie.a(a).b()))
      {
        FriendChatPie.a(a).b(1);
        FriendChatPie.a(a).a(2);
      }
      return;
    }
    QQToast.a(a.a, a.a.getResources().getString(2131371532), 0).b(a.a.getTitleBarHeight());
  }
  
  protected void b(boolean paramBoolean, List paramList)
  {
    if ((paramBoolean) && (FriendChatPie.a(a) != null)) {
      FriendChatPie.a(a).b(2);
    }
  }
}
