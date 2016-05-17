import android.os.Bundle;
import android.os.Handler;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.observer.BusinessObserver;

public class lja
  implements BusinessObserver
{
  public lja(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle)
  {
    if (paramBundle != null)
    {
      paramInt = paramBundle.getInt("update_type");
      if (paramInt != 2) {}
    }
    else
    {
      return;
    }
    if (paramInt == 1) {}
    a.a.sendEmptyMessage(2);
  }
}
