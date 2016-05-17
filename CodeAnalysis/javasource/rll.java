import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.DPCObserver;
import com.tencent.mobileqq.app.DeviceProfileManager.DpcNames;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.RichMediaStrategy.OldEngineDPCProfile;

public class rll
  implements DeviceProfileManager.DPCObserver
{
  public rll(RichMediaStrategy.OldEngineDPCProfile paramOldEngineDPCProfile)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      String str = DeviceProfileManager.a().a(DeviceProfileManager.DpcNames.HttpTimeoutParam.name());
      a.a(str);
    }
  }
}
