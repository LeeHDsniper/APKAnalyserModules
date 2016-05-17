import com.tencent.mobileqq.activity.contact.newfriend.NewFriendActivity;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgListView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

class lrr
  implements Runnable
{
  lrr(lrq paramLrq)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    SystemMsgListView.a(a.a.app);
    ReportController.b(a.a.app, "CliOper", "", "", "frd_recommend", "clean_apply", 0, 0, "", "", "", "");
  }
}
