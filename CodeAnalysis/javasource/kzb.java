import android.os.Bundle;
import com.tencent.mobileqq.activity.aio.item.PAWeatherItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import mqq.observer.BusinessObserver;

class kzb
  implements BusinessObserver
{
  kzb(kza paramKza)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle)
  {
    if (!paramBoolean) {
      ReportController.b(a.a.a, "P_CliOper", "weather_public_account", "", "weather_public_account", "weather_expose_fail", 0, 0, "", "", "", "");
    }
  }
}
