import com.tencent.mobileqq.activity.contact.newfriend.NewFriendActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.widget.TabBarView.OnTabChangeListener;

public class lrp
  implements TabBarView.OnTabChangeListener
{
  public lrp(NewFriendActivity paramNewFriendActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    switch (paramInt2)
    {
    default: 
      return;
    case 1: 
      NewFriendActivity.a(a, false);
      a.e();
      NewFriendActivity.a(a, 2);
      ReportController.b(a.app, "CliOper", "", "", "frd_recommend", "frd_rclist_exp", 0, 0, "0", "", "", "");
      return;
    }
    NewFriendActivity.a(a, false);
    a.f();
    NewFriendActivity.a(a, 3);
    ReportController.b(a.app, "CliOper", "", "", "frd_recommend", "frd_rclist_exp", 0, 0, "1", "", "", "");
  }
}
