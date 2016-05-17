import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;

public class req
  implements Runnable
{
  public req(StatisticCollector paramStatisticCollector, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      SharedPreferences localSharedPreferences = StatisticCollector.a().getSharedPreferences("crashcontrol", 0);
      if ((localSharedPreferences != null) && (localSharedPreferences.getBoolean("shouldStopMsf", false)))
      {
        jdField_a_of_type_ComTencentMobileqqStatisticsStatisticCollector.a(jdField_a_of_type_JavaLangString, "actKillMsf", true, 0L, 0L, null, "");
        localSharedPreferences.edit().putBoolean("shouldStopMsf", false).commit();
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
}
