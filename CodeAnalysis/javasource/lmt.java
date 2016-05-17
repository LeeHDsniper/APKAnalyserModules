import com.tencent.mobileqq.activity.aio.tips.FraudTipsBar;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.TimerTask;
import mqq.os.MqqHandler;

public class lmt
  extends TimerTask
{
  public lmt(FraudTipsBar paramFraudTipsBar)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    FraudTipsBar.a(a).post(new lmu(this));
  }
}
