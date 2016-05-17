import android.content.res.Resources;
import com.tencent.common.app.AppInterface;
import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory;
import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory.HBCustomizeStrategy;
import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory.RedPacketInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.app.MobileQQ;

public class kqb
  implements CustomizeStrategyFactory.HBCustomizeStrategy
{
  private AppInterface a;
  
  public kqb(AppInterface paramAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramAppInterface;
  }
  
  public void a(CustomizeStrategyFactory.RedPacketInfo paramRedPacketInfo)
  {
    if (paramRedPacketInfo == null) {
      return;
    }
    Resources localResources = a.getApplication().getResources();
    if (jdField_a_of_type_Boolean) {}
    for (int i = 2130841199;; i = 2130841198)
    {
      jdField_a_of_type_AndroidGraphicsBitmap = CustomizeStrategyFactory.a(localResources, i);
      CustomizeStrategyFactory.a().a(paramRedPacketInfo);
      return;
    }
  }
}
