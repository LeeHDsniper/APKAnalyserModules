import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgListView;
import com.tencent.mobileqq.adapter.SystemMsgListAdapter;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lsw
  extends TroopObserver
{
  public lsw(SystemMsgListView paramSystemMsgListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, String paramString)
  {
    if ((paramBoolean) && (SystemMsgListView.a(a) != null)) {
      SystemMsgListView.a(a).notifyDataSetChanged();
    }
  }
}
