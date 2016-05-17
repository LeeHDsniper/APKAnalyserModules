import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.contact.CircleMemberListActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.XListView;

public class lox
  extends Handler
{
  public lox(CircleMemberListActivity paramCircleMemberListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    int i;
    int j;
    if (what == 1000)
    {
      i = CircleMemberListActivity.a(a).s();
      j = CircleMemberListActivity.a(a).t();
      if (i <= 0) {
        break label63;
      }
      i -= 1;
    }
    for (;;)
    {
      a.app.a(new loy(this, i, j - 1));
      return;
      label63:
      i = 0;
    }
  }
}
