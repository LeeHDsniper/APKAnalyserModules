import android.content.Context;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.statistics.StatisticCollector;

public class hct
  implements Runnable
{
  public hct(BaseApplicationImpl paramBaseApplicationImpl, Context paramContext, int paramInt, String paramString) {}
  
  public void run()
  {
    if ("Success".equals(BaseApplicationImpl.sInjectResult)) {
      StatisticCollector.a(jdField_a_of_type_AndroidContentContext).a("", "actNvwaInstall", jdField_a_of_type_Int, jdField_a_of_type_JavaLangString);
    }
  }
}
