import android.view.View;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgListView;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgSwipListView;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgSwipListView.OnScrollToTopListener;
import com.tencent.mobileqq.adapter.SystemMsgListAdapter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.systemmsg.FriendSystemMsgController;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.widget.AbsListView;

public class lso
  implements SystemMsgSwipListView.OnScrollToTopListener
{
  public lso(SystemMsgListView paramSystemMsgListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(AbsListView paramAbsListView, int paramInt)
  {
    if ((SystemMsgListView.a(a) != null) && (paramInt == 0) && (SystemMsgListView.a(a) == SystemMsgListView.a(a).getCount())) {
      SystemMsgListView.b(a);
    }
    SystemMsgListView.a(a, paramInt);
    if (paramInt != 0)
    {
      SystemMsgListView.a(a).a();
      SystemMsgListView.a(a).c();
    }
    for (;;)
    {
      return;
      if (SystemMsgListView.a(a).b()) {
        SystemMsgListView.a(a).b();
      }
      int i = SystemMsgListView.a(a).getChildCount();
      paramInt = 0;
      while (paramInt < i)
      {
        paramAbsListView = (SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder)SystemMsgListView.a(a).getChildAt(paramInt).getTag();
        SystemMsgListView.a(a, paramAbsListView);
        paramInt += 1;
      }
    }
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    SystemMsgListView.b(a, paramInt1 + paramInt2 - 1);
    if (paramInt1 > 1) {
      FriendSystemMsgController.a().a();
    }
    while (!SystemMsgListView.c(a)) {
      return;
    }
    FriendSystemMsgController.a().f();
  }
  
  public void m() {}
}
