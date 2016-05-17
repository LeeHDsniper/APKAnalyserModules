import com.tencent.mobileqq.app.CoreService;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.DpcNames;
import com.tencent.mobileqq.app.GuardManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticHitRateCollector;

public class mxn
  extends myg
{
  private String b;
  
  public mxn()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_JavaLangString = null;
  }
  
  protected void a()
  {
    boolean bool2 = true;
    super.a();
    if (jdField_b_of_type_Long >= 3L)
    {
      if (a.d == null) {
        break label134;
      }
      bool1 = true;
      a.a(bool1, new String[] { "com.tencent.mobileqq:qzone", jdField_b_of_type_JavaLangString });
      jdField_b_of_type_Long = 0L;
      if (!bool1) {
        a.a(4, null);
      }
    }
    if ((c >= 15L) && (!DeviceProfileManager.a().a(DeviceProfileManager.DpcNames.disable_qzone_kill.name()))) {
      if (a.d == null) {
        break label139;
      }
    }
    label134:
    label139:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      a.a(bool1, "com.tencent.mobileqq:qzone");
      StatisticHitRateCollector.a().d(StatisticHitRateCollector.a());
      c = 0L;
      return;
      bool1 = false;
      break;
    }
  }
  
  protected void a(String paramString)
  {
    if (!"com.tencent.mobileqq".equals(paramString)) {
      a.a(3, paramString);
    }
  }
  
  protected void b(String paramString)
  {
    super.b(paramString);
    CoreService.a();
    a.e();
    a.d = "com.tencent.mobileqq";
  }
  
  protected void c(String paramString)
  {
    jdField_b_of_type_JavaLangString = paramString;
  }
  
  protected void d(String paramString)
  {
    if ("com.tencent.mobileqq".equals(paramString)) {
      a.a(4, null);
    }
  }
}
