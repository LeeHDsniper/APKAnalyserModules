import com.tencent.common.app.AppInterface;
import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory.HBCustomizeStrategy;
import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory.RedPacketInfo;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kqc
  implements CustomizeStrategyFactory.HBCustomizeStrategy
{
  private AppInterface a;
  
  public kqc(AppInterface paramAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramAppInterface;
  }
  
  public void a(CustomizeStrategyFactory.RedPacketInfo paramRedPacketInfo)
  {
    if (paramRedPacketInfo == null) {
      return;
    }
    ThreadManager.a(new kqd(this, paramRedPacketInfo), 5, null, true);
  }
}
