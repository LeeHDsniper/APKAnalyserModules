import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.statistics.StatisticCollector;
import java.util.HashMap;

public class hcr
  implements Runnable
{
  public hcr(BaseApplicationImpl paramBaseApplicationImpl, int paramInt, String paramString) {}
  
  public void run()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("param_retryIndex", Integer.toString(jdField_a_of_type_Int));
    localHashMap.put("param_uin", jdField_a_of_type_JavaLangString);
    StatisticCollector.a(BaseApplicationImpl.a()).a(jdField_a_of_type_JavaLangString, "PcActiveSuccB", true, 0L, 0L, localHashMap, "", true);
  }
}
