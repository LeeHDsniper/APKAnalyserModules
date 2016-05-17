import android.os.Bundle;
import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.observer.VipGifObserver;

public class lvh
  extends VipGifObserver
{
  public lvh(MainAssistObserver paramMainAssistObserver)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle)
  {
    if ((paramInt == 0) && (paramBoolean == true)) {
      MainAssistObserver.a(a);
    }
  }
}
