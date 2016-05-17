import android.util.Log;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.startup.director.StartupDirector;
import com.tencent.mobileqq.startup.step.NewRuntime;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.statistics.UnifiedMonitor;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import java.util.HashMap;

public class rdn
  implements Runnable
{
  public rdn(StartupDirector paramStartupDirector, long paramLong1, long paramLong2, long paramLong3, long paramLong4, long paramLong5, long paramLong6) {}
  
  public void run()
  {
    Object localObject;
    QQAppInterface localQQAppInterface;
    if (BaseApplicationImpl.i == 1)
    {
      if (jdField_a_of_type_Long > 0L) {
        StatisticCollector.a(BaseApplicationImpl.a).a(null, "actLoginA", true, jdField_a_of_type_Long, 0L, null, null);
      }
      if (b > 0L)
      {
        localObject = BaseApplicationImpl.a.a();
        if ((localObject != null) && ((localObject instanceof QQAppInterface)))
        {
          localQQAppInterface = (QQAppInterface)localObject;
          if (b != 2201L) {
            break label453;
          }
          localObject = "1";
          ReportController.b(localQQAppInterface, "CliOper", "", "", "0X80064F6", "0X80064F6", 0, 0, (String)localObject, "", "", "");
        }
      }
      if (c > 0L)
      {
        Log.i("AutoMonitor", "ActionLoginM, cost=" + d);
        localObject = new HashMap();
        ((HashMap)localObject).put("cost", d + "");
        StatisticCollector.a(BaseApplicationImpl.a).a(null, "actLoginM", true, d, 0L, (HashMap)localObject, null);
      }
      if ((e > 0L) && (f < 30000L))
      {
        Log.i("AutoMonitor", "ActionLoginS, cost=" + f);
        localObject = new HashMap();
        ((HashMap)localObject).put("cost", f + "");
        StatisticCollector.a(BaseApplicationImpl.a).a(null, "actLoginS", true, f, 0L, (HashMap)localObject, null);
      }
      localQQAppInterface = (QQAppInterface)BaseApplicationImpl.a.a();
      localObject = localQQAppInterface.getAccount();
      if ((localObject != null) && (((String)localObject).length() != 0)) {
        break label476;
      }
      localObject = "0";
    }
    label453:
    label476:
    for (;;)
    {
      ReportController.a(localQQAppInterface, "P_CliOper", "Vip_login_upload", "", "upload", "report", 0, 0, AppSetting.a(BaseApplicationImpl.a, (String)localObject), "", "", "");
      if ("Success".equals(BaseApplicationImpl.sInjectResult)) {
        UnifiedMonitor.a().a();
      }
      localObject = new HashMap();
      ((HashMap)localObject).put("result", NewRuntime.jdField_a_of_type_Long + "");
      ((HashMap)localObject).put("device", DeviceInfoUtil.d());
      ((HashMap)localObject).put("osVersion", DeviceInfoUtil.e());
      StatisticCollector.a(BaseApplicationImpl.a).a(null, "LinearAllocReplace", true, 0L, 0L, (HashMap)localObject, null);
      return;
      if (b == 2200L)
      {
        localObject = "3";
        break;
      }
      localObject = "2";
      break;
    }
  }
}
