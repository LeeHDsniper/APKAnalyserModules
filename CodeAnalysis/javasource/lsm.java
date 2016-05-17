import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgListView;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgSwipListView;
import com.tencent.mobileqq.adapter.SystemMsgListAdapter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQToast;

public class lsm
  extends Handler
{
  public lsm(SystemMsgListView paramSystemMsgListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    case 1013: 
    default: 
    case 1012: 
    case 1014: 
    case 1015: 
      do
      {
        do
        {
          do
          {
            return;
          } while (SystemMsgListView.a(a) == null);
          a.j();
          SystemMsgListView.a(a).notifyDataSetChanged();
          return;
        } while (SystemMsgListView.a(a).m() <= 0);
        SystemMsgListView.a(a).a(a.e);
        return;
      } while (SystemMsgListView.a(a) == null);
      SystemMsgListView.a(a).a(a.e);
      a.e.setVisibility(0);
      return;
    }
    paramMessage = SystemMsgListView.a(a).getResources().getString(2131367165);
    QQToast.a(SystemMsgListView.a(a), 1, paramMessage, 0).b(a.a());
  }
}
