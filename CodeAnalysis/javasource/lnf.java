import com.tencent.mobileqq.activity.aio.AIOTipsController;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.List;

public class lnf
  implements Runnable
{
  public lnf(TipsManager paramTipsManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (TipsManager.a(a) != null) {
      TipsManager.a(a).a();
    }
    TipsManager.a(a, null);
    if (a.a != null) {
      a.a.clear();
    }
  }
}
