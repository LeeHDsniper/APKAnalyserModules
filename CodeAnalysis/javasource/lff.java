import android.os.Handler;
import android.os.Message;
import android.view.View;
import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lff
  extends Handler
{
  public lff(BusinessCmrTmpChatPie paramBusinessCmrTmpChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    super.handleMessage(paramMessage);
    if (BusinessCmrTmpChatPie.a(a).isShown()) {
      BusinessCmrTmpChatPie.a(a).setVisibility(8);
    }
  }
}
