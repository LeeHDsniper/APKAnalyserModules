import android.os.Handler;
import android.os.Message;
import android.widget.RelativeLayout;
import com.tencent.mobileqq.activity.selectmember.FriendListInnerFrame;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mku
  extends Handler
{
  public mku(FriendListInnerFrame paramFriendListInnerFrame)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      return;
    case 1: 
      a.a.setPadding(0, 0, 40, 0);
      return;
    }
    a.a.setPadding(0, 0, 0, 0);
  }
}
