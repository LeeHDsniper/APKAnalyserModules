import com.tencent.common.app.AppInterface;
import com.tencent.mobileqq.activity.bless.BlessManager;
import com.tencent.mobileqq.activity.shortvideo.SendVideoActivity;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mod
  extends MessageObserver
{
  public mod(SendVideoActivity paramSendVideoActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void d(boolean paramBoolean, String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SendVideoActivity", 2, "messageObserver,  onUpdateMsgContent, isSuc:" + paramBoolean);
    }
    if ((SendVideoActivity.a() == null) || (!paramBoolean)) {
      a.setResult(-2);
    }
    for (;;)
    {
      a.finish();
      return;
      ((BlessManager)a.getAppInterface().getManager(137)).a(SendVideoActivity.a());
      a.setResult(-1, a.getIntent());
    }
  }
}
