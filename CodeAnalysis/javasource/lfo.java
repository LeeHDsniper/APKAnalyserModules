import android.os.Handler;
import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lfo
  extends MessageObserver
{
  public lfo(BusinessCmrTmpChatPie paramBusinessCmrTmpChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void e(boolean paramBoolean)
  {
    super.e(paramBoolean);
    BusinessCmrTmpChatPie.a(a).sendEmptyMessage(0);
  }
}
