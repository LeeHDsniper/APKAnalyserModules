import android.content.Context;
import android.content.res.Resources;
import com.tencent.mobileqq.activity.AutoRemarkActivity;
import com.tencent.mobileqq.activity.contact.newfriend.BaseNewFriendView.INewFriendContext;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgListView;
import com.tencent.mobileqq.adapter.SystemMsgListAdapter;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQToast;

public class lsv
  extends FriendListObserver
{
  public lsv(SystemMsgListView paramSystemMsgListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(String paramString, boolean paramBoolean)
  {
    if ((paramBoolean) && (SystemMsgListView.a(a) != null)) {
      SystemMsgListView.a(a).notifyDataSetChanged();
    }
  }
  
  protected void a(boolean paramBoolean, String paramString)
  {
    if ((paramBoolean) && (SystemMsgListView.a(a) != null)) {
      SystemMsgListView.a(a).notifyDataSetChanged();
    }
  }
  
  protected void a(boolean paramBoolean, String paramString, int paramInt)
  {
    if ((a.a.a()) && (SystemMsgListView.a(a) != null))
    {
      if (paramBoolean)
      {
        SystemMsgListView.a(a).notifyDataSetChanged();
        AutoRemarkActivity.a(a.a.getActivity(), 0, paramString, 0L);
      }
    }
    else {
      return;
    }
    paramString = SystemMsgListView.a(a).getResources().getString(2131367163);
    QQToast.a(SystemMsgListView.a(a), 1, paramString, 0).b(a.a());
  }
  
  protected void a(boolean paramBoolean, String paramString1, String paramString2, byte paramByte)
  {
    if ((paramBoolean) && (SystemMsgListView.a(a) != null)) {
      SystemMsgListView.a(a).notifyDataSetChanged();
    }
  }
}
