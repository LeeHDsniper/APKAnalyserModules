import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.soso.SosoInterface.OnLocationListener;
import com.tencent.mobileqq.earlydownload.EarlyDownloadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import java.util.HashMap;

public final class nmi
  implements Runnable
{
  public nmi(SosoInterface.OnLocationListener paramOnLocationListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    HashMap localHashMap = new HashMap();
    if ((a.b != null) && (a.b.length() > 0)) {
      localHashMap.put("param_caller", a.b);
    }
    localHashMap.put("param_useCache", Boolean.toString(Boolean.TRUE.booleanValue()));
    String str2 = EarlyDownloadManager.a();
    StatisticCollector localStatisticCollector = StatisticCollector.a(BaseApplicationImpl.getContext());
    if (a.g) {}
    for (String str1 = "actSosoLocationCache";; str1 = "actSosoRawDataCache")
    {
      localStatisticCollector.a(str2, str1, true, 0L, 0L, localHashMap, "");
      return;
    }
  }
}
