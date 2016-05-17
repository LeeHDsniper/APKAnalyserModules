import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.DPCObserver;
import com.tencent.mobileqq.app.DeviceProfileManager.DpcNames;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.ProtoReqManager;
import com.tencent.mobileqq.transfile.RichMediaStrategy;

public class rli
  implements DeviceProfileManager.DPCObserver
{
  public rli(ProtoReqManager paramProtoReqManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean)
  {
    if (paramBoolean) {
      RichMediaStrategy.a(DeviceProfileManager.a().a(DeviceProfileManager.DpcNames.RichProReqCfg.name()));
    }
  }
}
