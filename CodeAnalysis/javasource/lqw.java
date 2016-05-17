import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseFragment;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.pb.addcontacts.AccountSearchPb.record;

public class lqw
  extends FriendListObserver
{
  public lqw(SearchBaseFragment paramSearchBaseFragment)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, Object paramObject)
  {
    if ((paramBoolean) && (paramObject != null) && (SearchBaseFragment.a(a) != null) && (aa).uin.get() == ((Long)paramObject).longValue())) {
      aa).relation.set(aa).relation.get() & 0x10);
    }
  }
}
