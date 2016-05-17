import com.tencent.mobileqq.activity.selectmember.FriendTeamListInnerFrame;
import com.tencent.mobileqq.activity.selectmember.SelectMemberBuddyListAdapter;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mle
  extends FriendListObserver
{
  public mle(FriendTeamListInnerFrame paramFriendTeamListInnerFrame)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramBoolean1) {
      FriendTeamListInnerFrame.a(a).notifyDataSetChanged();
    }
  }
}
