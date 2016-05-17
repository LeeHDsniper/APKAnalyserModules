import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.automator.step.GetTbsSwitchInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.smtt.sdk.QbSdk;

public class nib
  implements Runnable
{
  public nib(GetTbsSwitchInfo paramGetTbsSwitchInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    QbSdk.isX5DisabledSync(BaseApplicationImpl.getContext());
  }
}
